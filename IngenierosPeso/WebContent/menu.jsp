<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import='util.UserDao, util.CalendarioDao'%>
<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Menú principal empleado</title>
<link href="menuStyle/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="menuStyle/css/heroic-features.css" rel="stylesheet">
<%
String dni = (String) request.getAttribute("dni");
UserDao dao = new UserDao();
String nombre = dao.getUser(dni).getNombre();
Boolean dialibre = false;
if (request.getAttribute("dialibre") != null)
	dialibre = (Boolean) request.getAttribute("dialibre");
if (dialibre) {
%>
<script>
	alert("Calendario añadido con éxito");
</script>
<%
}

CalendarioDao caldao = new CalendarioDao();

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

					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<header class="jumbotron my-4">
			<h1 class="display-3">
				Bienvenido
				<%=nombre%></h1>

			<p class="lead">Desde este menú principal, podrás acceder a todas
				las funcionalidades del sistema. Antes de nada, no olvides fichar
				las horas trabajadas en cada proyecto el día anterior.</p>
			<button class="btn btn-success"
				onClick="location.href='TecnicoServlet?action=getusuario&dni=<%=dni%>';">Fichar
				horas del día anterior!</button>
		</header>
		<div class="row text-center">

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h4 class="card-title">Pedir días libres</h4>
						<p class="card-text">Aquí podrás pedir días libres a los
							responsables de Recursos Humanos.</p>
					</div>
					<div class="card-footer">
						<button class="btn btn-success"
							onClick="location.href='CalendarioServlet?action=diaslibres&dni=<%=dni%>';">Pedir
							días libres!</button>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h4 class="card-title">Consultar calendario.</h4>
						<p class="card-text">Aquí podrás consultar tu calendario de
							actividades.</p>
					</div>
					<div class="card-footer">
						<button class="btn btn-success"
							onClick="location.href='CalendarioServlet?action=getcalendario&dni=<%=dni%>';">
							Consultar Calendario! (<%= caldao.estadoCal(dni)%>)</button>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h4 class="card-title">Pedir vacaciones</h4>
						<p class="card-text">Aquí podrás realizar una solicitud de
							vacaciones, que deberá ser tramitada por Recursos humanos.</p>
					</div>
					<div class="card-footer">
						<button class="btn btn-success"
							onClick="location.href='CalendarioServlet?action=vacaciones&dni=<%=dni%>';">
							Pedir vacaciones!</button>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h4 class="card-title">Horas libres por compromiso</h4>
						<p class="card-text">Aquí podrás notificar la ausencia ciertas
							horas del día por un motivo justificado.</p>
					</div>
					<div class="card-footer">
						<button class="btn btn-success"
							onClick="location.href='CalendarioServlet?action=horaslibres&dni=<%=dni%>';">
							Notificar ausencia!</button>
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