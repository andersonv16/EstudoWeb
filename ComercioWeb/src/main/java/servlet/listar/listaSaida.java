/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.listar;

import classes.Saida;
import dao.SaidaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ander
 */
public class listaSaida extends HttpServlet {

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
            out.println("<title>Servlet listaSaida</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet listaSaida at " + request.getContextPath() + "</h1>");
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
        String status = request.getParameter("status");
            String editar = request.getParameter("editar");
            String excluir = request.getParameter("excluir");
            ArrayList<Saida> lista = new SaidaDAO().getSaidas();
            request.setAttribute("listarSaida", lista);
                
            if (status != null) {
                if (status.equals("OK")) {
                     RequestDispatcher rd = request.getRequestDispatcher("saida.jsp?status");
                     rd.forward(request, response);  
                }
       
               else if (editar.equals("OK")) {
               RequestDispatcher rd = request.getRequestDispatcher("saida.jsp?editar");
                     rd.forward(request, response);  
              
                   
                }
                   else if (excluir.equals("OK")) {
                RequestDispatcher rd = request.getRequestDispatcher("saida.jsp?excluir");
                     rd.forward(request, response);   
              
                   }
            }else{
                       RequestDispatcher rd = request.getRequestDispatcher("saida.jsp");
                     rd.forward(request, response);   
                   }
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
        processRequest(request, response);
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
