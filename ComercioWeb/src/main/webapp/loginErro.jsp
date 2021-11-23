<%-- 
    Document   : index
    Created on : 12/11/2021, 20:18:42
    Author     : Ander
--%>


<%@page import="dao.Conecta"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="classes.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
       
         <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <title>Efetuar Login</title>
    </head>
       <body>
           <div class="container">
           <form method="post" action="LoginServlet">
            <h1>Fazer Login </h1>
            
            <br>
            <input type="text" name="nome" placeholder="Nome de Usuário:" id="nome">
            <br>
       
            <input type="password" placeholder="Senha:" name="senha" id="senha">
            <br>
            
            <input type="submit" id="entrar" name="validar"  value="Entrar">
           </form>

            <form action="CadastroServlet" method="get">
            <input type="submit" id="cadastrar" name="Cadastrar" value=Cadastrar>
            </form>
                <div>     
              <form action="EditarServlet" method="get">
            <input type="submit" name="alterar" id="altera" value="Alterar senha">
            </form>
             </div>
                    </div>   
    
    
           <script>
          Swal.fire({icon: 'error',title: 'Oh no...',
                    text: 'Nome de usuário ou email incorretos',
                    showClass: {popup: 'animate__animated animate__bounceIn'},
                    hideClass: {popup: 'animate__animated animate__bounceOutDown'}})
            </script>
    </body>
</html>
