/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Estoque;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Ander
 */
public class EstoqueDAO {
    
        public ArrayList<Estoque> getEstoques(){
           ArrayList<Estoque> listaEstoque = new ArrayList<Estoque>();
            try{

            Connection con = Conecta.getConexao();
        
            String sql = "SELECT  estoque.cod_produto, estoque.quantidade, produto.descricao, "
                    + "produto.nome, (produto.valor * estoque.quantidade) as valor_total "
                    + " FROM estoque join produto "
                    + "on cod_produto = codigo "
                    + "Where estoque.quantidade > 0";
      
           ResultSet rs = con.createStatement().executeQuery(sql);

            while (rs.next()) {
            
            listaEstoque.add(new Estoque(rs.getString("cod_produto"), rs.getString("nome"), rs.getString("descricao"),
                    rs.getInt("quantidade"),rs.getDouble("valor_total")));
            }
            rs.close();
        
            con.close();

        }
        catch (Exception e) {
        e.printStackTrace();

    }
 return listaEstoque;
  }
}
