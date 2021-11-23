<%-- 
    Document   : cliente
    Created on : 18/11/2021, 02:21:35
    Author     : Ander
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="classes.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String status = request.getParameter("status");
    String editar = request.getParameter("editar");
    String excluir = request.getParameter("excluir");


%>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
         <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="aplicação.css"/>
        <script src="javascript/principal.js"></script>
        <script src="javascript/cliente.js"></script>
        <title>Clientes - MyEstoque</title>

    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light transparente">
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
                                <input class="form-control " type="text" id="txtBusca"  action="POST" placeholder="Buscar..."/>
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
        <section id="home" class="d-flex">
            <article class="container  mt-5 ">
                <div class="row">
                    <h1 class="bg-success text-center p-2 text-white fw-bolder">Área do cliente</h1>
                    <div class="col-md-12 bg-white border ">
                        <div id="minhaDiv" >
                            <form class="row" accept-charset="character_set" method="post" action="cadastrarClienteServlet">
                                <fieldset class="col-md-6 p-3">
                                    <legend class="text-center fw-bolder text-danger">Dados Pessoais</legend>

                                    <div class="form-group">
                                        <input class="form-control " placeholder="Nome..." type="text" name="nome">
                                    </div>
                                    <div class="form-group">
                                        <label class ="mb-2 mt-2">Data de Nascimento:  </label>
                                        <input class="form-control " placeholder="Nascimento:  " type="date" name="nascimento" > 
                                    </div>
                                    <div class="form-group">
                                        <label class ="mb-2 mt-2">RG: </label>
                                        <input class="form-control " type="text" placeholder="xx.xxx.xxx-xx"name="rg" size="13" maxlength="13"> 
                                    </div>
                                    <div class="form-group">
                                        <label class ="mb-2 mt-2">CPF:</label>

                                        <input class="form-control " type="text" name="cpf" placeholder="xxx.xxx.xxx-xx" size="15" maxlength="15">
                                    </div>  
                                </fieldset>

                                <fieldset class="col-md-6 p-3">
                                    <legend class="text-center fw-bolder text-danger">Dados de Endereço</legend>
                                    <div class="form-group">
                                        <label class ="mb-2 mt-2" for="rua">Endereço: </label>


                                        <input class="form-control " type="text" name="rua" id="rua" placeholder="Endereço...">

                                    </div>
                                    <div class="form-group">
                                        <label class ="mb-2 mt-2" for="estado">Estado:</label>


                                        <select class="form-control" name="estado"> 
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

                                        <input class="form-control " type="text" name="cep" size="9" maxlength="9" placeholder="xxxxx-xxx"> 
                                          </div>

                                        </fieldset>
                                       
                                <div>
                                        <input class=" btn btn-success btn-customized ms-2"type="submit" value="Cadastrar">
                                        <button class="btn btn-danger" type="button" onclick="Mudarestado('minhaDiv')">Cancelar</button> 
                                </div>
                            </form>
                        </div>
                            <div id="divEditar" >
                                <form class="row" action="editarClienteServlet" accept-charset="character_set" method="post">
                                    <fieldset class="col-md-6 p-3">
                                        <legend class="text-center fw-bolder text-danger">Dados Pessoais</legend>

                                        <div class="form-group">
                                            <input class="form-control " placeholder="Nome..." type="text" id="EditClienteNome" name="EditClienteNome">
                                        </div>
                                        <div class="form-group">
                                            <label class ="mb-2 mt-2">Data de Nascimento:  </label>
                                            <input class="form-control " placeholder="Nascimento:  " type="date" name="EditClienteNascimento" id="EditClienteNascimento"> 
                                        </div>
                                        <div class="form-group">
                                            <label class ="mb-2 mt-2">RG: </label>
                                            <input class="form-control " type="text" placeholder="xx.xxx.xxx-xx"name="EditClienterg" id="EditClienterg"size="13" maxlength="13"> 
                                        </div>
                                        <div class="form-group">
                                            <label class ="mb-2 mt-2">CPF:</label>

                                            <input class="form-control " type="text" name="EditClientecpf" id="EditClientecpf" placeholder="xxx.xxx.xxx-xx" size="15" maxlength="15">
                                        </div>  
                                    </fieldset>

                                    <fieldset class="col-md-6 p-3">
                                        <legend class="text-center fw-bolder text-danger">Dados de Endereço</legend>
                                        <div class="form-group">
                                            <label class ="mb-2 mt-2" for="rua">Endereço: </label>


                                            <input class="form-control " type="text" name="EditClienterua" id="EditClienterua" placeholder="Endereço...">

                                        </div>
                                        <div class="form-group">
                                            <label class ="mb-2 mt-2" for="estado">Estado:</label>


                                            <select class="form-control" name="EditClienteestado"  id="EditClienteestado"> 
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

                                            <input class="form-control " type="text" name="EditClientecep" id="EditClientecep" size="9" maxlength="9" placeholder="xxxxx-xxx"> 
                                        </div>
                                            </fieldset>
                                            <div>
                                                <input class=" btn btn-success btn-customized ms-2"type="submit" value="Editar">
                                                <button class="btn btn-danger" type="button" onclick="Mudarestado('divEditar')">Cancelar</button> 
                                            </div>
                                            </form>
                            </div>
                                        <div class="mt-5">
                                            <button class="btn fw-bolder me-5 btn-primary float-start" type="button" onclick="Mudarestado('minhaDiv')">Fazer Cadastro</button> 
                                            <button class="btn fw-bolder ms-2 btn-warning text-white float-start" type="button"  onclick="estadoEditar('divEditar')">Editar Cliente</button> 
                                            <form id="excluirform" name="excluirform" " class="float-start" action="excluirClienteServlet" method="post">
                                                <button id="excluir" onclick="confirmar()" class="btn fw-bolder ms-5 btn-danger text-white " type="submit">Excluir Cliente</button>  
                                                <input class="input-hidden"  type="hidden" name ="excluirCliente" id="excluirCliente">
                                            </form>
                                        </div>
                                        <table id="tabelaCliente" class="table mt-5 table-striped table-hover table-responsive-md">  
                                            <caption>Lista de Clientes</caption>
                                            <thead>
                                                <tr>
                                                    <th scope="col" >#</th>
                                                    <th scope="col">Nome</th>
                                                    <th scope="col">Nascimento</th>
                                                    <th scope="col">RG</th>
                                                    <th scope="col">CPF</th>
                                                    <th scope="col">Endereço</th>
                                                    <th scope="col">Estado</th>
                                                    <th scope="col" >CEP</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%                                  ArrayList<Cliente> lista = new ClienteDAO().getClientes();

                                                    for (int i = 0; i < lista.size(); i++) {
                                                        out.println("<tr>");
                                                        out.println("<td><input class='editar' type='checkbox' id='" + (i + 1) + "' value='" + lista.get(i).getNome() + "' ></td>");
                                                        out.println("<th scope='row'>" + lista.get(i).getNome() + "</th >");
                                                        out.println("<td>" + lista.get(i).getNascimento() + "</td>");
                                                        out.println("<td>" + lista.get(i).getRg() + "</td>");
                                                        out.println("<td>" + lista.get(i).getCpf() + "</td>");
                                                        out.println("<td>" + lista.get(i).getEndereco() + "</td>");
                                                        out.println("<td>" + lista.get(i).getEstado() + "</td>");
                                                        out.println("<td>" + lista.get(i).getCep() + "</td>");
                                                        out.println("</tr>");
                                                    }
                                                %> 
                                            </tbody>
                                        </table> 

                                        </div>
                                        </div>
                                        </article>
                                        </section>
                                        <%
                                            if (status != null) {
                                                if (status.equals("OK")) {
           out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                    + "'Cliente cadastrado com sucesso'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
        }
        else{
                out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                    + "'Algo deu errado! Por gentileza verificar as informações do cliente'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
       
        }
   
    }
               if (editar != null){
        if (editar.equals("OK")){
                      out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                    + "'Cliente editado com sucesso'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
        }
        else{
                out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                    + "'Algo deu errado! Por gentileza verificar as informações do cliente'"
                    + ",showClass: {popup: 'animate__animated animate__zoomIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
       
        }
   
    }
        
    if (excluir != null){
        if (excluir.equals("OK")){
                    out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                    + "'Cliente excluido com sucesso'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
        }
        else{
                out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                    + "'Algo deu errado! Por gentileza verificar as informações do cliente'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
       }
        }
                                        %>
                                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
                                        <script>selecionarCliente();</script>
                                        </body>
                                        </html>
