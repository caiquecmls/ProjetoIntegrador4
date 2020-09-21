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
                <h1 class="display-5">Atualizar informação produto</h1>
      

               
                    <form action="EditarProduto"method="POST">
                       
                       <c:forEach var="c" items="${produto}">
                           
                       
                       <div class="form-group">    
                        <div class="form-row border">
                            <div class="form-group col-md-auto">
                                <input name="PRD_ID" type="hidden" value="${c.id}"> 
                            </div>
                         <input type="hidden" name="urlimagemBase64" id="urlimagemBase64" value="${c.imagem}" /> 
                            <div class="form-group col-md-5px">
                                <label>descrição</label>
                                <input name="PRD_DESCRICAO"  value="${c.descricao}">
                            </div>

                            <div class="form-group col-md-auto">
                                <label>quantidade</label>
                                <input name="PRD_QUANTIDADE"  value="${c.quantidade}">
                            </div>

                            <div class="form-group col-md-auto">
                                <label> Valor </label>
                                <input name="PRD_VALOR_UNIT"  value="${c.valor}">
                            </div>
                                 <div class="form-group col-md-auto">
                                <label> Categoria: </label>
                                <select name="PRD_CATEGORIA" class="form-control mx-sm-0 mb-2" value="${c.categoria}>
                                    <option value="BELEZA">BELEZA</option>
                                    <option value="EQUIPAMENTOS">EQUIPAMENTOS</option>
                                    <option value="SAUDE">SAUDE</option>
                                </select>
                            </div>
                                 <div class="form-group col-md-5px">
                                <label>Pergunta:</label>
                                <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG" value="${c.pergunta}"/>
                            </div>
                               <div>
				<img src="${c.imagem}">
					<br />
					<input type="button" value="Excluir imagem" onclick="deletaFoto();">
					 <input 
					onchange="visualizarImg();" type="file" value="Selecionar a imagem">
                                </div>

                                
                            </c:forEach>
                        </div>  

                        <div class="container m-3">
                               <button class="btn btn-outline-success" type="submit" >Atualizar</button>
                            
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
