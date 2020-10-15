<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

        <link type="text/javascript" src="./style.css"/>
    </head>

    <body>

        <div class="jumbotron jumbotron-fluid jumbotron-with-background" 
            style="
                background-image: url('./loginimg.jpeg'); 
                background-position: center;
                background-repeat: no-repeat; 
                background-size: cover; 
                height: 55%;
                ">
            
            <div class="container">
    
                <form method="post" action="LoginServlet">
    
                    <div class="form-group">
                        <div class="col-md-6 offset-md-3">
                            <h3 style="color:#21629A; align-content: center; text-align: center; font-weight: 600;">Bem Vindo!</h3>
                            <label for="usuario">Usuário </label>
                            <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuário" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 offset-md-3">
                            <label for="senha">Senha</label>
                            <input type="password" class="form-control" id="senha" name="senha" placeholder="Senha" required>
                        </div>
                    </div>
                    <div class="col-md-6 offset-md-3" style="align-items: center;">
                        <c:if test="${not empty msgErro}">
                            <div class="alert alert-danger" role="alert">
                                <c:out value="${msgErro}"/>
                            </div>
                        </c:if>
    
                        <button type="submit" class="btn btn-primary">Entrar</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-lg-6 col-md-6 col-sm-12">
                    <img src="/logo_drogaria.jpeg" alt="Drogaria" width="400">
                </div>
                <div class="col-xs-12 col-lg-6 col-md-6 col-sm-12">
                    <img src="/logo_farmasis.jpeg" alt="FarmaSIS" width="300">
                </div>
            </div>
        </div>
    </body>

</html>