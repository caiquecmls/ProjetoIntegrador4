/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farmadev.servlet;

import at.favre.lib.crypto.bcrypt.BCrypt;
import farmadev.dao.UsuariosDAO;
import farmadev.entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tscarton
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

   

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");
        //int id = Integer.parseInt(request.getParameter("id"));
        
        Usuario usuarioLogado = UsuariosDAO.Logar(usuario);
        
        if (usuarioLogado != null && usuarioLogado.validarSenha(senha)) {
            HttpSession sessao = request.getSession(); //&& usuarioLogado.validarSenha(senha)
            sessao.setAttribute("usuario", usuarioLogado);
            response.sendRedirect(request.getContextPath() + "/index.html");
        } else {
            request.setAttribute("msgErro", "Usuário ou senha inválido");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    
}

