package dao;

import classes.Saida;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SaidaDAO {
    
            public String insertSaida(Saida saida) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO saida (quantidade, cod_produto, cliente , data, valor, vendedor)"
                    + " VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setInt(1, saida.getQuantidade());
            ps.setString(2, saida.getCod_produto());
            ps.setString(3, saida.getCliente());
            ps.setString(4, saida.getData());
            ps.setDouble(5, saida.getValor());
            ps.setString(6, saida.getVendedor());
             
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(SaidaDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SaidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
        
        
        public ArrayList<Saida> getSaidas(){
           ArrayList<Saida> listaSaida = new ArrayList<Saida>();
            try{

            Connection con = Conecta.getConexao();
        
            String sql = "SELECT saida.id, saida.cod_produto, saida.quantidade, DATE_FORMAT(saida.data,'%d/%m/%Y')AS `data_formatada`, "
                    + "produto.nome, saida.valor, saida.cliente, saida.vendedor"
                    + " FROM saida join produto "
                    + "on cod_produto = codigo order by data_formatada";
      
           ResultSet rs = con.createStatement().executeQuery(sql);

            while (rs.next()) {
            
            listaSaida.add(new Saida(rs.getInt("id"), rs.getInt("quantidade"), rs.getString("cod_produto"), rs.getString("cliente"), 
                   rs.getString("data_formatada"), rs.getDouble("valor"),rs.getString("vendedor"),  rs.getString("nome")));
            }
            rs.close();
        
            con.close();

        }
        catch (Exception e) {
        e.printStackTrace();

    }
    return listaSaida;
    }
        
        public String editarSaida(Saida saida) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "Update saida Set  quantidade = ?, cod_produto = ?, "
                    + "cliente = ?,  data = ?, valor = ?, vendedor = ? where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);

        
            ps.setInt(1, saida.getQuantidade());
            ps.setString(2, saida.getCod_produto());
            ps.setString(3, saida.getCliente());
            ps.setString(4, saida.getData());
            ps.setDouble(5, saida.getValor());
            ps.setString(6, saida.getVendedor());
            ps.setInt(7, saida.getId());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(SaidaDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SaidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
                
        public String excluirSaida(Saida saida) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "DELETE FROM saida WHERE  id = ?";
            PreparedStatement ps = con.prepareStatement(sql);

        
            ps.setInt(1, saida.getId());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(SaidaDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SaidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }

}
