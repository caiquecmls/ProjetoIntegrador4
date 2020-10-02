/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farmadev.servlet;

import farmadev.dao.ProdutosDAO;
import farmadev.entidade.Produto;
import farmadev.entidade.Imagem;
import farmadev.entidade.Perguntas;
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

        String nome = request.getParameter("PRD_NOME");
        String descriçao = request.getParameter("PRD_DESCRICAO");
        int quantidade = Integer.parseInt(request.getParameter("PRD_QUANTIDADE"));        
       // Integer.parseInt(request.getParameter("PRD_QUANTIDADE"));
        double valor = Double.parseDouble(request.getParameter("PRD_VALOR_UNIT"));
        String categoria = request.getParameter("PRD_CATEGORIA");
        //String status = request.getParameter("PRD_STATUS");
        //String pergunta = request.getParameter("PRD_MSG");
        //String resposta = request.getParameter("PRD_RES");
        //String imagem = request.getParameter("base64");
        
        
        String imagem1 = request.getParameter("base64");
        String imagem2 = request.getParameter("base642");
        String imagem3 = request.getParameter("base643");
        
        String pergunta1 = request.getParameter("PRD_MSG1");
        String pergunta2 = request.getParameter("PRD_MSG2");
        String pergunta3 = request.getParameter("PRD_MSG3");
        String resposta1 = request.getParameter("PRD_RES1");
        String resposta2 = request.getParameter("PRD_RES2");
        String resposta3 = request.getParameter("PRD_RES3");
       
        
        String desconto = request.getParameter("PRD_DESCONTO");
        String promocao = request.getParameter("PRD_PROMOCAO");
        
        Produto produto = new Produto(nome,descriçao, quantidade, valor, categoria,desconto, promocao); 
        Perguntas perguntaI = new Perguntas(pergunta1,resposta1);
        Perguntas perguntaII = new Perguntas(pergunta2,resposta2);
        Perguntas perguntaIII = new Perguntas(pergunta3,resposta3);
        boolean ok = ProdutosDAO.cadastrarProduto(produto,imagem1,imagem2,imagem3,perguntaI,perguntaII,perguntaIII);
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