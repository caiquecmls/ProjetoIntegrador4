<%-- 
    Document   : cadastroUsuario
    Created on : 13/10/2020, 23:39:18
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
        <form action="CadastroUsuario">

            <div class="form-group">    
                <div class="form-row border">
                    <div class="form-group col-md-5px">
                        <label>Nome</label>
                        <input name="USU_NOME" class="form-control" required >
                    </div>
                    <div class="form-group col-md-5px">
                        <label>Usuario</label>
                        <input name="USU_USUARIO" class="form-control" required >
                    </div>
                    <div class="form-group col-md-5px">
                        <label>Senha</label>
                        <input name="USU_SENHA" class="form-control" required >
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
                        <button class="btn btn-outline-success" type="submit" >Cadastrar</button>

                    </div>
                </div>
            </div>
        </form>
        <form action="ListarUsuarios">
        <div class="container m-3">
            <button class="btn btn-outline-success" type="submit" >Cancelar</button>
        </div>
        </form>
    </body>
</body>
</html>
