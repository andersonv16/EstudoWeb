/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.cadastro;

import classes.Produto;
import dao.ProdutoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ander
 */
public class cadastrarProdutoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String codigo = request.getParameter("codigo");
        String nome = request.getParameter("nomeprod");
        String descricao = request.getParameter("textprod");
        String categoria = request.getParameter("categprod");
        String fornecedor = request.getParameter("fornecproduto");
        String unidade = request.getParameter("unidadeproduto");
        String valor = request.getParameter("valorproduto");
        
       
        
        if(codigo.equals(null) || nome.equals(null) || descricao.equals(null)
                || categoria.equals(null) || fornecedor.equals(null) 
                || unidade.equals(null) || valor.equals(null)){
            
         codigo = "";
         nome = "";
         descricao = "";
         categoria = "";
         fornecedor = "";
         unidade = "";
         valor = "0";
        }
     double valorFinal = Double.parseDouble(valor.replace(",","."));
     
        Produto produto = new Produto();
        
        produto.setId(codigo);
        produto.setNome(nome);
        produto.setDescricao(descricao);
        produto.setCategoria(categoria);
        produto.setFornecedor(fornecedor);
        produto.setUnidade(unidade);
        produto.setValor_unit(valorFinal);


        String resp = new ProdutoDAO().insertProduto(produto);  
        
    if(resp.equals("OK")){
             response.sendRedirect("listarProduto?status=" + resp);
        }
       
    
    else{
          
            response.sendRedirect("listarProduto?status=" + resp);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
