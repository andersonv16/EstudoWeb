<%-- 
    Document   : funcionaro
    Created on : 21/11/2021, 22:30:45
    Author     : Ander
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.FuncionarioDAO"%>
<%@page import="classes.Funcionario"%>
<%@page import="classes.Funcionario"%>
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
        <script src="assets/js/funcionario.js"></script>
        <script src="assets/js/principal.js"></script>

        <title>Funcionários - MyEstoque</title>

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
                                <h1 class="bg-secondary text-center p-2 text-white fw-bolder">Área do funcionário</h1>
                                <div class="col-md-12 bg-white border ">
                                    <div id="minhaDiv">
                                        <form class="row" action="<c:url value="cadastrarFuncionarioServlet"/>" accept-charset="character_set" method="post">
                                             <fieldset class="ms-5 mt-2 p-2 col-md-5 ">  
                                                <legend class="text-center fw-bolder text-success">Dados Pessoais</legend>

                                                <div class="form-group">
                                                    <input class="form-control " placeholder="Nome..." type="text" id="nomeFunc" name="nomeFunc">
                                                </div>
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2">Data de Nascimento:  </label>
                                                    <input class="form-control " placeholder="Nascimento:  " type="date" name="nascFunc" id="nascFunc"> 
                                                </div>
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2">RG: </label>
                                                    <input class="form-control " type="text" placeholder="xx.xxx.xxx-xx"name="FuncRG" id="FuncRG"size="13" maxlength="13"> 
                                                </div>
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2">CPF:</label>

                                                    <input class="form-control " type="text" name="funcCPF" id="funcCPF" placeholder="xxx.xxx.xxx-xx" size="15" maxlength="15">
                                                </div>  
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2" for="cargo">Cargo: </label>


                                                    <select class="form-control" name="cargoFunc"  id="cargoFunc"> 
                                                        <option value="Administrador">Administrador</option> 
                                                        <option value="Analista">Analista</option> 
                                                        <option value="Auxiliar">Auxiliar</option> 
                                                        <option value="Estagiário">Estagiário</option> 
                                                        <option value="Gerente">Gerente</option> 
                                                        <option value="Vendedor">Vendedor</option> 
                                                    </select>
                                                </div>
                                            </fieldset>

                                            <fieldset class="col-md-5 p-3">
                                                <legend class="text-center fw-bolder text-success">Dados de Endereço</legend>
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2" for="rua">Endereço: </label>


                                                    <input class="form-control " type="text" name="enderecoFunc" id="enderecoFunc" placeholder="Endereço...">

                                                </div>
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2" for="estado">Estado:</label>


                                                    <select class="form-control" name="funcEstado"  id="funcEstado"> 
                                                        <option value="AC">Acre</option> 
                                                        <option value="AL">Alagoas</option> 
                                                        <option value="AM">Amazonas</option> 
                                                        <option value="AP">Amapá</option> 
                                                        <option value="BA">Bahia</option> 
                                                        <option value="CE">Ceará</option> 
                                                        <option value="DF">Distrito Federal</option> 
                                                        <option value="ES">Espírito Santo</option> 
                                                        <option value="GO">Goiás</option> 
                                                        <option value="MA">Maranhão</option> 
                                                        <option value="MT">Mato Grosso</option> 
                                                        <option value="MS">Mato Grosso do Sul</option> 
                                                        <option value="MG">Minas Gerais</option> 
                                                        <option value="PA">Pará</option> 
                                                        <option value="PB">Paraíba</option> 
                                                        <option value="PR">Paraná</option> 
                                                        <option value="PE">Pernambuco</option> 
                                                        <option value="PI">Piauí</option> 
                                                        <option value="RJ">Rio de Janeiro</option> 
                                                        <option value="RN">Rio Grande do Norte</option> 
                                                        <option value="RO">Rondônia</option> 
                                                        <option value="RS">Rio Grande do Sul</option> 
                                                        <option value="RR">Roraima</option> 
                                                        <option value="SC">Santa Catarina</option> 
                                                        <option value="SE">Sergipe</option> 
                                                        <option value="SP">São Paulo</option> 
                                                        <option value="TO">Tocantins</option> 
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2" for="cep">CEP: </label>

                                                    <input class="form-control " type="text" name="cepFunc" id="cepFunc" size="9" maxlength="9" placeholder="xxxxx-xxx"> 
                                                </div>
                                            </fieldset>
                                            <div>
                                                <input class=" btn btn-success btn-customized ms-2"type="submit" value="Cadastrar">
                                                <button class="btn btn-danger" type="button" onclick="Mudarestado('minhaDiv')">Cancelar</button> 
                                            </div>
                                        </form>
                                    </div>
                                    <div id="divEditar">
                                        <form class="row" action="<c:url value="editarFuncionarioServlet"/>" accept-charset="character_set" method="post">
                                            <fieldset class="col-md-6 p-3">
                                                <legend class="text-center fw-bolder text-success">Dados Pessoais</legend>

                                                <div class="form-group">
                                                    <input class="form-control " placeholder="Nome..." type="text" id="nomeeditar" name="nomeeditar">
                                                </div>
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2">Data de Nascimento:  </label>
                                                    <input class="form-control " placeholder="Nascimento:  " type="date" name="nasceditar" id="nasceditar"> 
                                                </div>
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2">RG: </label>
                                                    <input class="form-control " type="text" placeholder="xx.xxx.xxx-xx"name="editarRG" id="editarRG"size="13" maxlength="13"> 
                                                </div>
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2">CPF:</label>

                                                    <input class="form-control " type="text" name="editarCPF" id="editarCPF" placeholder="xxx.xxx.xxx-xx" size="15" maxlength="15">
                                                </div>  
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2" for="cargo">Cargo: </label>


                                                    <select class="form-control" name="cargoeditar"  id="cargoeditar"> 
                                                        <option value="Administrador">Administrador</option> 
                                                        <option value="Analista">Analista</option> 
                                                        <option value="Auxiliar">Auxiliar</option> 
                                                        <option value="Estagiário">Estagiário</option> 
                                                        <option value="Gerente">Gerente</option> 
                                                        <option value="Vendedor">Vendedor</option> 
                                                    </select>
                                                </div>
                                            </fieldset>

                                            <fieldset class="col-md-6 p-3">
                                                <legend class="text-center fw-bolder text-success">Dados de Endereço</legend>
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2" for="rua">Endereço: </label>


                                                    <input class="form-control " type="text" name="enderecoeditar" id="enderecoeditar" placeholder="Endereço...">

                                                </div>
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2" for="estado">Estado:</label>


                                                    <select class="form-control" name="editarEstado"  id="editarEstado"> 
                                                        <option value="AC">Acre</option> 
                                                        <option value="AL">Alagoas</option> 
                                                        <option value="AM">Amazonas</option> 
                                                        <option value="AP">Amapá</option> 
                                                        <option value="BA">Bahia</option> 
                                                        <option value="CE">Ceará</option> 
                                                        <option value="DF">Distrito Federal</option> 
                                                        <option value="ES">Espírito Santo</option> 
                                                        <option value="GO">Goiás</option> 
                                                        <option value="MA">Maranhão</option> 
                                                        <option value="MT">Mato Grosso</option> 
                                                        <option value="MS">Mato Grosso do Sul</option> 
                                                        <option value="MG">Minas Gerais</option> 
                                                        <option value="PA">Pará</option> 
                                                        <option value="PB">Paraíba</option> 
                                                        <option value="PR">Paraná</option> 
                                                        <option value="PE">Pernambuco</option> 
                                                        <option value="PI">Piauí</option> 
                                                        <option value="RJ">Rio de Janeiro</option> 
                                                        <option value="RN">Rio Grande do Norte</option> 
                                                        <option value="RO">Rondônia</option> 
                                                        <option value="RS">Rio Grande do Sul</option> 
                                                        <option value="RR">Roraima</option> 
                                                        <option value="SC">Santa Catarina</option> 
                                                        <option value="SE">Sergipe</option> 
                                                        <option value="SP">São Paulo</option> 
                                                        <option value="TO">Tocantins</option> 
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label class ="mb-2 mt-2" for="cep">CEP: </label>

                                                    <input class="form-control " type="text" name="cepeditar" id="cepeditar" size="9" maxlength="9" placeholder="xxxxx-xxx"> 
                                                </div>
                                            </fieldset>
                                            <div>
                                                <input class=" btn btn-success btn-customized ms-2"type="submit" value="Cadastrar">
                                                <button class="btn btn-danger" type="button" onclick="Mudarestado('divEditar')">Cancelar</button> 
                                            </div>
                                        </form>
                                    </div>
                                    <div class="mt-5">
                                        <button class="btn fw-bolder me-5 btn-primary float-start" type="button" onclick="Mudarestado('minhaDiv')">Fazer Cadastro</button> 
                                        <button class="btn fw-bolder ms-2 btn-warning text-white float-start" type="button"  onclick="estadoEditar('divEditar')">Editar Funcionario</button> 
                                        <form id="excluirform" name="excluirform" " class="float-start" action="<c:url value="excluirFuncionarioServlet"/>" method="post">
                                            <button id="excluir" onclick="confirmar()" class="btn fw-bolder ms-5 btn-danger text-white " type="submit">Excluir Funcionario</button>  
                                            <input class="input-hidden"  type="hidden" name ="codigoExcluir" id="codigoExcluir">
                                        </form>
                                    </div>
                                    <table id="tabelaFuncionario" class="table mt-5 table-striped table-hover table-responsive-md">  
                                        <caption>Lista de Funcionários</caption>
                                        <thead>
                                            <tr>
                                                <th scope="col" >#</th>
                                                <th scope="col">Nome</th>
                                                <th scope="col">Nascto</th>
                                                <th scope="col">RG</th>
                                                <th scope="col">CPF</th>
                                                <th scope="col">Cargo</th>
                                                <th scope="col">Endereço</th>
                                                <th scope="col">UF</th>
                                                <th scope="col">CEP</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listarFuncionario}" var="listas">
                                                 <tr>
                                            <td><input class='editar' type='checkbox' id="" value='${listas.nome}'></td>
                                                <th>${listas.nome}</th>
                                                <td>${listas.nascimento}</td>
                                                <td>${listas.rg}</td>
                                                <td>${listas.cpf}</td>
                                                <td>${listas.cargo}</td>
                                                <td>${listas.endereco}</td>
                                                <td>${listas.estado}</td>
                                                <td>${listas.cep}</td>
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
            <div id="sidebar" >

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
                            + "'Funcionario cadastrado com sucesso'"
                            + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                            + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
                } else {
                    out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                            + "'Algo deu errado! Por gentileza verificar as informações do funcionario'"
                            + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                            + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");

                }

            }
            if (editar != null) {
                if (editar.equals("OK")) {
                    out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                            + "'Funcionario editado com sucesso'"
                            + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                            + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
                } else {
                    out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                            + "'Algo deu errado! Por gentileza verificar as informações do funcionario'"
                            + ",showClass: {popup: 'animate__animated animate__zoomIn'}"
                            + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");

                }

            }

            if (excluir != null) {
                if (excluir.equals("OK")) {
                    out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                            + "'Funcionario excluido com sucesso'"
                            + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                            + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
                } else {
                    out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                            + "'Algo deu errado! Por gentileza verificar as informações do funcionario'"
                            + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                            + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
                }
            }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script>selecionarFuncionario();</script>
    </body>
</html>
