/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farmadev.servlet;

import farmadev.dao.ProdutosDAO;
import farmadev.dao.VendasDAO;
import farmadev.entidade.Imagem;
import farmadev.entidade.ItensVenda;
import farmadev.entidade.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "Carrinho", urlPatterns = {"/Carrinho"})
public class Carrinho extends HttpServlet {

    public static List<Produto> itens = ListarProdutos.getItem();


    public static List<Produto> getItens() {
        return itens;
    }



    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int produto = Integer.parseInt(request.getParameter("PRD_ID"));

        List<Produto> A = null;


        if (itens == null) {
            A = new ArrayList<>();
    
        } else {
            A = itens;
  
        }

        itens = ProdutosDAO.BuscarProdutoscarrinho(produto, A);
    
        request.setAttribute("itens", A);
         //request.setAttribute("imagens", I);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Carrinho.jsp");
        dispatcher.forward(request, response);
        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
