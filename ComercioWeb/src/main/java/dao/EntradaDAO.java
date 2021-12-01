package dao;

import classes.Entrada;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EntradaDAO {
    
            public String insertEntrada(Entrada entrada) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO entrada (cod_produto, quantidade, data)"
                    + " VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, entrada.getCod_produto());
            ps.setInt(2, entrada.getQuantidade());
            ps.setString(3, entrada.getData());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(EntradaDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EntradaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
        
        
        public ArrayList<Entrada> getEntradas(){
           ArrayList<Entrada> listaEntrada = new ArrayList<Entrada>();
            try{

            Connection con = Conecta.getConexao();
        
            String sql = "SELECT entrada.id, entrada.cod_produto, entrada.quantidade, DATE_FORMAT(entrada.data,'%d/%m/%Y')AS `data_formatada`, "
                    + "produto.nome, (produto.valor * entrada.quantidade) as valor_total "
                    + " FROM entrada join produto "
                    + "on cod_produto = codigo order by data_formatada";
      
           ResultSet rs = con.createStatement().executeQuery(sql);

            while (rs.next()) {
            
            listaEntrada.add(new Entrada(rs.getInt("id"), rs.getString("cod_produto"), rs.getString("nome"),
                    rs.getInt("quantidade"),rs.getDouble("valor_total"), rs.getString("data_formatada")));
            }
            rs.close();
        
            con.close();

        }
        catch (Exception e) {
        e.printStackTrace();

    }
    return listaEntrada;
    }
        
        public String editarEntrada(Entrada entrada) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "Update entrada Set cod_produto = ?, quantidade = ?, "
                    + "data = ? where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);

        
            ps.setString(1, entrada.getCod_produto());
            ps.setInt(2, entrada.getQuantidade());
            ps.setString(3, entrada.getData());
            ps.setInt(4, entrada.getId());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(EntradaDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EntradaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }
                
        public String excluirEntrada(Entrada entrada) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "DELETE FROM entrada WHERE  id = ?";
            PreparedStatement ps = con.prepareStatement(sql);

        
            ps.setInt(1, entrada.getId());
            
            ps.execute(); 
            ps.close();
            con.close();
            resp = "OK";
        } catch (SQLException ex) {
            Logger.getLogger(EntradaDAO.class.getName()).log(Level.SEVERE, null, ex);
            resp = "Erro" + ex.toString();
    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EntradaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;

    }

}
