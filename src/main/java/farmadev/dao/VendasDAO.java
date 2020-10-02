
package farmadev.dao;

import farmadev.db.ConexaoDB;
import farmadev.entidade.ItensVenda;
import farmadev.entidade.Produto;
import farmadev.entidade.Venda;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class VendasDAO {
    
     public static List<ItensVenda> listarItens(int VENDA) {
        List<ItensVenda> ItensVenda = new ArrayList<>();
        boolean ok = false;
        Connection con;
        try {

            con = ConexaoDB.getConexao();
            String sql = " SELECT* FROM PRODUTO , ITENS_VENDA ,IMAGENS where PRD_ID = IVN_PRD_ID AND PRD_ID = IMG_PRD_ID AND IVN_VND_ID ="+VENDA;
                    
            PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                  String nome = rs.getString("PRD_NOME");
                int produto = rs.getInt("IVN_PRD_ID");
                int quantidade = rs.getInt("IVN_QUANTIDADE");
                double valor = rs.getDouble("PRD_VALOR_UNIT");
                double total = rs.getDouble("IVN_TOTAL");
                String data = "";
                 String imagem = rs.getString("IMG_URL");
              ItensVenda.add(new ItensVenda( produto,nome, quantidade, valor, total, data, imagem));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ItensVenda;
    }
     
     
             
               public static void gerarVenda(Venda Venda) {
       
        boolean ok = false;
        Connection con;
        try { con = ConexaoDB.getConexao();
           String sql = "insert into VENDA values (default,?,?,CURDATE())";
            PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, Venda.getCpf());
            ps.setDouble(2, Venda.getTotal());
            ps.executeUpdate();
             ResultSet rs = ps.getGeneratedKeys();

            
       
                   } catch (SQLException ex) {
            Logger.getLogger(ProdutosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
     
    }

   
}
