<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import='java.util.ArrayList, clases.Calendario, util.CalendarioDao'%>
<%@page import='java.util.*' session="true" %>


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
String dni = (String) request.getParameter("dniUser");

System.out.println(dni);
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
						href="menurh.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
					<li class="nav-item"><a class="nav-link" href="Logout">Logout</a>
					</ul>
			</div>
		</div>
	</nav>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">Fecha inicio</th>
				<th scope="col">Fecha fin</th>
				<th scope="col">Descripcion</th>
				<th scope="col">DNI</th>
				<th scope="col">Estado</th>
			</tr>
		</thead>
		<tbody>
				<%
				CalendarioDao caldao = new CalendarioDao();
				ArrayList<Calendario> cal = caldao.allCalendario();
				for (int i = 0; i < cal.size(); i++) {
					
				%>
				<tr>
				<td><input type="text" disabled="disabled" id="fini" value="<%= cal.get(i).getFechaIni() %>"></td>
				<td><input type="text" disabled="disabled" id="ffin" value="<%= cal.get(i).getFechaFin() %>"></td>
				<td><input type="text" disabled="disabled" id="descr" value="<%= cal.get(i).getDescripcion() %>"></td>
				<td><input type="text" disabled="disabled" id="dni" value="<%= cal.get(i).getDniEmp() %>"></td>
				<td><input type="text" disabled="disabled" id="estado" value="<%= cal.get(i).getEstado() %>"></td>
				<td>
					<input type="button" value="Aprobar" id="aprobar" onclick="location.href='CalendarioServlet?action=estado&dni=<%= cal.get(i).getDniEmp() %>&dniRH=<%= dni %>&fini=<%= cal.get(i).getFechaIni() %>&est=Aprobado';">
				</td>
				<td>
					<input type="button" value="Denegar" id="denegar" onclick="location.href='CalendarioServlet?action=estado&dni=<%= cal.get(i).getDniEmp() %>&dniRH=<%= dni %>&fini=<%= cal.get(i).getFechaIni() %>&est=Denegado';">
				</td>
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