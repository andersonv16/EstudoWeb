<%-- 
    Document   : produto
    Created on : 16/11/2021, 13:23:26
    Author     : Ander
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="classes.Produto"%>
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


        <title>Produto - MyEstoque</title>

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
                                <h1 class="bg-primary text-center p-2 text-white fw-bolder">Área do produto</h1>
                                <div class="col-md-12 bg-white border ">
                                    <div id="minhaDiv">
                                        <form class="row" action="<c:url value="cadastroProdutoServlet"/>" accept-charset="character_set" method="post">
                                            <fieldset class="ms-5 col-md-10 ">  
                                                <legend class="text-center fw-bolder text-warning ">Cadastro de Produto</legend>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="nomeprod" placeholder="Nome do Produto..." name="nomeprod">
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <input class="form-control " placeholder="Nome do Fornecedor..."  ype="text" id="fornecproduto" name="fornecproduto">
                                                </div>
                                                <br>
                                            </fieldset>
                                            <fieldset class="col-md-6 p-3">
                                                <legend  class="text-center fw-bolder text-warning ">Informações do Produto</legend>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="codigo" placeholder="Código..." name="codigo">
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <input class="form-control " placeholder="Unidade..."type="text" id="unidadeproduto" name="unidadeproduto">
                                                </div>
                                                <br>
                                                <div class="form-group">

                                                    <input type="text" class="form-control" id="valorproduto" placeholder="Valor..." name="valorproduto">
                                                </div>
                                            </fieldset>
                                            <fieldset class="col-md-6 p-3">  
                                                <legend  class="text-center fw-bolder text-warning ">Informações Adicionais</legend>
                                                <div class="form-check">

                                                    <textarea placeholder="Descrição do Produto..."  class="form-control" id="textprod" name="textprod" rows="4" cols="60"></textarea>
                                                </div>
                                                <br>
                                                <div class="form-check">

                                                    <input class="form-control" placeholder="Categoria..." list="categprods" name="categprod" id="categprod">

                                                    <datalist id="categprods">
                                                        <option value="Medicamentos">
                                                        <option value="Higiene">
                                                        <option value="Cuidados Pessoais">
                                                        <option value="Alimentícios">
                                                        <option value="Eletrônicos">
                                                        <option value="Eletrodomésticos">
                                                    </datalist>
                                                </div>
                                            </fieldset>
                                            <div>
                                                <input class=" btn btn-success btn-customized ms-2"type="submit" value="Cadastrar">
                                                <button class="btn btn-danger" type="button" onclick="Mudarestado('minhaDiv')">Cancelar</button> 
                                            </div>

                                    </div>      
                                    </form>
                                    <div id="divEditar">
                                        <form  class="row" action="<c:url value="editarProdutoServlet"/>" accept-charset="character_set" method="post">
                                            <fieldset class="ms-5 col-md-10 ">  
                                                <legend class="text-center fw-bolder text-warning ">Editar o Produto</legend>
                                                <div class="form-group">
                                                    <input type="text" class="form-control nomeprod" id="editNomeProd" placeholder="Nome do Produto..." name="editNomeProd">
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <input class="form-control " placeholder="Nome do Fornecedor..."  ype="text" id="EditFornecproduto" name="EditFornecproduto">
                                                </div>
                                                <br>
                                            </fieldset>
                                            <fieldset class="col-md-6 p-3">
                                                <legend  class="text-center fw-bolder text-warning ">Informações do Produto</legend>
                                                <div class="form-group">

                                                    <input type="text" class="form-control codigo" id="Editcodigo" placeholder="Código..." name="Editcodigo">
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <input class="form-control " placeholder="Unidade..."type="text" id="EditUnidade" name="EditUnidade">
                                                </div>
                                                <br>
                                                <div class="form-group">

                                                    <input type="text" class="form-control valorproduto" id="EditValorproduto" placeholder="Valor..." name="EditValorproduto">
                                                </div>
                                            </fieldset>
                                            <fieldset class="col-md-6 p-3">  
                                                <legend  class="text-center fw-bolder text-warning ">Informações Adicionais</legend>
                                                <div class="form-check">

                                                    <textarea placeholder="Descrição do Produto..."  class="form-control" id="EditTextprod" name="EditTextprod" rows="4" cols="60"></textarea>
                                                </div>
                                                <br>
                                                <div class="form-check">

                                                    <input class="form-control" placeholder="Categoria..." list="categprods" name="EditCategprod" id="EditCategprod">

                                                    <datalist id="categprods">
                                                        <option value="Medicamentos">
                                                        <option value="Higiene">
                                                        <option value="Cuidados Pessoais">
                                                        <option value="Alimentícios">
                                                        <option value="Eletrônicos">
                                                        <option value="Eletrodomésticos">
                                                    </datalist>
                                                </div>
                                            </fieldset>
                                            <div>
                                                <input class=" btn btn-success pe-4 ps-4 ms-2"type="submit" value="Editar">
                                                <button class="btn btn-danger" type="button"  onclick="Mudarestado('divEditar')">Cancelar</button> 
                                            </div>
                                    </div>
                                    </form>
                                    <div class="mt-5">
                                        <button class="btn fw-bolder me-5 btn-primary float-start" type="button" onclick="Mudarestado('minhaDiv')">Fazer Cadastro</button> 
                                        <button class="btn fw-bolder ms-2 btn-warning text-white float-start" type="button"  onclick="estadoEditar('divEditar')">Editar Produto</button> 
                                        <form id="excluirform" name="excluirform" " class="float-start" action="<c:url value="excluirProdutoServlet"/>" method="post">
                                            <button id="excluir" onclick="confirmar()" class="btn fw-bolder ms-5 btn-danger text-white " type="submit">Excluir Produto</button>  
                                            <input class="input-hidden"  type="hidden" name ="codigoExcluir" id="codigoExcluir">
                                        </form>
                                    </div>

                                    <table id="tabelaProduto" class="table mt-5 table-striped table-hover table-responsive-md">  
                                        <caption>Lista de Produtos</caption>
                                        <thead>
                                            <tr>
                                                 <th scope="col">#</th>
                                                <th scope="col">Código</th>
                                                <th scope="col">Nome</th>
                                                <th scope="col">Descrição</th>
                                                <th scope="col">Categoria</th>
                                                <th scope="col">Fornecedor</th>
                                                <th scope="col">Unidade</th>
                                                <th scope="col" >Valor</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listaProduto}" var="lista">
                                                 <tr>
                                            <td><input class='editar' type='checkbox' id="" value='${lista.nome}'></td>
                                                <th scope='row'>${lista.id}</th >
                                                <td>${lista.nome}</td>
                                                 <td>${lista.descricao}</td>
                                                <td>${lista.categoria}</td>
                                                <td>${lista.fornecedor}</td>
                                                <td>${lista.unidade}</td>
                                                <td> ${lista.valor_unit}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
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


        <%
            if (status != null) {
                if (status.equals("OK")) {
                    out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                            + "'Produto cadastrado com sucesso'"
                            + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                            + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
                } else {
                    out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                            + "'Algo deu errado! Por gentileza verificar as informações do produto'"
                            + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                            + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");

                }

            }
            if (editar != null) {
                if (editar.equals("OK")) {
                    out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                            + "'Produto editado com sucesso'"
                            + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                            + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
                } else {
                    out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                            + "'Algo deu errado! Por gentileza verificar as informações do produto'"
                            + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                            + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");

                }

            }

            if (excluir != null) {
                if (excluir.equals("OK")) {
                    out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                            + "'Produto excluido com sucesso'"
                            + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                            + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
                } else {
                    out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                            + "'Algo deu errado! Por gentileza verificar as informações do produto'"
                            + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                            + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
                }
            }
        %>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script>selecionarTabela()</script>
    </body>
</html>
