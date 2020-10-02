/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farmadev.servlet;

import farmadev.dao.ProdutosDAO;
import static farmadev.dao.ProdutosDAO.BuscarImagens;
import static farmadev.dao.ProdutosDAO.BuscarPerguntas;
import farmadev.entidade.Imagem;
import farmadev.entidade.Perguntas;
import farmadev.entidade.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author diego
 */
@WebServlet(name = "DetalhesProdutos", urlPatterns = {"/DetalhesProdutos"})
public class DetalhesProduto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int pid = Integer.parseInt(request.getParameter("PRD_ID"));
        Produto produto = ProdutosDAO.BuscarProdutos(pid);
        List<Perguntas> perguntas = BuscarPerguntas(pid);
        Perguntas pergunta1 = perguntas.get(0);
        Perguntas pergunta2 = perguntas.get(1);
        Perguntas pergunta3 = perguntas.get(2);

        List<Imagem> imagens = BuscarImagens(pid);

        request.setAttribute("produto", produto);
        
        request.setAttribute("pergunta1", pergunta1);
        request.setAttribute("pergunta2", pergunta2);
        request.setAttribute("pergunta3", pergunta3);

        request.setAttribute("imagem1", imagens.get(0));
        request.setAttribute("imagem2", imagens.get(1));
        request.setAttribute("imagem3", imagens.get(2));

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Detalhes.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }



}
