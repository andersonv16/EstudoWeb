<%-- 
    Document   : principal
    Created on : 15/11/2021, 00:08:26
    Author     : Ander
--%>

<%@page import="classes.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
         <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
         <link rel="stylesheet" href="aplicação.css"/>
        <title>Home - MyEstoque</title>
 
    </head>
    <body>
        <header>
              <nav class="navbar navbar-expand-lg navbar-light transparente fixed-top">
            <div class="container">
                <a class="navbar-brand text-warning fw-bolder"  href="principal.jsp"> <span> MyEstoque</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navPrincipal" aria-expanded="false">
          <i class="fas fa-bars text-white"></i>
      </button>
      <div id="navPrincipal" class="collapse navbar-collapse">
        <ul class="navbar-nav">
          <li  class="nav-item divisor "></li>
          <li  class="nav-item"><a class="nav-link ms-5" href="principal.jsp">Home</a></li>
          <li  class="nav-item"><a class="nav-link ms-4" href="produto.jsp">Produto</a></li>
          <li  class="nav-item"><a class="nav-link ms-4" href="cliente.jsp">Cliente</a></li>
          <li  class="nav-item"><a class="nav-link ms-4" href="funcionario.jsp">Funcionario</a></li>
          <li  class="nav-item"><a class="nav-link ms-4" href="#">Estatísticas</a></li>
          <div id="divBusca" class=" ms-5 me-3">
        <input type="text" id="txtBusca"  action="POST" placeholder="Buscar..."/>
        <button type="submit" name="btnBusca" id="btnBusca"><i class="fas fa-search"></i></button>
      </div>
           <li  class="nav-item ms-5">
            <a class="nav-link text-black fw-bolder" href="configurar.jsp"> <i class="fas fa-cog"></i></a>
          </li>
           <li class="nav-item"><a class="nav-link ms-1 fs-5s text-black" href="index.jsp"><i class="fas fa-sign-out-alt"></i></a></li>
      </ul>
      
      </div>
    </div>  
       </nav>
        </header>
     
        
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
