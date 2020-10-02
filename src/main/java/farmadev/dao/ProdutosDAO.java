/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farmadev.dao;

import farmadev.db.ConexaoDB;
import farmadev.entidade.Produto;
import farmadev.entidade.Perguntas;
import farmadev.entidade.Imagem;
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

    public static boolean cadastrarProduto(Produto produto, String imagem1, String imagem2, String imagem3, Perguntas pergunta1, Perguntas pergunta2, Perguntas pergunta3) {
        boolean ok = false;
        int ID = 0;
        Connection con;

        try {
            con = ConexaoDB.getConexao();
            String sql = "insert into PRODUTO values (default,?,?,?,?,?,?,?,'Ativo')";
            PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, produto.getNome());
            ps.setString(2, produto.getDescricao());
            ps.setInt(3, produto.getQuantidade());
            ps.setDouble(4, produto.getValor());
            ps.setString(5, produto.getCategoria());
            ps.setString(6, produto.getPromocao());
            ps.setString(7, produto.getDesconto());
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();

            while (rs.next()) {
                ID = Integer.parseInt(String.valueOf((rs.getLong(1))));
                String sql2 = "insert into PERGUNTAS values (default,?,?,?)";
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setString(1, pergunta1.getPergunta());
                ps2.setString(2, pergunta1.getResposta());
                ps2.setInt(3, ID);
                ps2.execute();

                ps2.setString(1, pergunta2.getPergunta());
                ps2.setString(2, pergunta2.getResposta());
                ps2.setInt(3, ID);
                ps2.execute();

                ps2.setString(1, pergunta3.getPergunta());
                ps2.setString(2, pergunta3.getResposta());
                ps2.setInt(3, ID);
                ps2.execute();

                String sql3 = "INSERT INTO IMAGENS VALUES (default,?,?,?);";
                PreparedStatement ps3 = con.prepareStatement(sql3);
                ps3.setString(1, produto.getNome());
                ps3.setString(3, imagem1);
                ps3.setInt(2, ID);
                ps3.execute();

                ps3.setString(1, produto.getNome());
                ps3.setString(3, imagem2);
                ps3.setInt(2, ID);
                ps3.execute();

                ps3.setString(1, produto.getNome());
                ps3.setString(3, imagem3);
                ps3.setInt(2, ID);
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

    public static Produto BuscarProdutos(int ID) {
        Produto produto = null;
        Connection con;
        try {

            con = ConexaoDB.getConexao();
            String sql = " SELECT* FROM PRODUTO where PRD_ID = " + ID;

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("PRD_ID"));
                String nome = rs.getString("PRD_NOME");
                String descricao = rs.getString("PRD_DESCRICAO");
                int quantidade = rs.getInt("PRD_QUANTIDADE");
                double valor = rs.getDouble("PRD_VALOR_UNIT");
                String categoria = rs.getString("PRD_CATEGORIA");
                String promocao = rs.getString("PRD_PROMOCAO");
                String desconto = rs.getString("PRD_DESCONTO");

                produto = new Produto(id, nome, descricao, quantidade, valor, categoria, desconto, promocao);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return produto;
    }

    public static List<Perguntas> BuscarPerguntas(int ID) {
        ArrayList<Perguntas> perguntas = new ArrayList();
        boolean ok = false;
        Connection con;
        try {

            con = ConexaoDB.getConexao();
            String sql = " SELECT* FROM PERGUNTAS where PRG_PRD_ID =" + ID;

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int id = rs.getInt("PRG_ID");
                String pergunta = rs.getString("PRG_PERGUNTA");
                String resposta = rs.getString("PRG_RESPOSTA");

                perguntas.add(new Perguntas(id, pergunta, resposta));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return perguntas;
    }

    public static List<Imagem> BuscarImagens(int ID) {
        List<Imagem> imagens = new ArrayList();
        boolean ok = false;
        Connection con;

        try {
            con = ConexaoDB.getConexao();
            String sql = "SELECT* FROM IMAGENS where IMG_PRD_ID =" + ID;

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int id = rs.getInt("IMG_ID");
                String imagem = rs.getString("IMG_URL");

                imagens.add(new Imagem(id, imagem));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return imagens;
    }

    public static List<Produto> listarProdutos(String buscar, String Cat) {
        List<Produto> produtos = new ArrayList<>();
        boolean ok = false;
        Connection con;
        String a = null;

        try {
            con = ConexaoDB.getConexao();
            String sql = "SELECT* FROM PRODUTO,IMAGENS where PRD_ID = IMG_PRD_ID and  prd_status <>'Inativo' and prd_nome like '%" + buscar + "%' and  PRD_CATEGORIA like '%"
                    + Cat + "%'  GROUP BY PRD_ID;";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("PRD_ID"));
                String nome = rs.getString("PRD_NOME");
                String descricao = rs.getString("PRD_DESCRICAO");
                int quantidade = rs.getInt("PRD_QUANTIDADE");
                double valor = rs.getDouble("PRD_VALOR_UNIT");
                String categoria = rs.getString("PRD_CATEGORIA");
                String imagem = rs.getString("IMG_URL");
                String desconto = rs.getString("PRD_DESCONTO");
                String promocao = rs.getString("PRD_PROMOCAO");
                produtos.add(new Produto(id, nome, descricao, quantidade, valor, categoria, desconto, promocao, imagem));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return produtos;
    }

    public static List<Produto> listarPromocoes() {
        List<Produto> produtos = new ArrayList<>();
        boolean ok = false;
        Connection con;
        String a = null;

        try {
            con = ConexaoDB.getConexao();
            String sql = "SELECT* FROM PRODUTO,IMAGENS where PRD_ID = IMG_PRD_ID and  prd_status <>'Inativo' and PRD_PROMOCAO = 'Sim'  GROUP BY PRD_ID;";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("PRD_ID"));
                String nome = rs.getString("PRD_NOME");
                String descricao = rs.getString("PRD_DESCRICAO");
                int quantidade = rs.getInt("PRD_QUANTIDADE");
                double valor = rs.getDouble("PRD_VALOR_UNIT");
                String categoria = rs.getString("PRD_CATEGORIA");
                String imagem = rs.getString("IMG_URL");
                String desconto = rs.getString("PRD_DESCONTO");
                String promocao = rs.getString("PRD_PROMOCAO");
                produtos.add(new Produto(id, nome, descricao, quantidade, valor, categoria, desconto, promocao, imagem));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return produtos;
    }

    public static Produto produtoSelecionado(int ID) {
        Produto p = new Produto("", "", 2, 1, "", "", "");
        boolean ok = false;
        Connection con;
        try {
            con = ConexaoDB.getConexao();
            String sql = "SELECT* FROM PRODUTO,IMAGENS, perguntas where PRD_ID = IMG_PRD_ID and prd_id=prg_prd_id and PRD_ID = " + ID + "  GROUP BY PRD_ID;";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String nome = rs.getString("PRD_NOME");
                String descricao = rs.getString("PRD_DESCRICAO");
                int quantidade = Integer.parseInt(rs.getString("PRD_QUANTIDADE"));
                float valor = Float.parseFloat(rs.getString("PRD_VALOR_UNIT"));
                String categoria = rs.getString("PRD_CATEGORIA");
                String pergunta = rs.getString("PRD_MSG");
                String resposta = rs.getString("PRD_res");
                String imagem = rs.getString("PRD_IMG");
                String desconto = rs.getString("PRD_DESCONTO");
                String promocao = rs.getString("PRD_PROMOCAO");

                Produto produtos = new Produto(ID, nome, descricao, quantidade, valor, categoria, desconto, promocao, imagem);

                return produtos;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

        return p;
    }

    public static boolean update(Produto e, Imagem imagem, Perguntas pergunta1, Perguntas pergunta2, Perguntas pergunta3) {
        boolean ok = false;
        Connection con;
        try {
            con = ConexaoDB.getConexao();

            String sql = //"update  PRODUTO set PRD_NOME='AAA' , PRD_DESCRICAO='AAA' , PRD_QUANTIDADE =10 , PRD_VALOR_UNIT =10 , PRD_CATEGORIA ='AAA',  PRD_PROMOCAO ='Sim' , PRD_DESCONTO ='10%' where PRD_ID=11 ;";
                    "update  PRODUTO set PRD_NOME=? , PRD_DESCRICAO=? , PRD_QUANTIDADE =? , PRD_VALOR_UNIT =? , PRD_CATEGORIA =?,  PRD_PROMOCAO =? , PRD_DESCONTO =? where PRD_ID=? ;";//+ID;
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, e.getNome());
            ps.setString(2, e.getDescricao());
            ps.setInt(3, e.getQuantidade());
            ps.setDouble(4, e.getValor());
            ps.setString(5, e.getCategoria());
            ps.setString(6, e.getPromocao());
            ps.setString(7, e.getDesconto());
            ps.setInt(8, e.getId());
            ps.executeUpdate();

            String sql2 = "update  PERGUNTAS set PRG_PERGUNTA= ? , PRG_RESPOSTA= ? where PRG_ID= ? ;";//+ID;
            PreparedStatement ps1 = con.prepareStatement(sql2);
            ps1.setString(1, pergunta2.getPergunta());
            ps1.setString(2, pergunta2.getResposta());
            ps1.setInt(3, pergunta2.getId());
            ps1.executeUpdate();
            
            ps1.setString(1, pergunta3.getPergunta());
            ps1.setString(2, pergunta3.getResposta());
            ps1.setInt(3, pergunta3.getId());
            ps1.executeUpdate();

            ps1.setString(1, pergunta1.getPergunta());
            ps1.setString(2, pergunta1.getResposta());
            ps1.setInt(3, pergunta1.getId());
            ps1.executeUpdate();

            String sql3 = "update IMAGENS set IMG_URL=? where IMG_ID=? ;";//+ID;
            PreparedStatement ps2 = con.prepareStatement(sql3);
            ps2.setString(1, imagem.getImagem1());
            ps2.setInt(2, imagem.getId1());
            ps2.executeUpdate();

            ps2.setString(1, imagem.getImagem2());
            ps2.setInt(2, imagem.getId2());
            ps2.executeUpdate();

            ps2.setString(1, imagem.getImagem3());
            ps2.setInt(2, imagem.getId3());
            ps2.executeUpdate();
            
            con.close();
            ok = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ok;
    }

    public static List<Produto> BuscarProdutoscarrinho(int ID, List<Produto> produtos) {
        boolean ok = false;
        Connection con;
        try {

            con = ConexaoDB.getConexao();
            String sql = " SELECT* FROM PRODUTO, PERGUNTAS ,IMAGENS where PRD_ID = PRG_PRD_ID AND PRD_ID = IMG_PRD_ID AND PRD_ID =" + ID;

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("PRD_ID"));
                String nome = rs.getString("PRD_NOME");
                String descricao = rs.getString("PRD_DESCRICAO");
                int quantidade = rs.getInt("PRD_QUANTIDADE");
                double valor = rs.getDouble("PRD_VALOR_UNIT");
                String categoria = rs.getString("PRD_CATEGORIA");
                String pergunta = rs.getString("PRG_PERGUNTA");
                String resposta = rs.getString("PRG_RESPOSTA");
                String imagem = rs.getString("IMG_URL");
                String promocao = rs.getString("PRD_PROMOCAO");
                String desconto = rs.getString("PRD_DESCONTO");

                //  produtos.add(new Produto( id,nome, descricao, quantidade, valor, categoria,pergunta, resposta, imagem,desconto, promocao));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return produtos;
    }
}
