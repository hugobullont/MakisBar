<%-- 
    Document   : kitchen
    Created on : 27-oct-2016, 9:51:53
    Author     : Hugo
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entities.OrderProduct"%>
<%@page import="Entities.Orders"%>
<%@page import="DataAccess.Orders.OrderRepository"%>
<%@page import="DataAccess.Orders.IOrderRepository"%>
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
             IOrderRepository orderRepo = new OrderRepository();
             Tables user = new Tables(); 
             Waiter waiter = new Waiter(); 
             List<OrderProduct> AllMakis = orderRepo.GetMakisOfOrders();
             List<OrderProduct> makis = new ArrayList<OrderProduct>();
             List <Tables> theList = restTables.GetUsersTablesByRestaurant(cUser.getRestaurants().getIdRestaurant()) ; 
             for (int i = 0; i<theList.size();i++) { 
                user = (Tables) theList.get(i); 
                Orders order = (Orders) orderRepo.GetNoSendedOrderByTable(user.getIdTable());
                waiter = (Waiter) user.getWaiter(); 
                
                for(OrderProduct beta:AllMakis)
                {
                    if(order!= null)
                    {
                        if(beta.getOrder().getIdOrder() == order.getIdOrder())
                        {
                            makis.add(beta);
                        } 
                    }
                    
                }
                %>
                <form method="POST" action="ConfirmOrder">
                    <div class="col s12 m6">
                      <div class="card white">
                        <div class="card-content brown-text">
                            <span class="card-title"><% out.println(user.getUsername());%></span>
                            <font color="brown">Mesero: <% out.println(waiter.getName());  %></font>
                            <h5>MAKIS</h5>
                          <table>
                              <tr>
                                  <th>Nombre</th>
                                  <th>Cantidad</th>
                              </tr>
                              <% for(OrderProduct temp:makis){%>
                              
                                <tr>
                                    <td><%=temp.getName()%></td>
                                    <td><%= temp.getQuantity()%></td>
                                </tr>
                                <%}%>
                          </table>
                                <% if (!makis.isEmpty()){%>
                                <input type="hidden" id="orderId" name="orderId" value="<%= makis.get(0).getOrder().getIdOrder() %>">
                                <% }%>
                        </div>
                        
                        <div class="card-action">
                           <i class="center btn-large waves-effect waves-light orange lighten-1 waves-input-wrapper" style=""><input type="submit" id="btnConfirm" class="center-align waves-button-input" value="Confirmar Envío" style=""></i>
                           
                        </div>
                      </div>
                    </div>
                </form><% makis.clear(); } %>  
        
            
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
