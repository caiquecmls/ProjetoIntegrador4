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
       
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <h1>Cadastrar Produto</h1>
        
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
                                                       
                            <div class="form-group col-md-5px">
                                <label>Pergunta1:</label>
                                <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG1"/>
			
                            </div>
                             <div class="form-group col-md-5px">
                                <label>Resposta1:</label>
                                <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_RES1"/>
			
                            </div>
                            
                            <div class="form-group col-md-5px">
                                <label>Pergunta2:</label>
                                <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG2"/>
			
                            </div>
                             <div class="form-group col-md-5px">
                                <label>Resposta2:</label>
                                <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_RES2"/>
			
                            </div>
                            
                            <div class="form-group col-md-5px">
                                <label>Pergunta3:</label>
                                <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG3"/>
			
                            </div>
                             <div class="form-group col-md-5px">
                                <label>Resposta3:</label>
                                <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_RES3"/>
			
                            </div>
                            
                            
                            

                            
                            <div style="float: right; width: 45%;">
                                <input type="file" id="file" name="file" onchange="uploadFile()"/>
                                <input type="button" value="Excluir imagem" onclick="deletaFoto();">
                                <img alt="Imagem" src="" id="target" width="200" heigth="200">

                            </div>

                            <div style="float: right; width: 45%;">

                                <input type="file" id="file" name="file2" onchange="uploadFile2()"/>
                                <input type="button" value="Excluir imagem" onclick="deletaFoto2();">
                                <img alt="Imagem2" name="img2" src="" id="target2" width="200" height="200">              

                            </div>

                            <div style="float: right; width: 45%;">

                                <input type="file" id="file" name="file3" onchange="uploadFile3()"/>
                                <input type="button" value="Excluir imagem" onclick="deletaFoto3();">
                                <img alt="Imagem3" name="img3" src="" id="target3" width="200" height="200">              

                            </div>
                            

                            
                            

                        
         </div>
    </div>

                        
                
        
            <div class="container m-3">
                    <button class="btn btn-outline-success" type="submit" >Criar</button>
                    <button class="btn btn-outline-secondary" type="reset" >limpar</button> 
            </div>
        
        
        
        </form>
            </div>
    </body>
  <script type="text/javascript">

        	function uploadFile() {
		var target = document.querySelector('img'); /// pega o campo de imagem
		var file = document.querySelector('input[name=file]').files[0]; // pega o primeiro input que armazena a imagem em base 64
		var reader = new FileReader();

		reader.onloadend = function() {
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
    <a href="index.html">Início</a>
</html>
