<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import='java.util.ArrayList, clases.Empresa, util.EmpresaDao'%>

<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Fichar horas de proyectos</title>
<link href="../menuStyle/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../menuStyle/css/heroic-features.css" rel="stylesheet">
<script type="text/javascript" src="../JavaScript/generarficheros.js"></script>
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
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">CIF</th>
				<th scope="col">Nombre</th>
				<th scope="col">Direccion</th>
				<th scope="col">Código postal</th>
				<th scope="col">Ciudad</th>
				<th scope="col">Provincia</th>
				<th scope="col">Teléfono</th>
			</tr>
		</thead>
				<%
				EmpresaDao emprdao = new EmpresaDao();
				ArrayList<Empresa> empr = emprdao.getTodasEmpresas();
				int numero=1;
				
				for (int i = 0; i < empr.size(); i++) {
					
				%>
				<tr>
				<td><%= empr.get(i).getCIF() %></td>
				<td><%= empr.get(i).getNombre() %></td>
				<td><%= empr.get(i).getDireccion() %></td>
				<td><%= empr.get(i).getCP() %></td>
				<td><%= empr.get(i).getCiudad() %></td>
				<td><%= empr.get(i).getProvincia() %></td>
				<td><%= empr.get(i).getNumero() %></td>
				<tr>
				<%
				}
				%>
	</table>
	<div class="row text-center">

		<div class="container">

			<input type="button" value="Descargar" onclick="Descargar('Empresas.csv')">

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