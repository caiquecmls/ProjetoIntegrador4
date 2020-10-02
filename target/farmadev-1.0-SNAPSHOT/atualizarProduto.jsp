<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="farmadev.entidade.Produto"%>
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

    <body>
        <nav class="navbar navbar-expand-lg navbar-light navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="index.html">Inicio</a>
            <button class="navbar-toggler" type="button" href="index.html" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
        <!--        <div>        <img src="logo_farmasis.jpg" height="80" width="180">
                    <img src="logo_drogaria.jpg" height="80" width="180" align="right"></div>-->

    <center>
        <div class="container-fluid mr-5"> 
            <h1 class="display-5">Atualizar informação produto</h1>



            <form action="EditarProduto"method="POST">

                <input  type="hidden" name="base64" id="base64" value="${imagem1.imagem1}" />
                <input  type="hidden" name="base642" id="base642" value="${imagem2.imagem1}"/>
                <input  type="hidden" name="base643" id="base643" value="${imagem3.imagem1}"/>

                <div class="form-group">    
                    <div class="form-row border">
                        <div class="form-group col-md-auto">
                            <input name="PRD_ID" type="hidden" class="form-control" value="${produto.id}"> 
                        </div>

                        <div class="form-group col-md-5px">
                            <label>nome</label>
                            <input name="PRD_NOME" class="form-control"  value="${produto.nome}">
                        </div>
                        <div class="form-group col-md-5px">
                            <label>descrição</label>
                            <input name="PRD_DESCRICAO" class="form-control" value="${produto.descricao}">
                        </div>

                        <div class="form-group col-md-auto">
                            <label>quantidade</label>
                            <input name="PRD_QUANTIDADE" class="form-control" value="${produto.quantidade}">
                        </div>

                        <div class="form-group col-md-auto">
                            <label> Valor </label>
                            <input name="PRD_VALOR_UNIT" class="form-control" value="${produto.valor}">
                        </div>
                        <div class="form-group col-md-auto">
                            <label> Categoria: </label>
                            <select name="PRD_CATEGORIA" class="form-control mx-sm-0 mb-2" value="${produto.categoria}">
                                <option value="BELEZA">BELEZA</option>
                                <option value="EQUIPAMENTOS">EQUIPAMENTOS</option>
                                <option value="SAUDE">SAUDE</option>
                            </select>
                        </div>
                        <div class="form-group col-md-auto">
                            <label> Desconto: </label>
                            <select name="PRD_DESCONTO" class="form-control mx-sm-0 mb-2"value="${produto.desconto}">
                                <option value=""></option>
                                <option value="10">10%</option>
                                <option value="20%">20%</option>
                                <option value="25%">25%</option>
                                <option value="30%">30%</option>
                                <option value="35%">35%</option>
                            </select>
                        </div>
                        <div class="form-group col-md-auto">
                            <label> Desconto: </label>
                            <select name="PRD_PROMOCAO" class="form-control mx-sm-0 mb-2"value="${produto.promocao}">
                                <option value="Nao">Não</option>
                                <option value="Sim">Sim</option>                                   
                            </select>
                        </div>

                        <div class="form-group col-md-auto">
                            <label>Pergunta:</label>
                            <input name="PRG1"  type="hidden" value="${pergunta1.id}"> 
                        </div> 
                        <div class="form-group col-md-5px">
                            <label>Pergunta:</label>                            
                            <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG1" value="${pergunta1.pergunta}"/>
                        </div>
                        <div class="form-group col-md-5px">
                            <label>Resposta:</label>
                            <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_RES1"value="${pergunta1.resposta}"/>

                        </div>
                        <div class="form-group col-md-auto">
                            <input name="PRG2"  type="hidden" value="${pergunta2.id}"> 
                        </div>
                        <div class="form-group col-md-5px">
                            <label>Pergunta:</label>
                            <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG2" value="${pergunta2.pergunta}"/>
                        </div>
                        <div class="form-group col-md-5px">
                            <label>Resposta:</label>
                            <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_RES2"value="${pergunta2.resposta}"/>

                        </div>

                        <div class="form-group col-md-auto">
                            <input name="PRG3"  type="hidden"  value="${pergunta3.id}"> 
                        </div>
                        <div class="form-group col-md-5px">
                            <label>Pergunta:</label>
                            <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG3" value="${pergunta3.pergunta}"/>
                        </div>
                        <div class="form-group col-md-5px">
                            <label>Resposta:</label>
                            <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_RES3"value="${pergunta3.resposta}"/>

                        </div>
                        <div class="form-group col-md-auto">
                            <input name="IMG_ID1"  type="hidden"  value="${imagem1.id1}"> 
                        </div>
                        <div class="form-group col-md-auto">
                            <input name="IMG_ID2"  type="hidden" value="${imagem2.id1}"> 
                        </div>
                        <div class="form-group col-md-auto">
                            <input name="IMG_ID3"  type="hidden"  value="${imagem3.id1}"> 
                        </div>

                        <div>

                            <img  name="img" src="${imagem1.imagem1}" <img alt="Imagem" src="" id="target" width="200" heigth="200">
                            <br />
                            <input type="button" value="Excluir imagem" onclick="deletaFoto();">
                            <input 
                                onchange="visualizarImg();" type="file" value="Selecionar a imagem">
                        </div>

                        <div>

                            <img name="img2" src="${imagem2.imagem1}" <img alt="Imagem" src="" id="target" width="200" heigth="200">

                            <br />
                            <input type="button" value="Excluir imagem" onclick="deletaFoto2();">
                            <input 
                                onchange="uploadFile2();" type="file" name="file2" value="Selecionar a imagem">
                        </div>
                        <div>                   
                            <img name="img3" src="${imagem3.imagem1}" <img alt="Imagem" src="" id="target" width="200" heigth="200">
                            <br />
                            <input type="button" value="Excluir imagem" onclick="deletaFoto3();">
                            <input 
                                onchange="uploadFile3();" type="file" name="file3" value="Selecionar a imagem">
                        </div>

                    </div>  

                    <div class="container m-3">
                        <button class="btn btn-outline-success" type="submit" >Atualizar</button>

                    </div>
                </div>
            </form>
   
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
            </body>
            <script type="text/javascript">

                                        // transforma a imagem em base64 e mostra no navegador
                                        function visualizarImg() {
                                            var preview = document.querySelector('img'); /// pega o campo de imagem
                                            var file = document.querySelector('input[type=file]').files[0]; // pega o primeiro input que armazena a imagem em base 64
                                            var reader = new FileReader();

                                            reader.onloadend = function () {
                                                preview.src = reader.result;// carrega em base64 a img
                                                document.getElementById("base64").value = reader.result; // seta o valor da imagem ao intputtext urlimagemBase64
                                            };

                                            if (file) {
                                                reader.readAsDataURL(file); // faz o prewiew da imagem na tela	    
                                            } else {
                                                preview.src = "";
                                            }

                                        }



                                        function uploadFile2() {
                                            var target2 = document.querySelector('img[name=img2]'); /// pega o campo de imagem
                                            var file2 = document.querySelector('input[name=file2]').files[0]; // pega o primeiro input que armazena a imagem em base 64
                                            var reader = new FileReader();

                                            reader.onloadend = function () {
                                                target2.src = reader.result;// carrega em base64 a img
                                                document.getElementById("base642").value = reader.result;
                                            };

                                            if (file2) {
                                                reader.readAsDataURL(file2); // faz o prewiew da imagem na tela	    
                                            } else {
                                                preview.src = "";
                                            }
                                        }

                                        function uploadFile3() {
                                            var target3 = document.querySelector('img[name=img3]'); /// pega o campo de imagem
                                            var file3 = document.querySelector('input[name=file3]').files[0]; // pega o primeiro input que armazena a imagem em base 64
                                            var reader = new FileReader();

                                            reader.onloadend = function () {
                                                target3.src = reader.result;// carrega em base64 a img
                                                document.getElementById("base643").value = reader.result;
                                            };

                                            if (file3) {
                                                reader.readAsDataURL(file3); // faz o prewiew da imagem na tela	    
                                            } else {
                                                preview.src = "";
                                            }

                                        }


                                        function deletaFoto() {
                                            var preview = document.querySelector('img');
                                            preview.src = '';
                                            document.getElementById("base64").value = '';
                                            document.getElementById("target").src = '';

                                        }

                                        function deletaFoto2() {
                                            var preview = document.querySelector('img[name=img2]');
                                            preview.src = '';
                                            document.getElementById("base642").value = '';
                                            document.getElementById("target").src = '';

                                        }

                                        function deletaFoto3() {
                                            var preview = document.querySelector('img[name=img3]');
                                            preview.src = '';
                                            document.getElementById("base643").value = '';
                                            document.getElementById("target").src = '';

                                        }


            </script>
            </html>
