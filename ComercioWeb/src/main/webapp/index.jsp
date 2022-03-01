<%-- 
    Document   : index
    Created on : 15/11/2021, 00:05:18
    Author     : Ander
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/style.css"/>
        <title>Efetuar Login</title>
    </head>
       <body>
           <div class="container">
           <form method="post" action="<c:url value="LoginServlet"/>">
            <h1>Fazer Login </h1>
            
            <br>
            <input type="text" name="nome" placeholder="Nome de Usuário:" id="nome">
            <br>
       
            <input type="password" placeholder="Senha:" name="senha" id="senha">
            <br>

            
            <input type="submit" id="entrar" name="validar"  value="Entrar">
        </form>
            <form action="<c:url value="CadastroServlet"/>" method="get">
            <input type="submit" id="cadastrar" name="Cadastrar" value=Cadastrar>
            </form>
            </div>
    </body>
</html>
