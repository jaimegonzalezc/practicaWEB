<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Gestionar proyectos</title>
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
						href="menurh.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
					<li class="nav-item"><a class="nav-link" href="Logout">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<header class="jumbotron my-4">
			<!--  <h1 class="display-3">Bienvenido personal de recursos humanos</h1>  <!-- Bootstrap core JavaScript
			
			<p class="lead">Desde este menú principal, podrás gestionar todas
				las funcionalidades del sistema.</p>
			<a href="#" class="btn btn-success btn-lg">Notificaciones</a>-->
		</header> 
		<div class="row text-center">

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h4 class="card-title">Añade proyectos</h4>
						<p class="card-text">Aquí podrás añadir nuevos proyectos que tengamos en nuestro servicio.</p>
					</div>
					<div class="card-footer">
						<a href="altaproyecto.jsp" class="btn btn-success">¡Alta nueva!</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h4 class="card-title">Edita proyecto</h4>
						<p class="card-text">Modifica la información de los proyectos</p>
					</div>
					<div class="card-footer">
						<a href="editaproyectos.jsp" class="btn btn-success">¡Modifica datos!</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h4 class="card-title">Borra proyectos</h4>
						<p class="card-text">Aquí podrás dar de baja a los proyectos que se han acabado.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-success">¡Baja!</a>
					</div>
				</div>
			</div>

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