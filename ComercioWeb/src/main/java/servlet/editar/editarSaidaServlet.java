/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.editar;

import classes.Saida;
import dao.SaidaDAO;
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
public class editarSaidaServlet extends HttpServlet {

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
            out.println("<title>Servlet editarSaidaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editarSaidaServlet at " + request.getContextPath() + "</h1>");
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

     
     
        String categoria = request.getParameter("editarcategprt");
        String quantidade = request.getParameter("editarqtdeVenda");
        String data = request.getParameter("editardataVenda");
        String cliente = request.getParameter("editarcategClient");
        String vendedor = request.getParameter("editarcategVend");
        String valor = request.getParameter("editarvalorVenda");
        String id = request.getParameter("editarID");
        
        if(categoria.equals(null) || quantidade.equals(null) || data.equals(null)) {
            
         categoria = "";
         quantidade = "";
         data = "";
     
        }
     int quant = Integer.parseInt(quantidade);
     double valorFinal = Double.parseDouble(valor);
      int idProd = Integer.parseInt(id);
      
        Saida saida = new Saida();
        
        saida.setCod_produto(categoria);
        saida.setQuantidade(quant);
        saida.setData(data);
        saida.setValor(valorFinal);
        saida.setCliente(cliente);
        saida.setVendedor(vendedor);
        saida.setId(idProd);
   

        String resp = new SaidaDAO().editarSaida(saida);
        
    if(resp.equals("OK")){
             response.sendRedirect("listaSaida.jsp?editar=" + resp);
        }
       
    
    else{
          
            response.sendRedirect("listaSaida.jsp?editar=" + resp);
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
