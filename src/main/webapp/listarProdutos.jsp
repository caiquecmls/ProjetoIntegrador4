
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <title>'FarmaSis</title>
        <style>
            a{
                font-family: verdana;
                font-size:18px;
                color:#5298C7;
                text-decoration: none;	
            }
        </style> 

        <script type="text/javascript"></script>
    </head>

    <img src="logo_farmasis.jpg" height="80" width="180">
    <img src="logo_drogaria.jpg" height="80" width="180" align="right">
    <body>

        <h4 style="text-align: center;"> </h4>
           <div class="jumbotron jumbotron-fluid p-1">
            <div class="container-fluid mr-5"> 
                <h1 class="display-5">Lista de produtos</h1>
                <form action="ListarProdutos">
                    <select name="filial" id="sfilial" class="form-control mx-sm-0 mb-2">
                        <option>Selecione Filial</option>
                        <option value="1">Filial 1</option>
                        <option value="2">Filial 2</option>
                        <option value="3">Filial 3</option>
                        <option value="0">Todas Filiais</option>
                    </select>
                    <button class="btn btn-outline-success"  type="submit">Listar</button>  
                </form>  
                <div align="center">
                    <table class="table" width="10%" >
                        <thead class="table-dark" >
                            <tr>  
                                 <th scope="col">Descrição</th>
                                <th scope="col">Quantidade</th>
                                <th scope="col">Valor</th>
                                <th scope="col">Categoria</th>
                                <th scope="col" ></th>
                                <th scope="col"></th>

                        </thead>


                        <c:forEach var="c" items="${produtos}">
                            <tr>
                                <td>${c.id}</td>
                                 <td>${c.descricao}</td>
                                <td>${c.quantidade}</td>
                                <td>${c.valor}</td>
                                <td>${c.categoria}</td>
                                <td>

                                    <form action="DeletarProduto">
                                        <input name="PRD_ID" type="hidden" size=1 value="${c.id}">                              

                                        <button class="btn btn-outline-danger" type="submit">deletar</button>  
                                    </form>   
                                </td>
                                <td>
                                    <form action="EditarProduto">
                                        <input name="PRD_ID"  type="hidden"  value="${c.id}">                              

                                        <button class="btn btn-outline-warning" type="submit">Editar</button>  
                                    </form>   
                                </td>
                                  <td>
                                    <form action="ControllerImagem">
                                        <input name="PRD_ID"  type="hidden"  value="${c.id}">                              

                                        <button class="btn btn-outline-warning" type="submit">Visualizar</button>  
                                    </form>   
                                </td>

                            </tr>
                        </c:forEach>

                        <tr></tr>
                    </table>

                    <param name="PRD_ID" value="${c.id}">
                    <a href="index.html">Início</a>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
                    </body>
                    </html>
