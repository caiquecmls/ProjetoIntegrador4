/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farmadev.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tiago.bscarton
 */
public class ConexaoDB {

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexaoDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Connection getConexao() throws SQLException {
        String dbURL = "jdbc:mysql://localhost:3307/farmadev?useTimezone=true&serverTimezone=UTC";
        //"jdbc:mysql://localhost:3307/senac1?useTimezone=true&serverTimezone=UTC";
        String user = "root";
        String password = "";
        return DriverManager.getConnection(dbURL, user, password);   
    }

}