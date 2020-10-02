<%@page import="farmadev.entidade.Produto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd%22%3E
    <html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
    <link href="css/css.css" rel="stylesheet" />
</head>
<body>
    <form action="controllerImagem" id="formImagem" 
          <c:forEach var="c" items="${produto}">
              <div class="form-group">    
                  <div class="form-row border">
                      <div class="form-group col-md-auto">
                          <input name="PRD_ID" type="hidden" value="${c.id}"> 
                      </div>
                      <input type="hidden" name="urlimagemBase64" id="urlimagemBase64" value="${c.imagem}" /> 
                      <div class="form-group col-md-5px">
                          <label>nome</label>
                          <input name="PRD_NOME"  value="${c.nome}">
                      </div>
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
                      <div class="form-group col-md-auto">
                          <label> Desconto </label>
                          <input  value="${c.desconto}">
                      </div>
                      <div class="form-group col-md-auto">
                          <label> Promocao </label>
                          <input  value="${c.promocao}">
                      </div>
                      <div class="form-group col-md-5px">
                          <label>Pergunta:</label>
                          <input type="text" class="form-control" onkeypress='return letras();' required name= "PRD_MSG" value="${c.pergunta}"/>
                      </div>




                      <input type="hidden" name="urlimagemBase64" id="urlimagemBase64"
                             value="${c.imagem}" /> 


                      <div style="width: 100%">


                          <div style="float: right; width: 45%;">
                              <img src="<c:out value="${c.imagem}"/>" width="50%"
                                   style="min-height: 250px;" border="0" id="target" name="target"> 
                              <br />
                          </div>
                      </c:forEach>

                  </div>
              </div>

    </form>
    <div>
        <a href="ListarProdutos"><button>Voltar</button></a>

    </div>

</html>
