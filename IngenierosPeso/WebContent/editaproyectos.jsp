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
<link href="menuStyle/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="menuStyle/css/heroic-features.css" rel="stylesheet">
<%
String dni = (String) request.getAttribute("dni");
String nombre = (String) request.getAttribute("nombre");
%>
</head>

<body>
	<script type="text/javascript">
		function EnviarEdicion(i) {
			
			//COGER BOTONES
			var elimina = "elimina"+i;
			var editar = "editar"+i;
			var edita = "edita"+i;
			var eli = document.getElementById(elimina);
			var edi = document.getElementById(editar);
			
			//COGER VARIABLES
			var cifForm = "cif"+i;
			var nomForm = "nombre"+i;
			var dirForm = "direccion"+i;
			var cpForm = "cp"+i;
			var ciuForm = "ciudad"+i;
			var provForm = "provincia"+i;
			var tlfForm = "telefono"+i;
			
			var cif = document.getElementById(cifForm);
	        var nombre = document.getElementById(nomForm);
	        var direccion = document.getElementById(dirForm);
	        var cp = document.getElementById(cpForm);
	        var ciudad = document.getElementById(ciuForm);
	        var provincia = document.getElementById(provForm);
	        var telefono = document.getElementById(tlfForm);
			
			//ACTIVAR O DESACTIVAR	
			if (document.getElementById(edita).checked)
			{	
				eli.disabled = true;
				
				edi.disabled = false;
				cif.disabled = false;
				nombre.disabled = false;
				direccion.disabled = false;
				cp.disabled = false;
				ciudad.disabled = false;
				provincia.disabled = false;
				telefono.disabled = false;
				
			}else{
				eli.disabled = false;
				
				edi.disabled = true;
				cif.disabled = true;
				nombre.disabled = true;
				direccion.disabled = true;
				cp.disabled = true;
				ciudad.disabled = true;
				provincia.disabled = true;
				telefono.disabled = true;
			}
	        
	    }
	</script>
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
				<th scope="col">idProyecto</th>
				<th scope="col">Titulo</th>
				<th scope="col">Descripción</th>
				<th scope="col">Fecha Inicial</th>
				<th scope="col">Fecha Final</th>
			</tr>
		</thead>
		<tbody>
				<%
				EmpresaDao emprdao = new EmpresaDao();
				ArrayList<Empresa> empr = emprdao.getTodasEmpresas();
				int numero=1;
				
				for (int i = 0; i < empr.size(); i++) {
					
				%>
				<tr>
				<td><input type="text" disabled="disabled" id="cif<%=i%>" value="<%= empr.get(i).getCIF() %>"></td>
				<td><input type="text" disabled="disabled" id="nombre<%=i%>" value="<%= empr.get(i).getNombre() %>"></td>
				<td><input type="text" disabled="disabled" id="direccion<%=i%>" value="<%= empr.get(i).getDireccion() %>"></td>
				<td><input type="text" disabled="disabled" id="cp<%=i%>" value="<%= empr.get(i).getCP() %>"></td>
				<td><input type="text" disabled="disabled" id="ciudad<%=i%>" value="<%= empr.get(i).getCiudad() %>"></td>
				<td><input type="text" disabled="disabled" id="provincia<%=i%>" value="<%= empr.get(i).getProvincia() %>"></td>
				<td><input type="text" disabled="disabled" id="telefono<%=i%>" value="<%= empr.get(i).getNumero() %>"></td>
				<td>
					<input type="checkbox" id="edita<%=i%>" onclick="EnviarEdicion(<%=i%>)">
				</td>
				<td>
					<input type="button" value="Eliminar" id="elimina<%=i%>" onclick="location.href='Empresa?action=elimina&CIF=<%= empr.get(i).getCIF() %>';">
				</td>
				<td>
					<input type="button" value="Editar" disabled="disabled" id="editar<%=i%>" onclick="location.href='Empresa?action=editar&CIF=<%= empr.get(i).getCIF() %>&nombre=<%= empr.get(i).getNombre() %>&direccion=<%= empr.get(i).getDireccion() %>&CP=<%= empr.get(i).getCP() %>&ciudad=<%= empr.get(i).getCiudad() %>&provincia=<%= empr.get(i).getProvincia() %>&telefono=<%= empr.get(i).getNumero() %>';">
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