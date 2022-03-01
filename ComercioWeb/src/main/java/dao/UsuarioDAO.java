/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ander
 */
public class UsuarioDAO {
    
        public Usuario consultarUsuario (String nome, String senha){
        Usuario usuario = new Usuario();
              try{

            Connection con = Conecta.getConexao();
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM user WHERE nome = '" + nome + 
                    "' AND senha = '" + senha + "'" ;
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
            usuario.setNome(rs.getString("nome"));
            usuario.setSenha(rs.getString("senha"));
            }
            else{
            usuario.setNome("");
            usuario.setSenha ("");
            }

            rs.close();
            stmt.close();
            con.close();
                
        }
        catch (Exception e) {
        e.printStackTrace();

         }
              return usuario;
    }
        
         public String insertUsuario(Usuario usuario) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO user (nome, email, senha) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getEmail());
            ps.setString(3, usuario.getSenha());
        
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
           public String editarUsuario (Usuario usuario){
            String resp = "";
              try{
           
            Connection con = Conecta.getConexao();
            String sql = "UPDATE user SET nome = ?, senha = ? WHERE email = ?" ;
            PreparedStatement ps = con.prepareStatement(sql);
           
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getSenha());
            ps.setString(3, usuario.getEmail());
          
            ps.execute();
            ps.close();
            con.close();
            
            resp = "OK";
        }
        catch (Exception e) {
        
            resp = "Erro "+ e.toString();

         }
             return resp;
         
           }
}
