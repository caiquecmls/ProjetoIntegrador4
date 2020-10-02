/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farmadev.servlet;

import farmadev.dao.ProdutosDAO;
import farmadev.entidade.Imagem;
import farmadev.entidade.Produto;
//import static farmadev.servlet.Carrinho.imagens;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ListarProdutos", urlPatterns = {"/ListarProdutos"})
public class ListarProdutos extends HttpServlet {


    public static List<Produto> item = Carrinho.getItens();
    
     public static List<Produto> getItem() {
        return item;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
                  response.setContentType("text/html;charset=UTF-8");
        List<Produto> produtos = ProdutosDAO.listarProdutos("","");
        request.setAttribute("produtos", produtos);       
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/listarProdutos.jsp");
        dispatcher.forward(request,response);
        }
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Filtro = request.getParameter("Filtro");
           List<Produto> produto = ProdutosDAO.listarProdutos(Filtro,"");
        request.setAttribute("produtos", produto); 
        request.setAttribute("Buscar", Filtro);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/listarProdutos.jsp");
         dispatcher.forward(request,response);  
        processRequest(request, response);
    }


}
