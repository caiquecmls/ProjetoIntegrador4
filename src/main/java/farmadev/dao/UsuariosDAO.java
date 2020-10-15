/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farmadev.dao;

import farmadev.db.ConexaoDB;
import farmadev.entidade.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author diego
 */
public class UsuariosDAO {

    public static List<Usuario> ListarUsuarios(String buscar) {
        List<Usuario> Usuario = new ArrayList<>();
        boolean ok = false;
        Connection con;
        String a = null;

        try {
            con = ConexaoDB.getConexao();
            String sql = "SELECT* FROM USUARIOSISTEMA where USU_USUARIO like '%" + buscar + "%' or  USU_NOME LIKE '%" + buscar + "%' ORDER BY USU_USUARIO;";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("USU_ID"));
                String nome = rs.getString("USU_NOME");
                String usuario = rs.getString("USU_USUARIO");
                String senha = rs.getString("USU_SENHA");
                String perfil = rs.getString("USU_PERFIL");
                String status = rs.getString("USU_STATUS");

                Usuario.add(new Usuario(id, nome, usuario, senha, perfil, status));

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return Usuario;
    }
    
    public static Usuario Logar ( String usuario) {
        Usuario Usuario = null;
        Connection con;
        try {

            con = ConexaoDB.getConexao();
            String sql = " SELECT* FROM USUARIOSISTEMA where USU_USUARIO = '" + usuario+"';";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("USU_ID"));
                String nome = rs.getString("USU_NOME");
                String usu = rs.getString("USU_USUARIO");
                String senha = rs.getString("USU_SENHA");
                String perfil = rs.getString("USU_PERFIL");
                String status = rs.getString("USU_STATUS");

                Usuario = new Usuario(id, nome, usu, senha, perfil, status);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Usuario;
    }

    public static boolean AtualizarStatusUsuarios(String ID, String Status) {
        boolean ok = false;
        Connection con;
        try {
            con = ConexaoDB.getConexao();

            String sql = "update USUARIOSISTEMA set USU_STATUS = '" + Status + "' where USU_ID ='" + ID + "';";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
            ok = true;

        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return ok;
    }

    public static Usuario BuscarUsuario(int ID) {
        Usuario Usuario = null;
        Connection con;
        try {

            con = ConexaoDB.getConexao();
            String sql = " SELECT* FROM USUARIOSISTEMA where USU_ID = " + ID;

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("USU_ID"));
                String nome = rs.getString("USU_NOME");
                String usuario = rs.getString("USU_USUARIO");
                String senha = rs.getString("USU_SENHA");
                String perfil = rs.getString("USU_PERFIL");
                String status = rs.getString("USU_STATUS");

                Usuario = new Usuario(id, nome, usuario, senha, perfil, status);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Usuario;
    }

    public static boolean update(Usuario usuario) {
        boolean ok = false;
        Connection con;
        try {
            con = ConexaoDB.getConexao();

            String sql = "update  USUARIOSISTEMA set USU_NOME=? ,USU_USUARIO=?, USU_PERFIL =? , USU_STATUS=? where USU_ID=? ;";//+ID;
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getUsuario());
            ps.setString(3, usuario.getPerfil());
            ps.setString(4, usuario.getStatus());
            ps.setInt(5, usuario.getId());
            ps.executeUpdate();

            con.close();
            ok = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ok;
    }

    public static boolean reset(Usuario usuario) {
        boolean ok = false;
        Connection con;
        try {
            con = ConexaoDB.getConexao();

            String sql = "update  USUARIOSISTEMA set USU_SENHA =? where USU_ID=? ;";//+ID;
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, "Admin");
            ps.setInt(2, usuario.getId());
            ps.executeUpdate();

            con.close();
            ok = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ok;
    }
    
    public static boolean cadastrarUsuario(Usuario usuario) {
        boolean ok = false;
        int ID = 0;
        Connection con;

        try { con = ConexaoDB.getConexao();
            
            String sql = "insert into  USUARIOSISTEMA value (default,?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getUsuario());
            ps.setString(3, usuario.encodeSenha(usuario.getSenha()));
            ps.setString(4, usuario.getPerfil());            
            ps.setString(5, usuario.getStatus());
            ps.execute();
       
            ok = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ok;
    }
}
