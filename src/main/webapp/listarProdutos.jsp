
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <title>'FarmaSis</title>
        <style>

            a{
                font-family: verdana;
                font-size:18px;
                color:#5298C7;
                text-decoration: none;	
            }
            div.box {
                border:5px solid #999;
                width: 150px;
                display: inline-block;
            }


            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
            }


            li {

                float: left;
            }



            div {
                margin-top: 1px;
                margin-right: 1px;
                margin-bottom: 10px;
                margin-left: 10px;
            }


            .margintop{
                margin-top:5px;
            }


        </style> 

        <script type="text/javascript"></script>
    </head>


    <body>

        <nav class="navbar navbar-expand-lg navbar-light navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="ListarProdutos">Inicio</a>
            <button class="navbar-toggler" type="button" href="index.html" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
        <img src="logo_farmasis.jpg" height="80" width="180">
        <img src="logo_drogaria.jpg" height="80" width="180" align="right">

        <h4 style="text-align: center;"> </h4>
        <div class="jumbotron jumbotron-fluid p-1">
            <div class="container-fluid mr-5"> 
                <center>
                    <h2 class="display-5">Lista de produtos</h2>
                </center>
            </div>
        </div>
        <div align="center">
            <table>           
                <td>
                    <form action="ListarProdutos" method="Post">
                        <div class="form-inline my-2 my-lg-0">
                            <input type="text" class="form-control " placeholder="Buscar" onkeypress='return letras();' required name= "Filtro"/>
                            <input class="btn btn-primary " type="submit"value="pesquisar">
                        </div>
                    </form>   
                </td>
            </table>
        </div>

        <div align="center">
            <table>
                <tr>
                    <td>
                        <div>
                            <form action="ListarProdutos" method="Post">
                                <input   type="hidden" class="center"value=""  name= "Filtro"/> 
                                <button type="submit"  class="btn btn-secondary"> Limpar filtro</button>
                            </form>
                        </div>
                    </td>
                    <td>
                        <div>
                            <form action="ListarProdutosBeleza" method="POST">
                                <input  type="hidden" value="BELEZA"  name= "CategoriasB"/> 
                                <button  type="submit" class="btn btn-secondary">Beleza</button>
                            </form> 
                        </div>
                    </td>
                    <td>
                        <div>
                            <form action="ListarProdutosSaude" method="POST">
                                <input type="hidden" value="SAUDE"  name= "CategoriasS"/> 
                                <button type="submit"class="btn btn-secondary"> Saude</button>
                            </form>
                        </div>
                    </td>
                    <td>
                        <div>
                            <form action="ListarProdutosEquipamentos" method="POST">
                                <input type="hidden" value="EQUIPAMENTOS"  name="CategoriasE"/> 
                                <button  type="submit" class="btn btn-secondary">Equipamentos</button>
                            </form>
                        </div>
                    </td>
                    <td>
                        <div>
                            <form action="ListarProdutosPromocoes" method="POST">
                                <input type="hidden" value="PROMOCOES"  name= "CategoriasP"/> 
                                <button type="submit"class="btn btn-secondary"> Promoções</button>
                            </form>
                        </div>
                    </td>
                    <td>
                        <div>
                            <form action="cadastroProduto.jsp">
                                <button class="btn btn-secondary">Cadastrar</button>   </form>  
                        </div>
                    </td>
            </table></div>

        <div align="center">
            <table class="table" width="%" >
                <c:forEach var="c" items="${produtos}">  
                    <div class="box">
                        <center>${c.nome}<br></center>
                        <img src="<c:out value="${c.imagem}"/>" width="140px" height="140px" 
                             style="min-height: 100px;" border="0" id="target" name="target"> 
                        <center>Preço: ${c.valor}</center>

                        <form action="DeletarProduto">
                            <input name="PRD_ID" type="hidden" size=1 value="${c.id}">                              
                            <button class="btn btn-outline-danger" type="submit">deletar</button>  
                        </form>                             

                        <form action="EditarProduto">
                            <input name="PRD_ID"  type="hidden"  value="${c.id}">                              
                            <button class="btn btn-outline-warning" type="submit">Editar</button>
                        </form>   

                        <form action="DetalhesProdutos">
                            <input name="PRD_ID"  type="hidden"  value="${c.id}">                              
                            <button class="btn btn-outline-warning" type="submit">Detalhes</button>  
                        </form>                                                      

                        <form action="Carrinho">
                            <input name="PRD_ID"  type="hidden"  value="${c.id}">                                     
                            <button class="btn btn-outline-warning" type="submit">Comprar</button>  
                        </form>   
                        <br />  
                    </div>

                    <td>                       
                        <input type="hidden" name="urlimagemBase64" id="urlimagemBase64"       
                               ${c.imagem}</td>
                    </td>

                </c:forEach>


            </table>

            <param name="PRD_ID" value="${c.id}">
        </div>
    </body>
</html>

