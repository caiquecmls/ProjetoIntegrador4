<%-- 
    Document   : cadastroProduto
    Created on : 15/09/2020, 16:50:29
    Author     : Renato
--%>
<%@page import="farmadev.entidade.Produto"%>

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
                        
                        <input type="hidden" name="urlimagemBase64" id="urlimagemBase64" value="${produto.imagem}" /> 
        
                        <div class="form-row border">

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
                                                       
                            <div class="form-group col-md-5px">
                                <label>Pergunta:</label>
                                <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG"/>
			
                            </div>
                            
                            
                               
                                <div style="float: right; width: 45%;">
				<img src="<c:out value="${imagem.urlimagem}/>
					<br />
					<input type="button" value="Excluir imagem" onclick="deletaFoto();">
					 <input 
					onchange="visualizarImg();" type="file" value="Selecionar a imagem">
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
	// transforma a imagem em base64 e mostra no navegador
	function visualizarImg() {
		var preview = document.querySelector('img'); /// pega o campo de imagem
		var file = document.querySelector('input[type=file]').files[0]; // pega o primeiro input que armazena a imagem em base 64
		var reader = new FileReader();

		reader.onloadend = function() {
			preview.src = reader.result;// carrega em base64 a img
			document.getElementById("urlimagemBase64").value = reader.result; // seta o valor da imagem ao intputtext urlimagemBase64
		};

		if (file) {
			reader.readAsDataURL(file); // faz o prewiew da imagem na tela	    
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
    <a href="index.html">Início</a>
</html>
