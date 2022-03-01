<%-- 
    Document   : produto
    Created on : 16/11/2021, 13:23:26
    Author     : Ander
--%>

<%@page import="dao.EstoqueDAO"%>
<%@page import="classes.Estoque"%>
<%@page import="dao.SaidaDAO"%>
<%@page import="classes.Saida"%>
<%@page import="dao.EntradaDAO"%>
<%@page import="classes.Entrada"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="classes.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

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
       <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
       


        <title>Estatisticas - MyEstoque</title>

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
                            <div class="row ">
                           <h1 class="bg-primary text-center p-2 mb-4 text-white fw-bolder">Estatisticas</h1>

                               <div class="col-md-12 bg-white border "> 
                                 <div class="row ">
                                 <div class="col-md-6" id="chartSaida">
                     
                                </div>
                              <div class="col-md-6" id="chart">
                     
                                </div>
                                 <div class="col-md-11 mt-5" id="chartCompara">
                     
                                </div>
                                    <div class="col-md-11 mt-5" id="chartEstoque">
                                    </div>
                                 </div>
                                </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
     
        <%
          ArrayList<Entrada> listaEntrada = new EntradaDAO().getEntradas();
        out.println("<script>var lista = []</script>");
        out.println("<script>var datas = []</script>");
       for(int i = 0; i < listaEntrada.size(); i++){
       out.println("<script>lista.push(" + listaEntrada.get(i).getValor()+ ")</script>");
       out.println("<script>datas.push('" + listaEntrada.get(i).getData()+ "')</script>");
       }
       
    ArrayList<Saida> listaSaida = new SaidaDAO().getSaidas();
       out.println("<script>var listaSaida = []</script>");
        out.println("<script>var dataSaida = []</script>");
       for(int i = 0; i < listaSaida.size(); i++){
       out.println("<script>listaSaida.push(" + listaSaida.get(i).getValor()+ ")</script>");
       out.println("<script>dataSaida.push('" + listaSaida.get(i).getData()+ "')</script>");
       }
       
       
    ArrayList<Estoque> listaEstoque = new EstoqueDAO().getEstoques();
       out.println("<script>var listaEstoque = []</script>");
        out.println("<script>var quantidades = []</script>");
       for(int i = 0; i < listaEstoque.size(); i++){
       out.println("<script>listaEstoque.push('" + listaEstoque.get(i).getNome_produto()+ "')</script>");
       out.println("<script>quantidades.push(" + listaEstoque.get(i).getQuantidade()+ ")</script>");
       }
       
       %>
       <script src="assets/js/estatisticas.js"></script>  
    </body>
</html>
