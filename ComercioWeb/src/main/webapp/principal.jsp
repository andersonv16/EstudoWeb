<%-- 
    Document   : principal
    Created on : 15/11/2021, 00:08:26
    Author     : Ander
--%>

<%@page import="dao.EstoqueDAO"%>
<%@page import="classes.Estoque"%>
<%@page import="classes.Estoque"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  
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
  

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-style.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    
    <title>Home - MyEstoque</title>
 
<body class="is-preload">

    <!-- Wrapper -->
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
            <!-- Banner -->
            <section class="main-banner">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-12">
                    <div class="banner-content">
                      <div class="row">
                        <div class="col-md-12">
                          <div class="banner-caption">
                            <h4>Olá, bem vindo ao <em>MyEstoque</em></h4>
                            <span>PROGRAMA DE GERENCIAMENTO &amp; CONTROLE DE ESTOQUE</span>
                            <p>Você sabia que a <strong>MyEstoque</strong> é um web serviço para controle e gerenciamento do seu estoque de produtos?
                               <strong>como funciona</strong>
                               ? O controle de estoque tem como objetivo informar a quantidade disponível de cada item dentro da loja e também a quanto dinheiro os produtos valem..</p>
                            <div class="primary-button">
                                <a href="https://www.eticosoftware.com.br/artigos/estoque-_" target="target">Leia Mais</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </section>

            <!-- Services -->
            <section class="services">
              <div class="container-fluid">
                <div class="row">
                  <a href="listarEntrada" class="col-md-4">
                    <div class="service-item first-item">
                      <div class="icon"></div>
                      <h4>Entrada de Produtos</h4>
                    </div>
                  </a>
                     <a href="listaSaida" class="col-md-4">
                    <div class="service-item second-item">
                      <div class="icon"></div>
                      <h4>Saída de Produtos</h4>
                    </1>
                  </div>
                  <a href="estatisticas.jsp" class="col-md-4">
                    <div class="service-item third-item">
                      <div class="icon"></div>
                      <h4>Estatísticas de Vendas</h4>
                    </div>
                  </a>
                          <table id="tabelaEstoque" class="table mt-5 table-striped table-hover table-responsive-md">  
                              <caption>Estoque de Produtos</caption>
                              <thead>
                            <tr>
                        <th scope="col">Nome</th>
                        <th scope="col">Codigo</th>
                        <th scope="col">Descrição</th>
                        <th scope="col">Quant.</th>
                        <th scope="col">Valor</th>
                           </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listarEstoque}" var="listas">
                                <tr>
                                <th>${listas.nome_produto}</th>
                                <td>${listas.cod_produto}</td>
                                 <td>${listas.descricao}</td>
                                <td>${listas.quantidade}</td>
                                <td>${listas.valorEstoque}</td>
                                </tr>
                         </c:forEach>
                        </tbody>
                          </table>
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
                <a href="https://www.gs1br.org/hub-de-dados/bancos-de-dados-de-produtos/cadastro-nacional-de-produtos" target="target">
                  <div class="featured-item">
                      <img src="assets/images/featured_post.jpg" alt="featured one">
                    <p>​​​​​​​​​​​​​​​​​​​​​​​​​​​Visibilidade para seu produto e mais negócios para sua empresa.</p>
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
    </body>
</html>
