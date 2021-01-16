<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import='java.util.ArrayList, clases.Proyecto, util.ProyectoDao'%>

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
					<li class="nav-item"><a class="nav-link" href="Logout">Logout</a>
					</ul>
			</div>
		</div>
	</nav>
	<table>
		<thead>
			<tr>
				<th scope="col">Id Proyecto</th>
				<th scope="col">Descripcion</th>
				<th scope="col">Horas dedicadas</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%
				ProyectoDao proyectodao = new ProyectoDao();
				ArrayList<Proyecto> proys = proyectodao.listProyectos(dni);
				System.out.println("Id: " + proys.get(0).getIdProyecto());
				System.out.println("hola ke ase");
				for (int i = 0; i < proys.size(); i++) {
				%>
				<td><%= proys.get(0).getIdProyecto() %></td>
				<td><%= proys.get(0).getDescripcion() %></td>
				<td><%= proyectodao.getHorasProy(dni, proys.get(0).getIdProyecto()) %></td>
				<%
				}
				%>
			</tr>
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