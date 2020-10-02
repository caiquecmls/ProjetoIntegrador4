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

        <h4 style="text-align: center;"> </h4>

        <div class="container-fluid mr-5"> 
            <h1 class="display-5">Detalhes do produto</h1>



            <form action="EditarProduto"method="POST">

                <div class="form-group">    
                    <div class="form-row border">

                        <div class="form-group col-md-5px">
                            <label>nome</label>
                            <label>oi</label>
                                
                            <input name="PRD_NOME"  value="${produto.nome}">
                        </div>
                        <div class="form-group col-md-5px">
                            <label>descrição</label>
                            <input name="PRD_DESCRICAO"  value="${produto.descricao}">
                        </div>

                        <div class="form-group col-md-auto">
                            <label>quantidade</label>
                            <input name="PRD_QUANTIDADE"  value="${produto.quantidade}">
                        </div>

                        <div class="form-group col-md-auto">
                            <label> Valor </label>
                            <input name="PRD_VALOR_UNIT"  value="${produto.valor}">
                        </div>
                        <div class="form-group col-md-auto">
                            <label> Categoria: </label>
                            <input name="PRD_CATEGORIA" class="form-control mx-sm-0 mb-2" value="${produto.categoria}">

                        </div>
 

                        <div class="form-group col-md-5px">
                            <label>Pergunta:</label>                            
                       <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG1" value="${pergunta1.pergunta}"/>
                    </div>
                    <div class="form-group col-md-5px">
                        <label>Resposta:</label>
                        <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_RES1"value="${pergunta1.resposta}"/>

                    </div>

                    <div class="form-group col-md-5px">
                        <label>Pergunta:</label>
                        <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG2" value="${pergunta2.pergunta}"/>
                    </div>
                    <div class="form-group col-md-5px">
                        <label>Resposta:</label>
                        <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_RES2"value="${pergunta2.resposta}"/>

                    </div>


                    <div class="form-group col-md-5px">
                        <label>Pergunta:</label>
                        <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG3" value="${pergunta3.pergunta}"/>
                    </div>
                    <div class="form-group col-md-5px">
                        <label>Resposta:</label>
                        <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_RES3"value="${pergunta3.resposta}"/>

                    </div>


                <div>  
                    <img  name="img" src="${imagem1.imagem1}" width="200" heigth="200">

                    <br />
                </div>
                    
                <div>
                    
                    <img name="img2" src="${imagem2.imagem1}"width="200" heigth="200">
                    <br />
                </div>
                <div>                   
                    <img name="img3" src="${imagem3.imagem1}"width="200" heigth="200">
                    <br />

                </div>

        </div>  

    </div>
</form>



<center>
    <a href="index.html">Início</a>  
</center>      
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

		reader.onloadend = function() {
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

		reader.onloadend = function() {
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
                                document.getElementById("urlimagemBase64").value = '';
                                document.getElementById("target").src = '';

                            }


</script>
</html>
