<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="index.html">Inicio</a>
            <button class="navbar-toggler" type="button" href="index.html" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
        <img src="logo_farmasis.jpg" height="80" width="180">
        <img src="logo_drogaria.jpg" height="80" width="180" align="right">
        <div align="center">
            <table>           
                <td>
                    <form action="ListarUsuarios">
                        <div class="form-inline my-2 my-lg-0">
                            <input type="text" class="form-control " placeholder="Buscar Usuario" onkeypress='return letras();' required name= "Filtro"/>
                            <input class="btn btn-primary " type="submit"value="pesquisar">
                        </div>
                    </form>   
                </td>
            </table>
        </div>
        <div>
            <a href="cadastroUsuario.jsp"><b>Novo</b></a>

        </div> 
        <table class="table" width="%" >
            <thead class="table-dark" >
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Usuario</th>
                    <th scope="col">Perfil</th>
                    <th scope="col">Status</th>
                    <th scope="col" ></th>
                </tr>
            </thead>
            <c:forEach var="c" items="${usuario}">  
                <tr>
                    <td>${c.id}</td>
                    <td>${c.nome}</td>
                    <td>${c.usuario}</td>
                    <td>${c.perfil}</td>
                    <td>${c.status}</td>
                    <td>  
                        <form action="ListarUsuarios" method="Post">
                            <input name="USU_ID" type="hidden" size=1 value="${c.id}">  
                            <input name="STATUS" type="hidden" size=1 value="Inativo">  
                            <button class="btn btn-outline-danger" type="submit">Inativar</button>  
                        </form>
                    </td>                       
                    <td>
                        <form action="EditarUsuario">
                            <input name="USU_ID"  type="hidden"  value="${c.id}">                              
                            <button class="btn btn-outline-warning" type="submit">Editar</button>
                        </form> 
                    </td>
                    <td>
                        <form action="ListarUsuarios" method="Post">
                            <input name="USU_ID"  type="hidden"  value="${c.id}">    
                            <input name="STATUS" type="hidden" size=1 value="Ativo"> 
                            <button class="btn btn-outline-warning" type="submit">Reativar</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
