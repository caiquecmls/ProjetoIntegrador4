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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Renato
 */

public class CadastroProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Empty
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //String filial = request.getParameter("PRD_FILIAL");
        String descriçao = request.getParameter("PRD_DESCRICAO");
        int quantidade = Integer.parseInt(request.getParameter("PRD_QUANTIDADE"));        
       // Integer.parseInt(request.getParameter("PRD_QUANTIDADE"));
        double valor = Double.parseDouble(request.getParameter("PRD_VALOR_UNIT"));
        String categoria = request.getParameter("PRD_CATEGORIA");
        //String status = request.getParameter("PRD_STATUS");
        String pergunta = request.getParameter("PRD_MSG");
        //String imagem = request.getParameter("PRD IMG");
        String imagem = request.getParameter("urlimagemBase64");
        Produto produto = new Produto(descriçao, quantidade, valor, categoria,pergunta, imagem);
        boolean ok = ProdutosDAO.cadastrarProduto(produto);
        PrintWriter out = response.getWriter();        
        
        String url = "";
        if (ok) {
            request.setAttribute("cadastroOK", true);
           url = "/protegido/sucesso.jsp";
       } else {
           url = "/protegido/erro.jsp";
        }
       RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request,response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}