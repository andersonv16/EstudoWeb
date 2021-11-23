/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Anders
 */
public class Conecta {

        public static Connection getConexao() throws SQLException, ClassNotFoundException{
        Connection con = null;
        String serverName = "localhost";
        String myDatabase = "comercio";
        
        String username = "root";
        String password = "root";
        
        String driveName = "com.mysql.jdbc.Driver";
        Class.forName(driveName);
        
        String url = "jdbc:mysql://" + serverName + "/" + myDatabase;
        con =   DriverManager.getConnection(url, username, password);
        
 
        return con;
        }
        
    
}
