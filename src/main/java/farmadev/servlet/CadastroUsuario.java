/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farmadev.servlet;

import farmadev.dao.UsuariosDAO;
import farmadev.entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author diego
 */
@WebServlet(name = "CadastroUsuario", urlPatterns = {"/CadastroUsuario"})
public class CadastroUsuario extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");    
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
 
        String nome = request.getParameter("USU_NOME");
        String usuario = request.getParameter("USU_USUARIO");
        String senha = request.getParameter("USU_SENHA");
        String perfil = request.getParameter("USU_PERFIL");
        String status = request.getParameter("USU_STATUS");

        Usuario Usuario = new Usuario(nome, usuario, senha, perfil, status);

        Boolean ok = UsuariosDAO.cadastrarUsuario(Usuario);

        if (ok) {
            response.sendRedirect("ListarUsuarios");
        } else {
            response.sendRedirect("erro.jsp");
        }
     }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
}
