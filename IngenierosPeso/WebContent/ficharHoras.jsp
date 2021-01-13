<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import='java.util.ArrayList, src.Proyecto'%>

<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Fichar horas de proyectos</title>
<link href="menuStyle/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="menuStyle/css/heroic-features.css" rel="stylesheet">
<%
String dni = (String) request.getAttribute("dni");
String nombre = (String) request.getAttribute("nombre");
%>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Ingenieros al peso</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="menu.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<table > 
            <thead> 
                <tr> 
                    <th scope="col">User Id</th> 
                    <th scope="col">Nombre</th> 
                    <th scope="col">Apellido</th> 
                    <th scope="col">DOB</th> 
                    <th scope="col">Email</th> 
                    <th  scope="col">Action</th> 
                </tr> 
            </thead> 
            <tbody> 
            <%
            ProyectoDao proyectodao = new ProyectoDao();
            ArrayList<Proyecto> proys = proyectodao.listProyectos(dni);
            %>
                <c:forEach items=<% %>var="user"> 
                    <tr> 
                        <td scope="row"><c:out value="${user.userid}" /></td>
                        <td><c:out value="${user.firstName}" /></td> 
                        <td><c:out value="${user.lastName}" /></td> 
                        <td><fmt:formatDate pattern="dd-MM-yyyy" value="${user.dob}" /></td>
                        <td><c:out value="${user.email}" /></td> 
                        <td><a href="UserController?action=edit&userId=<c:out value="${user.userid}"/>">Update</a></td> 
                        <td><a href="UserController?action=delete&userId=<c:out value="${user.userid}"/>">Delete</a></td> 
                    </tr> 
                </c:forEach> 
            </tbody> 
        </table> 
	<div class="row text-center">
	
		<div class="container">
			<form action="TecnicoServlet">
				<p>Introduzca el número de horas que ha dedicado al proyecto
					elegido.</p>
				<input type="time" name="hora" max="8:00:00" min="00:30:00" required>





			</form>

		</div>
	</div>


	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Ingenieros
				al peso. 2021</p>
		</div>
	</footer>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>