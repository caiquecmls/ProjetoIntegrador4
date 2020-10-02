
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
                
                <form action="ListarProdutos" method="Post">
                    <label>Localize:</label>
                    <input type="text" class="form-control" onkeypress='return letras();' required name= "Filtro"/> 
                    <button class="btn btn-outline-success" type="submit" >ok</button>
                </form>
                <label>Filtro: ${Buscar}</label> 
                
                <form action="ListarProdutos" method="Post">
                    <input   type="hidden" value=""  name= "Filtro"/> 
                    <button type="submit" >Limpar filtro</button>
                </form>
                
                 <form action="ListarProdutosBeleza" method="POST">
                    <input  type="hidden" value="BELEZA"  name= "CategoriasB"/> 
                    <button  type="submit" >Beleza</button>
                </form> 
                <form action="ListarProdutosSaude" method="POST">
                    <input type="hidden" value="SAUDE"  name= "CategoriasS"/> 
                    <button type="submit" >Saude</button>
                </form>
                 <form action="ListarProdutosEquipamentos" method="POST">
                    <input type="hidden" value="EQUIPAMENTOS"  name="CategoriasE"/> 
                    <button  type="submit" >Equipamentos</button>
                </form>
                 <form action="ListarProdutosPromocoes" method="POST">
                    <input type="hidden" value="PROMOCOES"  name= "CategoriasP"/> 
                    <button type="submit" >Promoções</button>
                </form>
                <form action="cadastroProduto.jsp">
                  <button>Cadastrar</button>
                </form>
                
                <div align="center">
                    <table class="table" width="10%" >
                        <thead class="table-dark" >
                            <tr>  
                                <th scope="col">Nome</th>
                                <th scope="col">Quantidade</th>
                                <th scope="col" >Valor Unitario</th>
                                <th scope="col"> Total</th>
                            </tr>
                        </thead>


                        <c:forEach var="c" items="${itens}">
                            <tr>
                                <td>${c.nome}</td>
                                <td>${c.quantidade} </td>
                                <td>${c.valor}</td>
                                <td>  </td>
                          
                                <td><input type="hidden" name="urlimagemBase64" id="urlimagemBase64"
                                           ${c.imagem}</td>
                            <div style="float: right; width: 45%;">
                                <img src="<c:out value="${c.imagem}"/>" width="50%"
                                     style="min-height: 250px;" border="0" id="target" name="target"> 
                                <br />
                            </div>   
                      
                           
                            </tr>


                        </c:forEach>

                        <tr></tr>
                    </table>

                    <param name="PRD_ID" value="${c.id}">
                    <a href="index.html">Início</a>
                </div>
            </div>
        </div>
                  
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
                    </body>
                    </html>
                    
