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
		function EnableDisableTextBox(edita) {
			var elimina = document.getElementById("elimina");
	        var cif = document.getElementById("cif");
	        var nombre = document.getElementById("nombre");
	        var direccion = document.getElementById("direccion");
	        var cp = document.getElementById("cp");
	        var ciudad = document.getElementById("ciudad");
	        var provincia = document.getElementById("provincia");
	        var telefono = document.getElementById("telefono");
 	        cif.disabled = edita.checked ? false : true;
	        nombre.disabled = edita.checked ? false : true;
	        direccion.disabled = edita.checked ? false : true;
	        cp.disabled = edita.checked ? false : true;
	        ciudad.disabled = edita.checked ? false : true;
	        provincia.disabled = edita.checked ? false : true;
	        telefono.disabled = edita.checked ? false : true;
	        
	        if(edita.check){
	        	elimina
	        }
	        
        	/*if (cif.disabled) {
	            cif.focus();
	        }
	        if (nombre.disabled) {
	            nombre.focus();
	        }
	        if (direccion.disabled) {
	            direccion.focus();
	        }
	        if (cp.disabled) {
	            cp.focus();
	        }
	        if (ciudad.disabled) {
	            ciudad.focus();
	        }
	        if (provincia.disabled) {
	            provincia.focus();
	        }
	        if (telefono.disabled) {
	            telefono.focus();
	        }*/
	        
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
				<th scope="col">Nº</th>
				<th scope="col">CIF</th>
				<th scope="col">Nombre</th>
				<th scope="col">Direccion</th>
				<th scope="col">Código postal</th>
				<th scope="col">Ciudad</th>
				<th scope="col">Provincia</th>
				<th scope="col">Teléfono</th>
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
				<td><%= numero++ %> </td>
				<td><input type="text" disabled="disabled" id="cif" value="<%= empr.get(i).getCIF() %>"></td>
				<td><input type="text" disabled="disabled" id="nombre" value="<%= empr.get(i).getNombre() %>"></td>
				<td><input type="text" disabled="disabled" id="direccion" value="<%= empr.get(i).getDireccion() %>"></td>
				<td><input type="text" disabled="disabled" id="cp" value="<%= empr.get(i).getCP() %>"></td>
				<td><input type="text" disabled="disabled" id="ciudad" value="<%= empr.get(i).getCiudad() %>"></td>
				<td><input type="text" disabled="disabled" id="provincia" value="<%= empr.get(i).getProvincia() %>"></td>
				<td><input type="text" disabled="disabled" id="telefono" value="<%= empr.get(i).getNumero() %>"></td>
				<td>
					<label for="edita">
						<input type="checkbox" id="edita" onclick="EnableDisableTextBox(this)">
					</label>
				</td>
				<td>
					<input type="button" value="Eliminar" id="elimina" onclick="location.href='Empresa?action=elimina&CIF=<%= empr.get(i).getCIF() %>';">
				</td>
				<td>
					<input type="button" value="Editar" id="editar" onclick="location.href='Empresa?action=editar&CIF=<%= empr.get(i).getCIF() %>&nombre=<%= empr.get(i).getNombre() %>&direccion=<%= empr.get(i).getDireccion() %>&CP=<%= empr.get(i).getCP() %>&ciudad=<%= empr.get(i).getCiudad() %>&provincia=<%= empr.get(i).getProvincia() %>&telefono=<%= empr.get(i).getNumero() %>';">
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