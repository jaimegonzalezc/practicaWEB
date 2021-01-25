<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Menú para dar de alta proyectos</title>
<link href="menuStyle/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="menuStyle/css/heroic-features.css" rel="stylesheet">
<script src="validar.js"></script>


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
						href="gestionempresa.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<header class="jumbotron my-4">
			<h1 class="display-3">Da de alta a un nuevo empleado</h1>
			
<form name="form" action="TecnicoServlet?action=alta" method="post" onsubmit="return validar()">
	DNI:<input type="text" id="dni"name="DNI" required><br>
	Nombre: <input type="text" id="nombre" name="Nombre" required><br>
	Apellido: <input type="text" id="apellidos" name="Apellidos" required><br>
	Telefono: <input type="text" id="telefono" name="Tlf" required><br>
	Correo: <input type="text" id="correo" name="Correo" required><br>
	<input type="submit" value="¡Alta!">
</form>
</header>
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