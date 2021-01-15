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

</head>
<body>
<div class="container">
		<header class="jumbotron my-4">
			<h1 class="display-3">Da de alta un nuevo proyecto</h1>
<form name="form" action="../Proyecto?action=alta" method="post" onsubmit="return validate()">
	idProyecto: <input type="text" name="idProyecto"><br>
	FechaIni: <input type="datetime" name="Fecha de inicio"><br>
	FechaFin: <input type="text" name="Fecha de finalización"><br>
	Descripcion: <input type="text" name="Descripción del proyecto"><br>
	<input type="submit" value="¡Alta!">
</form>
</header>
</div>
</body>
</html>