/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farmadev.dao;

import farmadev.db.ConexaoDB;
import farmadev.entidade.Produto;
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
 * @author Renato
 */
public class ProdutosDAO {
    
        public static boolean cadastrarProduto(Produto produto) {
        boolean ok = false;
        int ID=0;
        Connection con;

       try {
            con = ConexaoDB.getConexao();
           String sql = "insert into PRODUTO values (default,?,?,?,?,'Ativo')";
            PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, produto.getDescricao());
            ps.setInt(2, produto.getQuantidade());
            ps.setDouble(3, produto.getValor());
            ps.setString(4, produto.getCategoria());
            ps.executeUpdate();
            
           ResultSet rs = ps.getGeneratedKeys();

           while (rs.next()) {
           ID = Integer.parseInt(String.valueOf((rs.getLong(1))));
           String sql2 = "insert into PERGUNTAS values (default,?,?)";
           PreparedStatement ps2 = con.prepareStatement(sql2);
           ps2.setString(1,produto.getPergunta());
           ps2.setInt(2,ID);
           ps2.execute();
            String sql3 = "INSERT INTO IMAGENS VALUES (default,'TESTE',?,?);";
           PreparedStatement ps3 = con.prepareStatement(sql3);
           ps3.setString(2,produto.getImagem());
           ps3.setInt(1,ID);
           ps3.execute();     
            }
           
       
            ok = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ok;
    }
         public static boolean excluir(String id) {
        boolean ok = false;
        Connection con;
        try {
            con = ConexaoDB.getConexao();

            String sql = "update PRODUTO set PRD_STATUS = 'Inativo' where PRD_ID ='" + id + "';";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
             ok = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ok;
    }
    public static List<Produto> BuscarProdutos(int ID) {
        List<Produto> produto = new ArrayList<>();
        boolean ok = false;
        Connection con;
        try {

            con = ConexaoDB.getConexao();
            String sql = " SELECT* FROM PRODUTO, PERGUNTAS ,IMAGENS where PRD_ID = PRG_PRD_ID AND PRD_ID = IMG_PRD_ID AND PRD_ID ="+ID;
                    //"select A.PRD_ID, A.PRD_DESCRICAO, A.PRD_QUANTIDADE, A.PRD_VALOR_UNIT, A.PRD_CATEGORIA  from PRODUTO A, PERGUNTAS B where A.PRD_ID = B.PRG_PRD_ID AND A.PRD_ID ="+ID;//+ID;
            PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("PRD_ID"));
                String descricao = rs.getString("PRD_DESCRICAO");
                int quantidade = rs.getInt("PRD_QUANTIDADE");
                double valor = rs.getDouble("PRD_VALOR_UNIT");
                String categoria = rs.getString("PRD_CATEGORIA");
                String pergunta = rs.getString("PRG_PERGUNTA");
                 String imagem = rs.getString("IMG_URL");
                 
                produto.add(new Produto( id, descricao, quantidade, valor, categoria,pergunta,imagem));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return produto;
    }

    public static List<Produto> listarProdutos() {
        List<Produto> produtos = new ArrayList<>();
        boolean ok = false;
        Connection con;
        String a = null;
        
        try {
            con = ConexaoDB.getConexao();
            String sql = "select * from produto where prd_status <>'Inativo'; ";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("PRD_ID"));            
                String descricao = rs.getString("PRD_DESCRICAO");
                int quantidade = rs.getInt("PRD_QUANTIDADE");
                double valor = rs.getDouble("PRD_VALOR_UNIT");
                String categoria = rs.getString("PRD_CATEGORIA");
                produtos.add(new Produto(id, descricao, quantidade, valor, categoria));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return produtos;
    }
    
     public static Produto produtoSelecionado(int ID) {
   Produto p = new Produto("",2,1,"","","");
        boolean ok = false;
        Connection con;
        try { con = ConexaoDB.getConexao();
            String sql = "select * from PRODUTO where PRD_ID = " + ID;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
             while (rs.next()) {
            String descricao = rs.getString("PRD_DESCRICAO");
            int quantidade = Integer.parseInt(rs.getString("PRD_QUANTIDADE"));
            float valor = Float.parseFloat(rs.getString("PRD_VALOR_UNIT"));
            String categoria = rs.getString("PRD_CATEGORIA");
            String pergunta = rs.getString("PRD_MSG");
            String imagem = rs.getString("PRD_IMG");

            Produto produtos = new Produto(ID,descricao, quantidade, valor, categoria,pergunta,imagem);
            
            return produtos;
        }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        
return p;
    }
     
     public static boolean update(Produto e) {
        boolean ok = false;
        Connection con;
        try {
            con = ConexaoDB.getConexao();
           
            String sql = "update  PRODUTO set PRD_DESCRICAO=?,PRD_QUANTIDADE=?,PRD_VALOR_UNIT=?, PRD_CATEGORIA=? where PRD_ID=? ;";//+ID;
            PreparedStatement ps = con.prepareStatement(sql);        
            ps.setString(1, e.getDescricao());
            ps.setInt(2, e.getQuantidade());
            ps.setDouble(3, e.getValor());
            ps.setString(4, e.getCategoria());
            ps.setInt(5, e.getId());
            ps.executeUpdate();
           
            String sql2 = "update  PERGUNTAS set PRG_PERGUNTA=? where PRG_PRD_ID=? ;";//+ID;
            PreparedStatement ps2 = con.prepareStatement(sql2);        
            ps2.setString(1, e.getPergunta());
            ps2.setInt(2, e.getId());           
            ps2.executeUpdate();
            
            String sql3 = "update  IMAGENS set IMG_URL=? where IMG_PRD_ID=? ;";//+ID;
            PreparedStatement ps3 = con.prepareStatement(sql3);        
            ps3.setString(1, e.getImagem());
            ps3.setInt(2, e.getId());           
            ps3.executeUpdate();          
            
            con.close();
             ok = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ok;
    }
    
    
}
