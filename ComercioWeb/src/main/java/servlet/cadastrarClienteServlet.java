/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Cliente;
import dao.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ander
 */
public class cadastrarClienteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        String nascimento = request.getParameter("nascimento");
        String rg = request.getParameter("rg");
        String cpf = request.getParameter("cpf");
        String endereco = request.getParameter("rua");
        String estado = request.getParameter("estado");
        String cep = request.getParameter("cep");
        
       
        
        if(nome.equals(null) || nascimento.equals(null) || rg.equals(null)
                || cpf.equals(null) || endereco.equals(null) 
                || estado.equals(null) || cep.equals(null)){
            
         nome = "";
         nascimento = "";
         rg = "";
         cpf = "";
         endereco = "";
         estado = "";
         cep = "0";
        }
    
     
        Cliente cliente = new Cliente();
        
        cliente.setNome(nome);
        cliente.setNascimento(nascimento);
        cliente.setRg(rg);
        cliente.setCpf(cpf);
        cliente.setEndereco(endereco);
        cliente.setEstado(estado);
        cliente.setCep(cep);


        String resp = new ClienteDAO().insertCliente(cliente);
        
    if(resp.equals("OK")){
             response.sendRedirect("cliente.jsp?status=" + resp);
        }
       
    
    else{
          
            response.sendRedirect("cliente.jsp?status=" + resp);
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
