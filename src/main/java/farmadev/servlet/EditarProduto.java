/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farmadev.servlet;

import farmadev.dao.ProdutosDAO;
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
       List<Produto> produto = ProdutosDAO.BuscarProdutos(pid);  
        request.setAttribute("produto", produto);
       
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/atualizarProduto.jsp");
        dispatcher.forward(request,response);
        
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
              String descricao = request.getParameter("PRD_DESCRICAO");
        int quantidade = Integer.parseInt(request.getParameter("PRD_QUANTIDADE"));
        double valor = Double.parseDouble(request.getParameter("PRD_VALOR_UNIT"));
        String categoria= request.getParameter("PRD_CATEGORIA");
        String pergunta= request.getParameter("PRD_MSG");
        String imagem = request.getParameter("urlimagemBase64");


        Produto e = new Produto( sid , descricao, quantidade, valor, categoria,pergunta, imagem );
                
       boolean ok = false;
               ok=ProdutosDAO.update(e);
       
        if (ok =! false) {
            request.setAttribute("/sucesso.jpg", true);
                  
        } else {
            request.setAttribute("/erro.jpg", true);
        }

        out.close();
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ListarProdutos");
            dispatcher.forward(request,response);

      
    }

 


}
