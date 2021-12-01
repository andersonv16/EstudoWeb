/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Funcionario;
import dao.FuncionarioDAO;
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
public class editarFuncionarioServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editarFuncionarioServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editarFuncionarioServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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

        String nome = request.getParameter("nomeeditar");
        String nascimento = request.getParameter("nasceditar");
        String rg = request.getParameter("editarRG");
        String cpf = request.getParameter("editarCPF");
        String cargo = request.getParameter("cargoeditar");
        String endereco = request.getParameter("enderecoeditar");
        String estado = request.getParameter("editarEstado");
        String cep = request.getParameter("cepeditar");
        
       
        if(nome.equals(null) || nascimento.equals(null) || rg.equals(null)
                || cpf.equals(null) || endereco.equals(null) 
                || estado.equals(null) || cep.equals(null)|| cargo.equals(null)){
            
         nome = "";
         nascimento = "";
         rg = "";
         cpf = "";
         cargo = "";
         endereco = "";
         estado = "";
         cep = "0";
        }
    
     
        Funcionario funcionario = new Funcionario();
        
        funcionario.setNome(nome);
        funcionario.setNascimento(nascimento);
        funcionario.setRg(rg);
        funcionario.setCpf(cpf);
        funcionario.setCargo(cargo);
        funcionario.setEndereco(endereco);
        funcionario.setEstado(estado);
        funcionario.setCep(cep);


        String resp = new FuncionarioDAO().editarFuncionario(funcionario);
        
    if(resp.equals("OK")){
             response.sendRedirect("funcionario.jsp?editar=" + resp);
        }
       
    
    else{
          
            response.sendRedirect("funcionario.jsp?editar=" + resp);
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
