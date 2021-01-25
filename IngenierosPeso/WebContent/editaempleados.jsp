<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import='java.util.ArrayList, clases.User, util.UserDao'%>

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
	
		var nuevotit;
		var nuevodesc;
		var nuevofi;
		var nuevoff;
	
		function EnviarEdicion(i) {
			
			//COGER BOTONES
			var elimina = "elimina"+i;
			var edita = "edita"+i;
			
			var editar = "editar"+i;
			
			var eli = document.getElementById(elimina);
			var edi = document.getElementById(editar);
			
			//COGER VARIABLES
			var dniForm = "dni"+i;
			var nomForm = "nombre"+i;
			var apeForm = "apellido"+i;
			var tlfForm = "tlf"+i;
			var correoForm = "correo"+i;
			
			var dni = document.getElementById(dniForm);
	        var nombre = document.getElementById(nomForm);
	        var apellido = document.getElementById(apeForm);
	        var telefono = document.getElementById(tlfForm);
	        var correo = document.getElementById(correoForm);
			
			//ACTIVAR O DESACTIVAR	
			if (document.getElementById(edita).checked)
			{	
				eli.disabled = true;
				
				edi.disabled = false;
				nombre.disabled = false;
				apellido.disabled = false;
				telefono.disabled = false;
				correo.disabled = false;
				
			}else{
				eli.disabled = false;
				
				edi.disabled = true;
				nombre.disabled = true;
				apellido.disabled = true;
				telefono.disabled = true;
				correo.disabled = true;
			}
	        
	    }
		
		function actualizar(i){
					
			var dniForm = "dni"+i;
			var nomForm = "nombre"+i;
			var apeForm = "apellido"+i;
			var tlfForm = "tlf"+i;
			var correoForm = "correo"+i;
			
			var dni = document.getElementById(dniForm);
	        var nombre = document.getElementById(nomForm);
	        var apellido = document.getElementById(apeForm);
	        var telefono = document.getElementById(tlfForm);
	        var correo = document.getElementById(correoForm);
	        
	        window.location.href="TecnicoServlet?action=editar&dni="+dni.value+"&Nombre="+nombre.value
	        		+"&Apellidos="+apellido.value+"&Tlf="+telefono.value+"&Correo="+correo.value;
	        
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
				<th scope="col">DNI</th>
				<th scope="col">Nombre</th>
				<th scope="col">Apellidos</th>
				<th scope="col">Telefono</th>
				<th scope="col">Correo</th>
			</tr>
		</thead>
		<tbody>
				<%
				UserDao userdao = new UserDao();
				ArrayList<User> user = userdao.getTecnicos();
				for (int i = 0; i < user.size(); i++) {
					
				%>
				<tr>
				<td><input type="text" disabled="disabled" id="dni<%=i%>" value="<%= user.get(i).getDNI() %>"></td>
				<td><input type="text" disabled="disabled" id="nombre<%=i%>" value="<%= user.get(i).getNombre() %>"></td>
				<td><input type="text" disabled="disabled" id="apellido<%=i%>" value="<%= user.get(i).getApellidos() %>"></td>
				<td><input type="text" disabled="disabled" id="tlf<%=i%>" value="<%= user.get(i).getNumero() %>"></td>
				<td><input type="text" disabled="disabled" id="correo<%=i%>" value="<%= user.get(i).getCorreo() %>"></td>
				<td>
					<input type="checkbox" id="edita<%=i%>" onclick="EnviarEdicion(<%=i%>)">
				</td>
				<td>
					<input type="button" value="Eliminar" id="elimina<%=i%>" onclick="location.href='TecnicoServlet?action=elimina&dni=<%= user.get(i).getDNI() %>';">
				</td>
				<td>
				<!-- NO COJO EL VALOR, COJO DIRECTAMENTE EL TITULO, HAY QUE CAMBIAR EL TITULO DEL PROY.GET() -->
					<input type="button" disabled="disabled" value="Editar" id="editar<%=i%>" onclick="actualizar(<%=i%>)">
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