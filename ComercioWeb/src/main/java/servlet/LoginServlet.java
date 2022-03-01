/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Usuario;
import dao.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ander
 */
public class LoginServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             request.getRequestDispatcher("index.jsp").forward(request, response);  
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
        
    String nome = request.getParameter("nome");
    String senha = request.getParameter("senha");
   
    Usuario usuario = new Usuario();
    
    
    if (nome != null && senha != null){
        usuario = new UsuarioDAO().consultarUsuario(nome, senha);
   
        String comparaNome = usuario.getNome().toString();
        String comparaSenha = usuario.getSenha().toString();
        
    
        if(comparaNome.equals(nome) && comparaSenha.equals(senha) && comparaSenha != "" ){
           
            request.getRequestDispatcher("listarEstoque").forward(request, response);

        }
        else{
    
          request.getRequestDispatcher("loginErro.jsp").forward(request, response);
        
          
         
            }
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
