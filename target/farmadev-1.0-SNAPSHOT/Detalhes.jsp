<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="farmadev.entidade.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <title>'FarmaSis</title>
        <style>
            a{
                font-family: verdana;
                font-size:18px;
                color:#5298C7;
                text-decoration: none;  
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
                margin-bottom: -660px;
                margin-left:  680px;
                margin-top: -140px;

            }
            div.box {
                border:5px solid #999;
                width: 600px;
                display: inline-block;
                margin-left:  380px;
            }


            body {
                font-family: Verdana, sans-serif;
                margin: 0;
            }

            * {
                box-sizing: border-box;
            }

            .row > .column {
                padding: 0 8px;
            }

            .row:after {
                content: "";
                display: table;
                clear: both;
            }

            .column {
                float: left;
                width: 25%;
            }

            /* The Modal (background) */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                padding-top: 100px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: black;
            }

            /* Modal Content */
            .modal-content {
                position: relative;
                background-color: #fefefe;
                margin: auto;
                padding: 0;
                width: 80%;
                max-width: 600px;
            }

            /* The Close Button */
            .close {
                color: white;
                position: absolute;
                top: 10px;
                right: 25px;
                font-size: 35px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #999;
                text-decoration: none;
                cursor: pointer;
            }

            .mySlides {
                display: none;
            }

            .cursor {
                cursor: pointer;
            }

            /* Next & previous buttons */
            .prev,
            .next {
                cursor: pointer;
                position: absolute;
                top: 50%;
                width: auto;
                padding: 16px;
                margin-top: -50px;
                color: white;
                font-weight: bold;
                font-size: 20px;
                transition: 0.6s ease;
                border-radius: 0 3px 3px 0;
                user-select: none;
                -webkit-user-select: none;
            }

            /* Position the "next button" to the right */
            .next {
                right: 0;
                border-radius: 3px 0 0 3px;
            }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover,
            .next:hover {
                background-color: rgba(0, 0, 0, 0.8);
            }

            /* Number text (1/3 etc) */
            .numbertext {
                color: #f2f2f2;
                font-size: 12px;
                padding: 8px 12px;
                position: absolute;
                top: 0;
            }

            img {
                margin-bottom: -4px;
            }

            .caption-container {
                text-align: center;
                background-color: black;
                padding: 2px 16px;
                color: white;
            }

            .demo {
                opacity: 0.6;
            }

            .active,
            .demo:hover {
                opacity: 1;
            }

            img.hover-shadow {
                transition: 0.3s;
            }

            .hover-shadow:hover {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }


            .section{
                margin-left:  70px;
            }

            .bordaimg{
                padding-left: -20px;
                padding-right: 20px;
                padding-bottom:  20px;
                padding-top: 10px;
                margin-left:  100px;
                margin-top: 10px;
                margin-right:   100px;
                margin-bottom:  60px;
                border-top: 4px solid #7c7; /* mid green */
                border-left:4px solid #7c7 ;
                border-right: 4px solid #7c7 ;
                border-bottom: 4px solid #7c7 ;
                background-color: #efe;     /* pale green */  
            }

            .descricao{
                margin-left: 100px;
            }



        </style> 

        <script type="text/javascript"></script>
    </head>


    <body>  


        <nav class="navbar navbar-expand-lg navbar-light navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="ListarProdutos">Inicio</a>
            <button class="navbar-toggler" type="button" href="index.html" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
        <img src="logo_farmasis.jpg" height="80" width="180">
        <img src="logo_drogaria.jpg" height="80" width="180" align="right">


    <center>
        <div class="container-fluid mr-5"> 
            <h1 class="display-5"><b>Detalhes do produto</b></h1></div></center>

    <div class="form-group col-md-auto">
        <input name="PROD_ID" type="hidden" value="${produto.id}"> 
    </div>


    <!--                    <div class="form-group col-md-5px">
                            <label>nome</label>
    
                            <input name="PRD_NOME"  value="${produto.nome}">
                        </div>-->
    <!--                    <div class="form-group col-md-5px">
                            <label>descrição</label>
                            <input name="PRD_DESCRICAO"  value="${produto.descricao}">
                        </div>-->

    <!--                    <div class="form-group col-md-auto">
                            <label>quantidade</label>
                            <input name="PRD_QUANTIDADE"  value="${produto.quantidade}">
                        </div>-->

    <!--                    <div class="form-group col-md-auto">
                            <label> Valor </label>
                            <input name="PRD_VALOR_UNIT"  value="${produto.valor}">
                        </div>-->
    <!--                    <div class="form-group col-md-auto">
                            <label> Categoria: </label>
                            <input name="PRD_CATEGORIA" class="form-control mx-sm-0 mb-2" value="${produto.categoria}">
    
                        </div>-->



    <div id="myModal" class="modal">
        <span class="close cursor" onclick="closeModal()">&times;</span>
        <div class="modal-content">

            <div class="mySlides">
                <div class="numbertext">1 / 3</div>
                <img src="${imagem1.imagem1}" style="width:100%">
            </div>

            <div class="mySlides">
                <div class="numbertext">2 / 3</div>
                <img src="${imagem2.imagem1}" style="width:100%">
            </div>

            <div class="mySlides">
                <div class="numbertext">3 / 3</div>
                <img src="${imagem3.imagem1}" style="width:100%">
            </div>


            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>

            <div class="caption-container">
                <p id="caption"></p>
            </div>
        </div>
    </div>
    <br>

    <div class="bordaimg">
        <section class="section">
            <div class="conteudo">
                <div class="imagem">
                    <div style="width: 140%">

                        <div class="row">
                            <div class="column">
                                <img src="${imagem1.imagem1} " width="180px" height="180px" 
                                     style="min-height: 100px;" border="0" id="target" name="target" style="width:10%" onclick="openModal();currentSlide(1)" class="hover-shadow cursor">

                            </div>
                            <div class="column">
                                <img src="${imagem2.imagem1}" width="180px" height="180px" 
                                     style="min-height: 100px;" border="0" id="target" name="target" style="width:10%" onclick="openModal();currentSlide(2)" class="hover-shadow cursor">
                            </div>
                            <div class="column">
                                <img src="${imagem3.imagem1}"  width="180px" height="180px" 
                                     style="min-height: 100px;" border="0" id="target" name="target" style="width:10%" onclick="openModal();currentSlide(3)" class="hover-shadow cursor">
                            </div>

                        </div>

                    </div>
                </div>
                <div class="texto">
                    <b>nome do produto: </b>${produto.nome}<br><%-- c.nome--%>           
                    <b>Preço:</b> ${produto.valor}<br><br       
                </div>
                <form action="Carrinho">
                    <input name="PRD_ID" type="hidden"  value="${produto.id}" >                                     
                    <button class="btn btn-outline-warning" type="submit">Comprar</button></form> 
        </section>
    </div>
    <div class="descricao">                      
        <b>Descrição/Informações:</b> ${produto.descricao}<br><%-- c.nome--%>
        <br><br>

        <label><b>FAQ – Respostas para Perguntas Frequentes</b></label> 
        <div class="form-group col-md-5px">
            <br>   <label><b>${pergunta1.pergunta}</b></label>                            

        </div>
        <div class="form-group col-md-5px">
            <label>Resposta:</label>
            ${pergunta1.resposta}

        </div>

        <div class="form-group col-md-5px">
            <label><b>${pergunta2.pergunta}</b></label>                            

        </div>
        <div class="form-group col-md-5px">
            <label>Resposta:</label>
            ${pergunta2.resposta}

        </div>
        <div class="form-group col-md-5px">
            <label><b>${pergunta3.pergunta}</b></label>                            

        </div>
        <div class="form-group col-md-5px">
            <label>Resposta:</label>
            ${pergunta3.resposta}

        </div>
    </div>  
    <br>

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
        document.getElementById("urlimagemBase64").value = '';
        document.getElementById("target").src = '';

    }

    function openModal() {
        document.getElementById("myModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("demo");
        var captionText = document.getElementById("caption");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
        captionText.innerHTML = dots[slideIndex - 1].alt;
    }

</script>
</html>
