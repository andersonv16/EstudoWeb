/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ander
 */
public class ClienteDAO {
    
        public String insertCliente(Cliente cliente) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO cliente (nome, nascimento, rg, "
                    + "cpf, endereco, estado, cep)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getNascimento());
            ps.setString(3, cliente.getRg());
            ps.setString(4, cliente.getCpf());
            ps.setString(5, cliente.getEndereco());
            ps.setString(6, cliente.getEstado());
            ps.setString(7, cliente.getCep());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
        
        
        public ArrayList<Cliente> getClientes(){
           ArrayList<Cliente> lista = new ArrayList<Cliente>();
            try{

            Connection con = Conecta.getConexao();
        
            String sql = "SELECT * FROM cliente ORDER BY nome";
      
           ResultSet rs = con.createStatement().executeQuery(sql);

            while (rs.next()) {
            
            lista.add(new Cliente(rs.getString("nome"), rs.getString("nascimento"), 
                    rs.getString("rg"),rs.getString("cpf"), rs.getString("endereco")
                    ,rs.getString("estado"), rs.getString("cep")));
            }
            rs.close();
        
            con.close();

        }
        catch (Exception e) {
        e.printStackTrace();

    }
    return lista;
    }
        
        public String editarCliente(Cliente cliente) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "Update cliente Set nome = ?, nascimento = ?, "
                    + "rg = ?, cpf = ?, endereco = ?, estado = ?, cep = ? where cpf = ?";
            PreparedStatement ps = con.prepareStatement(sql);

        
            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getNascimento());
            ps.setString(3, cliente.getRg());
            ps.setString(4, cliente.getCpf());
            ps.setString(5, cliente.getEndereco());
            ps.setString(6, cliente.getEstado());
            ps.setString(7, cliente.getCep());
             ps.setString(8, cliente.getCpf());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
                
        public String excluirCliente(Cliente cliente) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "DELETE FROM cliente WHERE cpf = ?";
            PreparedStatement ps = con.prepareStatement(sql);

        
            ps.setString(1, cliente.getCpf());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
}
