<%-- 
    Document   : saida
    Created on : 16/11/2021, 13:23:26
    Author     : Ander
--%>

<%@page import="dao.FuncionarioDAO"%>
<%@page import="classes.Funcionario"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="classes.Cliente"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="classes.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.SaidaDAO"%>
<%@page import="classes.Saida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<% 
    String status = request.getParameter("status");
   String editar = request.getParameter("editar");
    String excluir = request.getParameter("excluir");
    
 
    %>
<html lang="pt-br">
  <head>
        
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">

    <title>MyEstoque - HomePage</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
  

    <!-- Additional CSS e JS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-style.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     <script src="assets/js/principal.js"></script>
    <script src="assets/js/saida.js"></script>  
  
        
        
        <title>Saida - MyEstoque</title>

    </head>
    <body>
         <div id="wrapper">

      <!-- Main -->
        <div id="main">
          <div class="inner">

            <!-- Header -->
            <header id="header">
              <div class="logo">
                <a href="principal.jsp">MyEstoque</a>
              </div>
            </header>
        <section class="d-flex">
            <article class="container ">
                <div class="row">
                    <h1 class="bg-primary text-center p-2 text-white fw-bolder">Saida de produtos</h1>
                    <div class="col-md-12 bg-white border ">
                      <div id="minhaDiv">
                        <form  class="row" action="<c:url value="cadastrarSaidaServlet"/>" accept-charset="character_set" method="post">
                        <fieldset class="mt-5 col-md-10 ">  
                           <legend class="text-center mb-4 fw-bolder text-warning ">Cadastro de Saida</legend>
                             <div class="form-group ml-5">
                               <input class="form-control" placeholder="Código do produto..." list="categprodts" name="categprt" id="categprt">

                                 <datalist id="categprodts">
                                      <%
                                  
                    ArrayList<Produto> lista = new ProdutoDAO().getProdutos();

                    for(int i = 0; i < lista.size(); i++){
                       out.println("<option value='"+lista.get(i).getId()+"'>");
                    }
                        %>    
                                </datalist>
                     
                            </div>    <br>
                                <div class="form-group ml-5">
                               <input class="form-control" placeholder="CPF cliente..." list="categClients" name="categClient" id="categClient">

                                 <datalist id="categClients">
                                      <%
                                  
                    ArrayList<Cliente> listaClientes = new ClienteDAO().getClientes();

                    for(int i = 0; i < listaClientes.size(); i++){
                       out.println("<option value='"+listaClientes.get(i).getCpf()+"'>");
                    }
                        %>    
                                </datalist>
                     
                            </div>
                            <br>
                               <div class="form-group ml-5">
                                 <input class="form-control " placeholder="Quantidade..."  ype="text" id="qtdeVenda" name="qtdeVenda">
                                </div>    <br>
                                    <div class="form-group ml-5">
                                 <input class="form-control " placeholder="Valor..."  ype="text" id="valorVenda" name="valorVenda">
                                </div>    <br>
                                                               <div class="form-group ml-5">
                               <input class="form-control" placeholder="CPF do Vendedor..." list="categVendedor" name="categVend" id="categVend">

                                 <datalist id="categVendedor">
                                      <%
                                  
                    ArrayList<Funcionario> listaVendedor = new FuncionarioDAO().getFuncionarios();

                    for(int i = 0; i < listaVendedor.size(); i++){
                       out.println("<option value='"+listaVendedor.get(i).getCpf()+"'>");
                    }
                        %>    
                                </datalist>
                     
                            </div>
                                 <div class="form-group ml-5">
                                                    <label class ="mb-2 mt-2">Data da Venda  </label>
                                                    <input class="form-control " placeholder="Data:  " type="date" name="dataVenda" id="dataVenda"> 
                                                </div>
                            </fieldset>
                                <br>
                                <div>
                            <input class=" btn btn-success btn-customized mt-4 ml-5"type="submit" value="Nova Saida">
                            <button class="btn btn-danger  mt-4" type="button" onclick="Mudarestado('minhaDiv')">Cancelar</button> 
                                </div>
                              
                            </div>      
                        </form>
                          <div id="divEditar">
                            <form  class="row" action="<c:url value="editarSaidaServlet"/>" accept-charset="character_set" method="post">
                             <fieldset class="mt-5 col-md-10 "> 
                           <legend class="text-center mb-4 fw-bolder text-warning ">Editar a Saida</legend>
                           <div class="form-group ml-5">
                                <input class="form-control" placeholder="Código do produto..." list="categprodts" name="editarcategprt" id="editarcategprt">

                                 <datalist id="categprodts">
                                      <%
                                  
                    for(int i = 0; i < lista.size(); i++){
                       out.println("<option value='"+lista.get(i).getId()+"'>");
                    }
                        %>    
                                </datalist>
                     
                            </div>    <br>
                                <div class="form-group ml-5">
                               <input class="form-control" placeholder="CPF cliente..." list="categClients" name="editarcategClient" id="editarcategClient">

                                 <datalist id="categClients">
                                      <%
                                  
                    for(int i = 0; i < listaClientes.size(); i++){
                       out.println("<option value='"+listaClientes.get(i).getCpf()+"'>");
                    }
                        %>    
                                </datalist>
                     
                            </div>
                            <br>
                               <div class="form-group ml-5">
                                 <input class="form-control " placeholder="Quantidade..."  ype="text" id="editarqtdeVenda" name="editarqtdeVenda">
                                </div>    <br>
                                    <div class="form-group ml-5">
                                 <input class="form-control " placeholder="Valor..."  ype="text" id="editarvalorVenda" name="editarvalorVenda">
                                </div>    <br>
                                                               <div class="form-group ml-5">
                               <input class="form-control" placeholder="CPF do Vendedor..." list="categVendedor" name="editarcategVend" id="editarcategVend">

                                 <datalist id="categVendedor">
                                      <%
                                  
                    for(int i = 0; i < listaVendedor.size(); i++){
                       out.println("<option value='"+listaVendedor.get(i).getCpf()+"'>");
                    }
                        %>    
                                </datalist>
                     
                            </div>
                                 <div class="form-group ml-5">
                                    <label class ="mb-2 mt-2">Data da Venda  </label>
                                   <input class="form-control " placeholder="Data:  " type="date" name="editardataVenda" id="editardataVenda"> 
                                 <input class="form-control input-hidden" placeholder="Data:  " type="hidden" name="editarID" id="editarID"> 
                                 </div>
                            </fieldset>
                                <br>
                                <div>
                            <input class=" btn btn-success mt-3 ml-5"type="submit" value="Editar Saida">
                            <button class="btn btn-danger mt-3" type="button"  onclick="Mudarestado('divEditar')">Cancelar</button> 
                                </div>
     
                        </form>
                                </div>
                            <div class="mt-5">
                                <button class="btn fw-bolder me-5 btn-primary float-start" type="button" onclick="Mudarestado('minhaDiv')">Fazer Cadastro</button> 
                                <button class="btn fw-bolder ms-2 btn-warning text-white float-start" type="button"  onclick="estadoEditar('divEditar')">Editar Saida</button> 
                                <form id="excluirform" name="excluirform" " class="float-start" action="<c:url value="excluirSaidaServlet"/>" method="post">
                                    <button id="excluir" onclick="confirmar()" class="btn fw-bolder ms-5 btn-danger text-white " type="submit">Excluir Saida</button>  
                                     <input class="input-hidden"  type="hidden" name ="codigoExcluir" id="codigoExcluir">
                                </form>
                            </div>
                              
                          <table id="tabelaSaida" class="table mt-5 table-striped table-hover table-responsive-md">  
                              <caption>Lista de Saidas</caption>
                              <thead>
                            <tr>
                        <th scope="col" >#</th>
                        <th scope="col">Id</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Codigo</th>
                        <th scope="col">Cliente</th>
                        <th scope="col">Quant.</th>
                        <th scope="col">Data</th>
                        <th scope="col">Valor</th>
                         <th scope="col">Vendedor</th>
                           </tr>
                        </thead>
                        <tbody>
                              <c:forEach items="${listarSaida}" var="listas">
                                <tr>
                            <td><input class='editar' type='checkbox' id="" value='${listas.nome}'></td>
                                <th>${listas.id}</th>
                                <td>${listas.nome}</td>
                                <td>${listas.cod_produto}</td>
                                <td>${listas.cliente}</td>
                                <td>${listas.quantidade}</td>
                                <td>${listas.data}</td>
                                <td>${listas.valor}</td>
                                 <td>${listas.vendedor}</td>
                                </tr>
                         </c:forEach>
                        </tbody>
                          </table>
                </div>
                        
            </article>
        </section>
        </div>
        </div>

      <!-- Sidebar -->
        <div id="sidebar">

          <div class="inner">

            <!-- Search Box -->
            <section id="search" class="alt">
              <form method="get" action="#">
                <input type="text" name="search" id="search" placeholder="Busca..." />
              </form>
            </section>
              
            <!-- Menu -->
            <nav id="menu">
              <ul>
                 <li><a href="<c:url value="listarEstoque"/> ">Homepage</a></li>
                    <li><a href="<c:url value="listarProduto"/> ">Produto</a></li>
                    <li><a href="<c:url value="listaCliente"/> ">Cliente</a></li>
                    <li><a href="<c:url value="listarFuncionario"/> ">Funcionário</a></li>
                  <li><a href="estatisticas.jsp">Estatísticas</a></li>
              </ul>
            </nav>

            <!-- Featured Posts -->
            <div class="featured-posts">
              <div class="heading">
                  <h2>Links Úteis</h2>
              </div>
              <div class="owl-carousel owl-theme">
                <a href="https://www.gs1br.org/hub-de-dados/bancos-de-dados-de-saidas/cadastro-nacional-de-saidas" target="target">
                  <div class="featured-item">
                      <img src="assets/images/featured_post.jpg" alt="featured one">
                    <p>​​​​​​​​​​​​​​​​​​​​​​​​​​​Visibilidade para seu saida e mais negócios para sua empresa.</p>
                  </div>
                </a>
                <a href="https://www.nomus.com.br/blog-industrial/5-dicas-essenciais-para-um-controle-de-estoque-eficiente/" target="target">
                  <div class="featured-item">
                      <img src="assets/images/featured_post_02.jpg" alt="featured two">
                    <p>5 dicas para um controle de estoque eficiente.</p>
                  </div>
                </a>
                <a href="http://www.desafiorh.com.br/blog/valorizacao-do-funcionario-dicas-para-colocar-em-pratica/" target="target">
                  <div class="featured-item">
                      <img src="assets/images/featured_post_03.jpg" alt="featured three">
                    <p>Valorização do Funcionário: Dicas para se colocar em prática.</p>
                  </div>
                </a>
              </div>
            </div>

            <!-- Footer -->
                     <footer id="footer">
                        <p class="copyright">Copyright &copy; 2021 MyEstoque
                            <br>Feito por <a rel="nofollow" href="https://github.com/andersonv16">Anderson Viana</a></p>
                    </footer>


          </div>
        </div>

    </div>

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/transition.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/custom.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        
                 <%
            
        if (status != null){
        if (status.equals("OK")){
          out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                    + "'Saida cadastrada com sucesso'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
        }
        else{
                out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                    + "'Algo deu errado! Por gentileza verificar as informações da saida'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
       
        }
   
    }
               if (editar != null){
        if (editar.equals("OK")){
                      out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                    + "'Saida editada com sucesso'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
        }
        else{
                out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                    + "'Algo deu errado! Por gentileza verificar as informações da saida'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
       
        }
   
    }
        
    if (excluir != null){
        if (excluir.equals("OK")){
                    out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                    + "'Saida excluida com sucesso'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
        }
        else{
                out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                    + "'Algo deu errado! Por gentileza verificar as informações da saida'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
       }
        }
             %>
       
             
             <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script>selecionarSaida()</script>
    </body>
</html>
