<%-- 
    Document   : kitchen
    Created on : 27-oct-2016, 9:51:53
    Author     : Hugo
--%>

<%@page import="Entities.Waiter"%>
<%@page import="Entities.Tables"%>
<%@page import="DataAccess.Tables.TableRepository"%>
<%@page import="DataAccess.Tables.ITableRepository"%>
<%@page import="DataAccess.Waiters.IWaiterRepository"%>
<%@page import="DataAccess.Waiters.WaiterRepository"%>
<%@page import="DataAccess.Restaurants.RestaurantRepository"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Restaurants"%>
<%@page import="DataAccess.Restaurants.IRestaurantRepository"%>
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
    
        <nav class="orange lighten-2" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="#" class="brand-logo center"><img src="resources/logo.png" alt="Logo" style="width: 200px; margin-left: 0px; margin-top: 10px;"></a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="Logout">Log Out</a></li>
                </ul>
                <ul id="nav-mobile" class="side-nav" style="transform: translateX(-100%);">
                    <li><a href="Logout">Log Out</a></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>
        
    <div class="row">
            <!--- CÓDIGO JAVA PARA MOSTRAR SOLO LAS MESAS QUE SE TIENEN --->
            <% HttpSession httpsession = request.getSession(false); 
            Tables cUser = (Tables) httpsession.getAttribute("CurrentUser");
             ITableRepository restTables = new TableRepository();
             IWaiterRepository waiterRepo = new WaiterRepository();
             Tables user = new Tables(); 
             Waiter waiter = new Waiter(); 
             List <Tables> theList = restTables.GetUsersTablesByRestaurant(cUser.getRestaurants().getIdRestaurant()) ; 
             for (int i = 0; i<theList.size();i++) { 
             user = (Tables) theList.get(i); 
             waiter = (Waiter) user.getWaiter(); %>
            <div class="col s12 m6">
              <div class="card white">
                <div class="card-content brown-text">
                    <span class="card-title"><% out.println(user.getUsername());%></span>
                  <p>INFO DEL PEDIDO DE LA MESA</p>
                </div>
                <div class="card-action">
                    <a href="#">Confirmar Envío</a> <font color="brown">Mesero: <% out.println(waiter.getName());  %></font>
                </div>
              </div>
            </div>
            <% } %>
        
            
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
    
</html>
