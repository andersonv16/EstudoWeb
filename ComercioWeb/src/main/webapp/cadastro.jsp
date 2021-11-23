<%-- 
    Document   : cadastro
    Created on : 15/11/2021, 00:06:54
    Author     : Ander
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String status = request.getParameter("status");
    

  
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="style.css"/>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
       
         <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
       
        <title>Cadastrar</title>
    </head>
     <body>
        <div class="container">
           <form method="post" action="CadastroServlet">
            <h1>Realizar Cadastro...</h1>
            
            <br>
            <input type="text" placeholder="nome:" name="nome" id="nome">
            <br>
            <input type="text" placeholder="email:" name="email" id="email">
            <br>
            <input type="password" placeholder="senha:" name="senha" id="senha">
            <br>
            <input type="submit" id="cadastrar" name="validar" value="Cadastrar">
        </form>
             <form action="LoginServlet" method="get">
            <input type="submit" id="alterar"  name="voltar" value=Voltar>
            </form>
        </div>
         
         <%
                 if (status != null){
        if (status.equals("OK")){
            out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                    + "'Usuário cadastrado com sucesso'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
        }
        else{
            out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                    + "'Algo deu errado! Nome de usuário ou email ja cadastrados'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
       
        
        }
    }
             
             %>
    </body>
</html>
