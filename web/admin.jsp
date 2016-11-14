<%-- 
    Document   : admin
    Created on : 25/10/2016, 11:56:16 AM
    Author     : Leonel
--%>

<%@page import="Entities.RelRestMak"%>
<%@page import="Entities.Waiter"%>
<%@page import="java.util.List"%>
<%@page import="DataAccess.Waiters.WaiterRepository"%>
<%@page import="DataAccess.Tables.TableRepository"%>
<%@page import="DataAccess.Waiters.IWaiterRepository"%>
<%@page import="DataAccess.Tables.ITableRepository"%>
<%@page import="Entities.Tables"%>
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
        <% HttpSession httpsession = request.getSession(false); 
            Tables cUser = (Tables) httpsession.getAttribute("CurrentUser");
             ITableRepository restTables = new TableRepository();
             IWaiterRepository waiterRepo = new WaiterRepository();
             List<Tables> listTables = (List<Tables>) restTables.GetUsersTablesByRestaurant(cUser.getRestaurants().getIdRestaurant());
             List<Waiter> listWaiter = (List<Waiter>) waiterRepo.GetWaitersFromRestaurants(cUser.getRestaurants().getIdRestaurant());%>
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
        
        <div class="section no-pad-bot" id="index-banner">
        	<div class="row">
				<div class="col s12 m6">
					<div class="card medium">
						<div class="card-image waves-effect waves-block waves-light">
						  <img class="activator" src="resources/ingresando.jpg">
						</div>
						<div class="card-content">
						  <span class="card-title activator grey-text text-darken-4">Agregar Mesa<i class="material-icons right">more_vert</i></span>
						  <p>¿Nuevos clientes? ¡Agrega una Mesa!</p>
						</div>
						<div class="card-reveal">
						  <span class="card-title grey-text text-darken-4">Agregar Mesa<i class="material-icons right">close</i></span>
                                                  <form class="col s12" action="AddTable" method="POST">
                                                    <div>

                                                        <div class="input-field">
                                                            <input name ="txtTableUsername"id="txtTableUsername" type="text" class="validate">
                                                            <label class="" for="txtTableUsername">Código de Mesa</label>
                                                        </div>

                                                        <div class="row"></div>

                                                        <div class="input-field">
                                                            <input name ="txtTablePassword" id="txtTablePassword" type="password" class="validate">
                                                            <label class="" for="txtTablePassword">Contraseña</label>

                                                        </div>

                                                        <div class="row">
                                                            <div class="select-wrapper icons"><span class="caret">▼</span>
                                                                <select id="sltWaiter" name="sltWaiter" class="icons initialized input-field label">
                                                                    <option value="" disabled="" selected="">Escoge un Mesero</option>
                                                                    <!--- CODIGO JAVA PARA SOLO MOSTRAR LOS MESEROS DE CADA RESTAURANTE> DE LA DB --->
                                                                    <%for(Waiter wtr: listWaiter) {%>
                                                                    <option value="<%= wtr.getIdWaiter()%>" data-icon="<%out.println(wtr.getSrcImg());%>" class="circle"><%out.println(wtr.getName());%></option>
                                                                    <%}%>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="row center">
                                                            <i class="center btn-large waves-effect waves-light brown lighten-1 waves-input-wrapper" style=""><input type="submit" id="btnNewMesa" class="waves-button-input" value="Agregar Mesa" style=""></i>
                                                        </div>
                                                    </div>
                                                   </form>

						</div>
					</div>
				</div>
				<div class="col s12 m6">
						<div class="card medium">
							<div class="card-image waves-effect waves-block waves-light">
							  <img class="activator" src="resources/retirandose.jpg">
							</div>
							<div class="card-content">
							  <span class="card-title activator grey-text text-darken-4">Eliminar Mesa<i class="material-icons right">more_vert</i></span>
							  <p>¿Terminó el servicio? ¡Elimina una Mesa!</p>
							</div>
                                                   
							<div class="card-reveal">
                                                            <form method="POST" action="DeleteTable">
							  <span class="card-title grey-text text-darken-4">Eliminar Mesa<i class="material-icons right">close</i></span>
                                                            <p>¡Dale click a las Mesas que deseas eliminar! ¡Puedes escoger varias a la vez!</p>
                                                            <table>
                                                                <% for(Tables table : listTables) {%>
                                                                <tr>
                                                                    <td><font><input type="checkbox" name="delTables" value="<%=table.getIdTable()%>" id="<%=table.getIdTable()%>"/><label for="<%=table.getIdTable()%>"><%out.println(table.getUsername());%></label></font></td>
                                                                </tr>
                                                                <%}%>
                                                            </table>
                                                            
                                                            <div class="row center">
                                                            <i class="center btn-large waves-effect waves-light brown lighten-1 waves-input-wrapper" style=""><input type="submit" id="btnDelMesa" class="waves-button-input" value="Eliminar Mesas" style=""></i>
                                                            </div>
                                                           </form>
							</div>
                                                    
						</div>
				</div>
				<div class="col s12 m6">
							<div class="card medium">
								<div class="card-image waves-effect waves-block waves-light">
								  <img class="activator" src="resources/mesero.jpg">
								</div>
								<div class="card-content">
								  <span class="card-title activator grey-text text-darken-4">Agregar Mesero<i class="material-icons right">more_vert</i></span>
								  <p>¿Un nuevo miembro en la Familia? ¡Agrega un Mesero!</p>
								</div>
								<div class="card-reveal">
								  <span class="card-title grey-text text-darken-4">Agregar Mesero<i class="material-icons right">close</i></span>
                                                                  <form class="col s12" action="AddWaiter" method="POST">
                                                                    <div>
                                                                         
                                                                        <div class="input-field">
                                                                            <input id="txtWaiterName" name="txtWaiterName" type="text">
                                                                            <label class="" for="txtWaiterName">Nombre del Mesero</label>
                                                                        </div>

                                                                        <div class="row"></div>

                                                                        <div class="input-field">
                                                                            <input id="txtWaiterImgSource" name="txtWaiterImgSource" type="text" class="">
                                                                            <label class="" for="txtWaiterImgSource">Link de Imagen del Mesero</label>

                                                                        </div>

                                                                        <div class="row"></div>

                                                                        <div class="row center">
                                                                            <i class="center btn-large waves-effect waves-light brown lighten-1 waves-input-wrapper" style=""><input type="submit" id="btnNewMesa" class="waves-button-input" value="Agregar Mesero" style=""></i>
                                                                        </div>
                                                                    </div>
                                                                   </form>
								</div>
							</div>
				</div>
      			<div class="col s12 m6">
							<div class="card medium">
								<div class="card-image waves-effect waves-block waves-light">
								  <img class="activator" src="resources/adiosmesero.jpg">
								</div>
								<div class="card-content">
								  <span class="card-title activator grey-text text-darken-4">Eliminar Mesero<i class="material-icons right">more_vert</i></span>
								  <p>¿Nuevos horizontes? Elimina un Mesero</p>
								</div>
								<div class="card-reveal">
                                                                  <form method="POST" action="DeleteWaiter">
                                                                    <span class="card-title grey-text text-darken-4">Eliminar Mesero<i class="material-icons right">close</i></span>
                                                                    <p>¡Dale click a los Meseros que deseas eliminar! ¡Puedes escoger varios a la vez!</p>
                                                                    <table>
                                                                          <% for(Waiter wtr : listWaiter) {%>
                                                                          <tr>
                                                                              <td><font><input type="checkbox" name="delWaiters" value="<%= wtr.getIdWaiter()%>" id="chk<%= wtr.getIdWaiter()%>"/><label for="chk<%= wtr.getIdWaiter()%>"><%out.println(wtr.getName());%></label></font></td>
                                                                          </tr>
                                                                          <%}%>
                                                                    </table>
                                                                    
                                                                    <div class="row center">
                                                                    <i class="center btn-large waves-effect waves-light brown lighten-1 waves-input-wrapper" style=""><input type="submit" id="btnDelWaiter" class="waves-button-input" value="Eliminar Meseros" style=""></i>
                                                                    </div>
                                                                  </form>
								</div>
							</div>
				</div>
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
