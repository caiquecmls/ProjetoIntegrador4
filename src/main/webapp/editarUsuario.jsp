<%-- 
    Document   : editarUsuario
    Created on : 13/10/2020, 22:20:42
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="EditarUsuario"method="POST">

            <div class="form-group">    
                <div class="form-row border">
                    <div class="form-group col-md-auto">
                        <input name="USU_ID" type="hidden" class="form-control" required value="${Usuario.id}"> 
                    </div>

                    <div class="form-group col-md-5px">
                        <label>Nome</label>
                        <input name="USU_NOME" class="form-control" required value="${Usuario.nome}">
                    </div>
                    <div class="form-group col-md-5px">
                        <label>Usuario</label>
                        <input name="USU_USUARIO" class="form-control" required value="${Usuario.usuario}">
                    </div>
                    <div class="form-group col-md-auto">
                        <label> Reset ?  </label>
                        <select name="USU_SENHA" class="form-control mx-sm-0 mb-2">
                            <option value="Nao">Não</option>
                            <option value="Sim">Sim</option>                                   
                        </select>                            
                    </div>
                    <div class="form-group col-md-auto">
                        <label> Perfil </label>
                        <select name="USU_PERFIL" class="form-control mx-sm-0 mb-2" required >
                            <option></option>
                            <option value="Administrador">Administrador</option>
                            <option value="Comprador">Comprador</option>    
                            <option value="Estoquista">Estoquista</option> 
                        </select>                            
                    </div>
                    <div class="form-group col-md-auto">
                        <label> Status </label>
                        <select name="USU_STATUS" class="form-control mx-sm-0 mb-2" required>
                            <option value="Ativo">Ativo</option>
                            <option value="Inativo">Inativo</option>                                   
                        </select>                            
                    </div>




                    <div class="container m-3">
                        <button class="btn btn-outline-success" type="submit" >Atualizar</button>

                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
