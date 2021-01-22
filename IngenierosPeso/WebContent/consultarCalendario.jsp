<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import='java.util.ArrayList, clases.Calendario, util.CalendarioDao'%>

<!DOCTYPE html>
<html lang="es">

<head>
<%
String dni = (String) request.getAttribute("dni");
%>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Calendario</title>
<link href="menuStyle/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="menuStyle/css/heroic-features.css" rel="stylesheet">

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
					<li class="nav-item active">
					<a class="nav-link"
						href="menu.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
					<li class="nav-item"><a class="nav-link" href="Logout">Logout</a>		
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">Fecha de inicio</th>
				<th scope="col">Fecha de fin</th>
				<th scope="col">Descripción</th>
				<th scope="col">Estado</th>
				<th scope="col">Atendido por</th>
			</tr>
		</thead>
		<tbody>
			<%
				CalendarioDao calendariodao = new CalendarioDao();
				ArrayList<Calendario> proys = calendariodao.listCalendario(dni);
				for (int i = 0; i < proys.size(); i++) {
				%>
				<tr>
				<td><%= proys.get(i).getFechaIni() %></td>
				<td><%= proys.get(i).getFechaFin() %></td>
				<td><%= proys.get(i).getDescripcion() %></td>
				<td><%= proys.get(i).getEstado() %></td>
				<% 
				String dniAtendido = "-";
				if (proys.get(i).getDniRh() != null) dniAtendido = proys.get(i).getDniRh(); %>
				<td><%= dniAtendido %></td>
				<tr>
				<%
				}
				%>
		</tbody>
	</table>
	<div class="row text-center">

		<div class="container">
			

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