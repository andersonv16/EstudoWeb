<%-- 
    Document   : produto
    Created on : 16/11/2021, 13:23:26
    Author     : Ander
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="classes.Produto"%>
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
        <title>Produto - MyEstoque</title>

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
        <section id="home" class="d-flex">
            <article class="container  mt-5 ">
                <div class="row">
                    <h1 class="bg-primary text-center p-2 text-white fw-bolder">Área do produto</h1>
                    <div class="col-md-12 bg-white border ">
                      <div id="minhaDiv">
                        <form  class="row" action="cadastrarProdutoServlet" accept-charset="character_set" method="post">
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
                            <form  class="row" action="editarProdutoServlet" accept-charset="character_set" method="post">
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
                                <form id="excluirform" name="excluirform" " class="float-start" action="excluirProdutoServlet" method="post">
                                    <button id="excluir" onclick="confirmar()" class="btn fw-bolder ms-5 btn-danger text-white " type="submit">Excluir Produto</button>  
                                     <input class="input-hidden"  type="hidden" name ="codigoExcluir" id="codigoExcluir">
                                </form>
                            </div>
                              
                          <table id="tabelaProduto" class="table mt-5 table-striped table-hover table-responsive-md">  
                              <caption>Lista de Produtos</caption>
                              <thead>
                            <tr>
                        <th scope="col" >#</th>
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
                              <%
                                  
                    ArrayList<Produto> lista = new ProdutoDAO().getProdutos();

                    for(int i = 0; i < lista.size(); i++){
                        out.println("<tr>");
                        out.println("<td><input class='editar' type='checkbox' id='" + (i+1) + "' value='" + lista.get(i).getNome() + "' ></td>");
                        out.println("<th scope='row'>" + lista.get(i).getId()+"</th >");
                        out.println("<td>" + lista.get(i).getNome() + "</td>");
                        out.println("<td>" + lista.get(i).getDescricao()+ "</td>");
                        out.println("<td>" + lista.get(i).getCategoria()+ "</td>");
                        out.println("<td>" + lista.get(i).getFornecedor()+ "</td>");
                        out.println("<td>" + lista.get(i).getUnidade()+ "</td>");
                        out.println("<td>" + lista.get(i).getValor_unit()+ "</td>");
                        out.println("</tr>");
                    }
%> 
                        </tbody>
                          </table>
                </div>
            </article>
        </section>
        
                 <%
            
        if (status != null){
        if (status.equals("OK")){
          out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                    + "'Produto cadastrado com sucesso'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
        }
        else{
                out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                    + "'Algo deu errado! Por gentileza verificar as informações do produto'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
       
        }
   
    }
               if (editar != null){
        if (editar.equals("OK")){
                      out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                    + "'Produto editado com sucesso'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
        }
        else{
                out.println("<script>Swal.fire({icon: 'error',title: 'Oh no...',text: "
                    + "'Algo deu errado! Por gentileza verificar as informações do produto'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
       
        }
   
    }
        
    if (excluir != null){
        if (excluir.equals("OK")){
                    out.println("<script>Swal.fire({icon: 'success',title: 'Tudo Certo...',text: "
                    + "'Produto excluido com sucesso'"
                    + ",showClass: {popup: 'animate__animated animate__bounceIn'}"
                    + ",hideClass: {popup: 'animate__animated animate__bounceOutDown'}})</script>");
        }
        else{
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
