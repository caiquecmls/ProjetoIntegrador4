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
@WebServlet(name = "ListarUsuarios", urlPatterns = {"/ListarUsuarios"})
public class ListarUsuarios extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Filtro = request.getParameter("Filtro");
        List<Usuario> usuario = UsuariosDAO.ListarUsuarios(Filtro);
        request.setAttribute("usuario", usuario);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/listarusuarios.jsp");
        dispatcher.forward(request, response);
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Status = request.getParameter("STATUS");
        String Id = request.getParameter("USU_ID");
       boolean ok = UsuariosDAO.AtualizarStatusUsuarios(Id,Status);
        
        if (ok){
             response.sendRedirect("ListarUsuarios");}
        else { response.sendRedirect("Erro.jsp");}
       
    }

}
