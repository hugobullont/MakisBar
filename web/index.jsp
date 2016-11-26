<%-- 
    Document   : index
    Created on : 25/10/2016, 11:33:41 AM
    Author     : TheLastShadowPuppet
--%>

<%@page import="java.util.List"%>
<%@page import="Entities.Restaurants"%>
<%@page import="DataAccess.Restaurants.IRestaurantRepository"%>
<%@page import="DataAccess.Restaurants.RestaurantRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0">
        <title>MakisBar</title>
        <!-- CSS -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="icon" type="image/png" href="resources/favicon.png">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection">
    </head>
    
    <body>
        <nav class="orange lighten-2" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="#" class="brand-logo center"><img src="resources/logo.png" alt="Logo" style="width: 200px; margin-left: 0px; margin-top: 10px;"></a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="about.html">About</a>
                    </li>
                </ul>
                <ul id="nav-mobile" class="side-nav" style="transform: translateX(-100%);">
                    <li><a href="about.html">About</a>
                    </li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>
        
        <div class="section no-pad-bot" id="index-banner">
            <div class="container">
                <div class="row center">
                    <h5 class="header col s12 light">¡Ingresa aquí tu Código de Mesa y Contraseña para empezar a pedir tus Makis!</h5>
                </div>
                <form class="col s12" action="Login" method="POST">
                    <div class="row">
                        <div class="select-wrapper icons"><span class="caret">▼</span>
                            <select class="icons initialized input-field label">
                                <option value="" disabled="" selected="">Escoge tu Restaurante</option>
                                <!--- CODIGO JAVA PARA SOLO MOSTRAR LOS RESTAURANTES DE LA DB--->
                                <% IRestaurantRepository restRepo = new RestaurantRepository();%>
                                <% List <Restaurants> temp = restRepo.GetAllRestaurants(); %>
                                <% for (int i = 0; i<temp.size(); i++) {%>
                                    
                                    <option value="<% out.println(temp.get(i).getName()); %>" data-icon= "<% out.println(temp.get(i).getImgSource()); %>" class="circle"><% out.println(temp.get(i).getName());%></option>
                                    <!---<option value="wasabi" data-icon="resources/wasabi.jpg" class="circle">Wasabi</option>
                                    <option value="osensei" data-icon="resources/osensei.jpg" class="circle">O-sensei</option>
                                    <option value="tramontana" data-icon="resources/tramontana.png" class="circle">Tramontana</option>---> 
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field">
                            <input name = "txtUsername" id="txtUsername" type="text" required>
                            <label for="txtUsername">Código de Mesa</label>
                        </div>
                        <div class="input-field">
                            <input name="txtPassword" id="txtPassword" type="password" required>
                            <label for="txtPassword">Contraseña</label>
                        </div>
                        <div class="row center">
                            <i class="center btn-large waves-effect waves-light brown lighten-1 waves-input-wrapper" style=""><input type="submit" id="btnLogin" class="center-align waves-button-input" value="Iniciar Sesión" style=""></i>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <footer class="page-footer orange lighten-1">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12">
                        <h5 class="white-text">MakisBar</h5>
                        <p class="grey-text text-lighten-4">Queremos que ahorres tiempo al pedir Makis para que tengas más tiempo para disfrutarlos.</p>
                    </div>
                    <div class="col l3 s12">
                        <h5 class="white-text">Contacto</h5>
                        <ul>
                            <li><a class="white-text" href="mailto:makisbar@gmail.com">makisbar@gmail.com</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    Made by <a class="white-text text-lighten-3" href="http://facebook.com/hugobullont">TheLastShadowPuppet</a>
                </div>
            </div>
        </footer>
        
        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>
        <div class="drag-target" style="left: 0px; touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></div>
        <script>
            $(document).ready(function() {
                $('select').material_select();
            });
        </script>
        <script>
            $(".button-collapse").sideNav();
        </script>
        <div class="drag-target" style="left: 0px; touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></div>
        <div class="drag-target" style="left: 0px; touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></div>

        <div class="hiddendiv common"></div>
    </body>
</html>
