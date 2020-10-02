<%-- 
    Document   : cadastroProduto
    Created on : 15/09/2020, 16:50:29
    Author     : Renato
--%>
<%@page import="farmadev.entidade.Produto"%>
<%@page import="farmadev.entidade.Imagem"%>




<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>

        <style>

            .lado{
                margin-left: 25px;
            }

            .conteudo{
                display: table;
            }
            .imagem{
                display: table-cell;
                float: left;
            }
            .texto{
                display: table-cell;
                float: left;
                width: 250px;
                margin-top: 500px;
                margin-bottom: 660px;
                margin-left:  1px;

            }

            .bordaimg{
                padding-left: 40px;
                padding-right: 40px;
                padding-bottom:  5px;
                padding-top: 10px;
                margin-left:  10px;
                margin-top: 10px;
                margin-right:   700px;
                margin-bottom:  60px;
                border-top: 4px solid #7c7; /* mid green */
                border-left:4px solid #7c7 ;
                border-right: 4px solid #7c7 ;
                border-bottom: 4px solid #7c7 ;
                background-color: #efe;     /* pale green */  
                width: 45%;
            }

            .bordaimgDir{
                padding-left: 40px;
                padding-right: 40px;
                padding-bottom:  5px;
                padding-top: 10px;
                margin-left:  670px;
                margin-top: -622px;
                margin-right:   50px;
                margin-bottom:  60px;
                border-top: 4px solid #7c7; /* mid green */
                border-left:4px solid #7c7 ;
                border-right: 4px solid #7c7 ;
                border-bottom: 4px solid #7c7 ;
                background-color: #efe;     /* pale green */  
                width: 45%;
            }

            .botoes{
                margin-left: 700px;
                margin-top: -950px;
            }

        </style>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="ListarProdutos">Inicio</a>
            <button class="navbar-toggler" type="button" href="index.html" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
        <!--        <div>        <img src="logo_farmasis.jpg" height="80" width="180">
                    <img src="logo_drogaria.jpg" height="80" width="180" align="right"></div>-->

    <center><h2><b>Cadastrar Produto</b></h2></center>

    <div class="lado">
        <div class="form-group">
            <form action="CadastroProduto" method="POST">
                <input type="hidden" name="base64" id="base64" value="${imagem.imagem1}" />
                <input type="hidden" name="base642" id="base642" value="${imagem.imagem2}"/>
                <input type="hidden" name="base643" id="base643" value="${imagem.imagem3}"/>

                <div class="form-row border">
                    <div class="form-group col-md-5px">
                        <label>Nome:</label>
                        <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_NOME"/>
                    </div>

                    <div class="form-group col-md-5px">
                        <label>Descrição:</label>
                        <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_DESCRICAO"/>
                    </div>

                    <div class="form-group col-md-auto">
                        <label>Quantidade:</label>
                        <input type="text" class="form-control" onkeypress='return numeros();' required name= "PRD_QUANTIDADE"/>
                    </div>

                    <div class="form-group col-md-auto">
                        <label> Valor unitario: </label>
                        <input type="text" class="form-control" onkeypress='return numeros();' required name= "PRD_VALOR_UNIT">
                    </div>

                    <div class="form-group col-md-auto">
                        <label> Categoria: </label>
                        <select name="PRD_CATEGORIA" class="form-control mx-sm-0 mb-2">
                            <option value="BELEZA">BELEZA</option>
                            <option value="EQUIPAMENTOS">EQUIPAMENTOS</option>
                            <option value="SAUDE">SAUDE</option>
                        </select>
                    </div>

                    <div class="form-group col-md-auto">

                        <label> Desconto: </label>
                        <select name="PRD_DESCONTO" class="form-control mx-sm-0 mb-2">
                            <option value=""></option>
                            <option value="10%">10%</option>
                            <option value="20%">20%</option>
                            <option value="25%">25%</option>
                            <option value="30%">30%</option>
                            <option value="35%">35%</option>
                        </select>
                    </div>
                    <div class="form-group col-md-auto">
                        <label> Desconto: </label>
                        <select name="PRD_PROMOCAO" class="form-control mx-sm-0 mb-2">
                            <option value="Não">Não</option>
                            <option value="Sim">Sim </option>                                   
                        </select>

                    </div>

                </div><br>
                <div>

                    <button class="btn btn-outline-success" type="submit" >Criar</button>
                    <button class="btn btn-outline-secondary" type="reset" >limpar</button> 
                </div>

                <%-- PRIMEIRO QUADRO --%>
                <div class="bordaimg">        
                    <div class="conteudo">
                        <div class="imagem">
                            <div style="float: right; width: 100%;">
                                <input type="file" id="file" name="file" required onchange="uploadFile()"/>
                                <input type="button" value="Excluir imagem" onclick="deletaFoto();">
                                <img alt="Imagem" src="" id="target" width="200" heigth="200">

                            </div>
                        </div>   
                        <div class="lado"
                             <div class="texto"><br>
                                <div class="form-group">        
                                    <div class="form-group col-md-5px">
                                        <label>Pergunta1:</label>
                                        <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG1"/>

                                    </div>
                                    <div class="form-group col-md-5px">
                                        <label>Resposta1:</label>
                                        <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_RES1"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <%-- SEGUNDO QUADRO --%>
                    <div class="bordaimg">        
                        <div class="conteudo">
                            <div class="imagem">
                                <div style="float: right; width: 100%;">
                                    <input type="file" id="file" name="file2" required onchange="uploadFile2()"/>
                                    <input type="button" value="Excluir imagem" onclick="deletaFoto2();">
                                    <img alt="Imagem2" name="img2" src="" id="target2" width="200" height="200">              
                                </div>
                            </div>   
                            <div class="lado"
                                 <div class="texto"><br>
                                    <div class="form-group">        
                                        <div class="form-group col-md-5px">
                                            <label>Pergunta2:</label>
                                            <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG2"/>

                                        </div>
                                        <div class="form-group col-md-5px">
                                            <label>Resposta2:</label>
                                            <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_RES2"/>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <%-- TERCEIRO QUADRO --%>
                        <div class="bordaimgDir">        
                            <div class="conteudo">
                                <div class="imagem">
                                    <div style="float: right; width: 100%;">

                                        <input type="file" id="file" name="file3" required onchange="uploadFile3()"/>
                                        <input type="button" value="Excluir imagem" onclick="deletaFoto3();">
                                        <img alt="Imagem3" name="img3" src="" id="target3" width="200" height="200">              

                                    </div>
                                </div>   
                                <div class="lado"
                                     <div class="texto"><br>
                                        <div class="form-group">        
                                            <div class="form-group col-md-5px">
                                                <label>Pergunta3:</label>
                                                <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG3"/>

                                            </div>
                                            <div class="form-group col-md-5px">
                                                <label>Resposta3:</label>
                                                <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_RES3"/>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            </form>
                        </div>
                    </div>

                    </body>

                    <script type="text/javascript">

                        function uploadFile() {
                            var target = document.querySelector('img'); /// pega o campo de imagem
                            var file = document.querySelector('input[name=file]').files[0]; // pega o primeiro input que armazena a imagem em base 64
                            var reader = new FileReader();

                            reader.onloadend = function () {
                                target.src = reader.result;// carrega em base64 a img
                                document.getElementById("base64").value = reader.result;
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
