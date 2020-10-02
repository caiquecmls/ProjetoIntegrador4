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
@WebServlet(name = "EditarProduto", urlPatterns = {"/EditarProduto"})
public class EditarProduto extends HttpServlet {

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

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/atualizarProduto.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sid = Integer.parseInt(request.getParameter("PRD_ID"));
        String nome = request.getParameter("PRD_NOME");
        String descricao = request.getParameter("PRD_DESCRICAO");
        int quantidade = Integer.parseInt(request.getParameter("PRD_QUANTIDADE"));
        double valor = Double.parseDouble(request.getParameter("PRD_VALOR_UNIT"));
        String categoria = request.getParameter("PRD_CATEGORIA");
         int id_prg1 = Integer.parseInt(request.getParameter("PRG1"));
        String pergunta1 = request.getParameter("PRD_MSG1");
        String resposta1 = request.getParameter("PRD_RES1");
         int id_prg2 = Integer.parseInt(request.getParameter("PRG2"));
        String pergunta2 = request.getParameter("PRD_MSG2");
        String resposta2 = request.getParameter("PRD_RES2");
         int id_prg3 = Integer.parseInt(request.getParameter("PRG3"));
        String pergunta3 = request.getParameter("PRD_MSG3");
        String resposta3 = request.getParameter("PRD_RES3");
        int id_img1 = Integer.parseInt(request.getParameter("IMG_ID1"));
        String imagem1 = request.getParameter("base64");
        int id_img2 = Integer.parseInt(request.getParameter("IMG_ID2"));
        String imagem2 = request.getParameter("base642");
        int id_img3 = Integer.parseInt(request.getParameter("IMG_ID3"));
        String imagem3 = request.getParameter("base643");
        String desconto = request.getParameter("PRD_DESCONTO");
        String promocao = request.getParameter("PRD_PROMOCAO");
        
    
        

        Produto e = new Produto(sid, nome, descricao, quantidade, valor, categoria, desconto, promocao,imagem1);
        Perguntas Pergunta1 = new Perguntas( id_prg1, pergunta1, resposta1 );
        Perguntas Pergunta2 = new Perguntas( id_prg2, pergunta2, resposta2 );
        Perguntas Pergunta3 = new Perguntas( id_prg3, pergunta3, resposta3 );
        
        Imagem imagens = new Imagem (id_img1,imagem1, id_img2,imagem2, id_img3,imagem3);
        
            

        boolean ok = false;

        ok = ProdutosDAO.update(e ,imagens,Pergunta1,Pergunta2,Pergunta3 );
        
        if (ok){  response.sendRedirect("ListarProdutos") ;}
        
        else {response.sendRedirect("erro.jsp");}

        out.close();
    }

}
