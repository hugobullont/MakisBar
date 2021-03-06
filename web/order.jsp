<%-- 
    Document   : order
    Created on : 25-oct-2016, 11:32:04
    Author     : Loudy
--%>

<%@page import="DataAccess.Orders.*"%>
<%@page import="Entities.RelRestMak"%>
<%@page import="java.util.List"%>
<%@page import="DataAccess.Products.*"%>
<%@page import="Entities.*"%>
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
    <% HttpSession httpsession = request.getSession(false); 
            Tables cUser = (Tables) httpsession.getAttribute("CurrentUser");
            IProductsRepository ProductsRepo = new ProductsRepository();
            IOrderRepository orderRepo = new OrderRepository();
            List<RelRestMak> listMakis = ProductsRepo.GetMakisByRestaurant(cUser.getRestaurants().getIdRestaurant()); 
            List<RelRestDrk> listDrinks = ProductsRepo.GetDrinksByRestaurant(cUser.getRestaurants().getIdRestaurant());
            List<RelRestCmp> listComplements = ProductsRepo.GetComplByRestaurant(cUser.getRestaurants().getIdRestaurant());
            Orders noSendOrder = orderRepo.GetNoSendedOrderByTable(cUser.getIdTable());
    %>
    <% response.setIntHeader("Refresh", 45);%>
    <body>
        <nav class="orange lighten-2" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="#" class="brand-logo center"><img src="resources/logo.png" alt="Logo" style="width: 200px; margin-left: 0px; margin-top: 10px;"></a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="Logout">Log Out</a></li>
                </ul>
                <ul class="left hide-on-med-and-down">
                    <li>Tu Mesero es: <%= cUser.getWaiter().getName()%>&nbsp&nbsp</li>
                </ul>
                <ul class="left hide-on-med-and-down">
                    <li><img src="<%= cUser.getWaiter().getSrcImg()%>" class="circle responsive-img" style="width: 50px; margin-top: 5px;"></li>
                </ul>
                <ul id="nav-mobile" class="side-nav" style="transform: translateX(-100%);">
                    <li class="center"><a href="#"><img src="<%= cUser.getWaiter().getSrcImg()%>" class="circle responsive-img" style="width: 50px; margin-top: 5px;"></a></li>
                    <li class="center"><a href="#">Tu Mesero es: <%= cUser.getWaiter().getName()%></a></li>
                    <li><a href="Logout">Log Out</a></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>
        
        <form method="POST" action="AddOrder">
            <div class="section no-pad-bot" id="index-banner">
                <div class="row">
                    <div class="col s12 m12">
                	<div class="card medium">
                            <div class="card-image waves-effect waves-block waves-light">
				<img class="activator" src="resources/makis.jpg">
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4">Makis<i class="material-icons right">more_vert</i></span>
                                <p>¡Dale click a Makis para hacer tu pedido!</p>
                            </div>
                            <div class="card-reveal">
				<span class="card-title grey-text text-darken-4">Makis<i class="material-icons right">close</i></span>
				<!--- CODIGO PARA MOSTRAR LOS MAKIS QUE SE TIENEN --->
                                <p>¡Dale click a los Makis que deseas para agregarlos al pedido! ¡No olvides poner la cantidad!</p>
				<table>
                                    <% for(RelRestMak maki : listMakis) {%>
                                    <tr>
					<td><font><input type="checkbox" name="chkmakis" value= "<%=maki.getMakis().getIdMaki() %>"id="chkMakis<%=maki.getMakis().getIdMaki() %>"/><label for="chkMakis<%=maki.getMakis().getIdMaki() %>"><%=maki.getMakis().getName()%></label></font></td>
					<td><font><input name="txtMakisNumber<%=maki.getMakis().getIdMaki() %>" id="txtMakisNumber<%=maki.getMakis().getIdMaki() %>" type="number" class="center col s3 m6"></font></td>
                                    </tr>
                                    <%}%>
				</table>
                            </div>
			</div>
                    </div>
                    
                    
                    <div class="col s12 m6">
                        <div class="card medium">
                            <div class="card-image waves-effect waves-block waves-light">
				<img class="activator" src="resources/drinks.jpg">
                            </div>
                            <div class="card-content">
				<span class="card-title activator grey-text text-darken-4">Bebidas<i class="material-icons right">more_vert</i></span>
				<p>¡Dale click a Bebidas para hacer tu pedido!</p>
                            </div>
                            <div class="card-reveal">
                                <span class="card-title grey-text text-darken-4">Bebidas<i class="material-icons right">close</i></span>
                                <p>¡Dale click a las Bebidas que deseas para agregarlas al pedido! ¡No olvides poner la cantidad de vasos!</p>
                                <table>
                                    <% for(RelRestDrk drink : listDrinks) {%>
                                    <tr>
					<td><font><input type="checkbox" name="chkdrinks" value= "<%=drink.getDrinks().getIdDrink()%>"id="chkDrinks<%=drink.getDrinks().getIdDrink()%>"/><label for="chkDrinks<%=drink.getDrinks().getIdDrink()%>"><%=drink.getDrinks().getName()%></label></font></td>
					<td><font><input name="txtDrinksNumber<%=drink.getDrinks().getIdDrink()%>" id="txtDrinksNumber<%=drink.getDrinks().getIdDrink()%>" type="number" class="center col s3 m6"></font></td>
                                    </tr>
                                    <%}%>
				</table>
                            </div>
			</div>
                    </div>
                    <div class="col s12 m6">
			<div class="card medium">
                            <div class="card-image waves-effect waves-block waves-light">
				<img class="activator" src="resources/complements.jpg">
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4">Complementos<i class="material-icons right">more_vert</i></span>
                                <p>¡Dale click a Complementos para hacer tu pedido!</p>
                            </div>
                            <div class="card-reveal">
                                <span class="card-title grey-text text-darken-4">Complementos<i class="material-icons right">close</i></span>
                                <p>¡Dale click a los complementos que deseas para agregarlos al pedido! ¡No olvides poner la cantidad!</p>
                                <table>
                                    <% for(RelRestCmp comp : listComplements) {%>
                                    <tr>
					<td><font><input type="checkbox" name="chkcomp" value= "<%=comp.getComplements().getIdComplement()%>"id="chkComp<%=comp.getComplements().getIdComplement()%>"/><label for="chkComp<%=comp.getComplements().getIdComplement()%>"><%=comp.getComplements().getName()%></label></font></td>
					<td><font><input name="txtComplementsNumber<%=comp.getComplements().getIdComplement() %>" id="txtComplementsNumber<%=comp.getComplements().getIdComplement()%>" type="number" class="center col s3 m6"></font></td>
                                    </tr>
                                    <%}%>
                                </table>
                            </div>
                        </div>
                    </div>
            	</div>
                 <% if(noSendOrder == null ){%>
            	<div class="row center">
                    <i class="btn-large waves-effect waves-light brown lighten-1 waves-input-wrapper" style=""><input type="submit" id="btnSendOrder" class="center-align waves-button-input" value="Enviar Pedido" style="" onclick="Materialize.toast('¡Tu pedido está siendo procesado!', 4000)"></i>
		</div>
                <% }%>
                <%if(noSendOrder != null){%>
                <div class="row center">
                    <i class="btn-large disabled waves-effect waves-light brown lighten-1 waves-input-wrapper" style=""><input type="submit" id="btnSendOrder" class="center-align waves-button-input" value="Enviar Pedido" style="" onclick="Materialize.toast('¡Tu pedido está siendo procesado!', 4000)"></i>
		</div>
                <%}%>
            </div>
        </form>
        
        
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
