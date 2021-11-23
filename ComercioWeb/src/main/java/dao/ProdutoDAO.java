/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Produto;
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
public class ProdutoDAO {
    
        public String insertProduto(Produto produto) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO produto (codigo, nome, descricao, "
                    + "categoria, fornecedor, unidade, valor)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, produto.getId());
            ps.setString(2, produto.getNome());
            ps.setString(3, produto.getDescricao());
            ps.setString(4, produto.getCategoria());
            ps.setString(5, produto.getFornecedor());
            ps.setString(6, produto.getUnidade());
            ps.setDouble(7, produto.getValor_unit());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
        
        
        public ArrayList<Produto> getProdutos(){
           ArrayList<Produto> lista = new ArrayList<Produto>();
            try{

            Connection con = Conecta.getConexao();
        
            String sql = "SELECT * FROM produto ORDER BY nome";
      
           ResultSet rs = con.createStatement().executeQuery(sql);

            while (rs.next()) {
            
            lista.add(new Produto(rs.getString("codigo"), rs.getString("nome"), 
                    rs.getString("descricao"),rs.getString("categoria"), rs.getString("fornecedor")
                    ,rs.getString("unidade"), rs.getDouble("valor")));
            }
            rs.close();
        
            con.close();

        }
        catch (Exception e) {
        e.printStackTrace();

    }
    return lista;
    }
        
        public String editarProduto(Produto produto) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "Update produto Set nome = ?, descricao = ?, "
                    + "categoria = ?, fornecedor = ?, unidade = ?, valor = ? where codigo = ?";
            PreparedStatement ps = con.prepareStatement(sql);

        
            ps.setString(1, produto.getNome());
            ps.setString(2, produto.getDescricao());
            ps.setString(3, produto.getCategoria());
            ps.setString(4, produto.getFornecedor());
            ps.setString(5, produto.getUnidade());
            ps.setDouble(6, produto.getValor_unit());
            ps.setString(7, produto.getId());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
                
        public String excluirProduto(Produto produto) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "DELETE FROM produto WHERE  codigo = ?";
            PreparedStatement ps = con.prepareStatement(sql);

        
            ps.setString(1, produto.getId());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
}
