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
			var titForm = "titulo"+i;
			var descForm = "descr"+i;
			var fiForm = "fi"+i;
			var ffForm = "ff"+i;
			
	        var titulo = document.getElementById(titForm);
	        var descripcion = document.getElementById(descForm);
	        var finicio = document.getElementById(fiForm);
	        var ffin = document.getElementById(ffForm);
			
			//ACTIVAR O DESACTIVAR	
			if (document.getElementById(edita).checked)
			{	
				eli.disabled = true;
				
				edi.disabled = false;
				titulo.disabled = false;
				descripcion.disabled = false;
				finicio.disabled = false;
				ffin.disabled = false;
				
			}else{
				eli.disabled = false;
				
				edi.disabled = true;
				titulo.disabled = true;
				descripcion.disabled = true;
				finicio.disabled = true;
				ffin.disabled = true;
			}
	        
	    }
		
		/* function cambiatitulo(i){
			var titForm = "titulo"+i;
			var titulo = document.getElementById(titForm);
			nuevotit = titulo.value;
		}
		function cambiadesc(i){
			var descForm = "descr"+i;
			var descripcion = document.getElementById(descForm);
			nuevodesc = descripcion.value;
		}
		function cambiafi(i){
			var fiForm = "fi"+i;
			var finicio = document.getElementById(fiForm);
			nuevofi = finicio.value;
		}
		function cambiaff(i){
			var ffForm = "ff"+i;
			var ffin = document.getElementById(ffForm);
			nuevoff = ffin.value;
		} */
		
		function actualizar(i){
					
			var idForm = "idproy"+i;
			var titForm = "titulo"+i;
			var descForm = "descr"+i;
			var fiForm = "fi"+i;
			var ffForm = "ff"+i;
			
			var idproy = document.getElementById(idForm);
	        var titulo = document.getElementById(titForm);
	        var descripcion = document.getElementById(descForm);
	        var finicio = document.getElementById(fiForm);
	        var ffin = document.getElementById(ffForm);
	        
	        window.location.href="ProyectoServlet?action=editar&idpro="+idproy.value+"&titulo="+titulo.value
	        		+"&desc="+descripcion.value+"&fi="+finicio.value+"&ff="+ffin.value;
	        
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
				ProyectoDao proyecdao = new ProyectoDao();
				ArrayList<Proyecto> proy = proyecdao.getTodosProyectos();
				for (int i = 0; i < proy.size(); i++) {
					
				%>
				<tr>
				<td><input type="text" disabled="disabled" id="idproy<%=i%>" value="<%= proy.get(i).getIdProyecto() %>"></td>
				<td><input type="text" disabled="disabled" id="titulo<%=i%>" value="<%= proy.get(i).getTitulo() %>"></td>
				<td><input type="text" disabled="disabled" id="descr<%=i%>" value="<%= proy.get(i).getDescripcion() %>"></td>
				<td><input type="text" disabled="disabled" id="fi<%=i%>" value="<%= proy.get(i).getFechaIni() %>"></td>
				<td><input type="text" disabled="disabled" id="ff<%=i%>" value="<%= proy.get(i).getFechaFin() %>"></td>
				<td>
					<input type="checkbox" id="edita<%=i%>" onclick="EnviarEdicion(<%=i%>)">
				</td>
				<td>
					<input type="button" value="Eliminar" id="elimina<%=i%>" onclick="location.href='ProyectoServlet?action=elimina&idpro=<%= proy.get(i).getIdProyecto() %>';">
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