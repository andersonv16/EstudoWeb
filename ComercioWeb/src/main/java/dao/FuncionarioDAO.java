/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Funcionario;
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
public class FuncionarioDAO {
    
        public String insertFuncionario(Funcionario funcionario) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO funcionario (nome, nascimento, rg, "
                    + "cpf, cargo, endereco, estado, cep)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, funcionario.getNome());
            ps.setString(2, funcionario.getNascimento());
            ps.setString(3, funcionario.getRg());
            ps.setString(4, funcionario.getCpf());
            ps.setString(5, funcionario.getCargo());
            ps.setString(6, funcionario.getEndereco());
            ps.setString(7, funcionario.getEstado());
            ps.setString(8, funcionario.getCep());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
        
        
        public ArrayList<Funcionario> getFuncionarios(){
           ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
            try{

            Connection con = Conecta.getConexao();
        
            String sql = "SELECT * FROM funcionario ORDER BY nome";
      
           ResultSet rs = con.createStatement().executeQuery(sql);

            while (rs.next()) {
            
            lista.add(new Funcionario(rs.getString("nome"), rs.getString("nascimento"), 
                    rs.getString("rg"),rs.getString("cpf"), rs.getString("cargo"), rs.getString("endereco")
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
        
        public String editarFuncionario(Funcionario funcionario) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "Update funcionario Set nome = ?, nascimento = ?, "
                    + "rg = ?, cpf = ?, cargo = ?, endereco = ?, estado = ?, cep = ? where cpf = ?";
            PreparedStatement ps = con.prepareStatement(sql);

        
         ps.setString(1, funcionario.getNome());
            ps.setString(2, funcionario.getNascimento());
            ps.setString(3, funcionario.getRg());
            ps.setString(4, funcionario.getCpf());
            ps.setString(5, funcionario.getCargo());
            ps.setString(6, funcionario.getEndereco());
            ps.setString(7, funcionario.getEstado());
            ps.setString(8, funcionario.getCep());
             ps.setString(9, funcionario.getCpf());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
                
        public String excluirFuncionario(Funcionario funcionario) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "DELETE FROM funcionario WHERE cpf = ?";
            PreparedStatement ps = con.prepareStatement(sql);

        
            ps.setString(1, funcionario.getCpf());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
}
