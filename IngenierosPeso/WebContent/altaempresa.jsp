<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="form" action="Empresa?action=alta" method="post" onsubmit="return validate()">
	CIF: <input type="text" name="CIF"><br>
	Nombre: <input type="text" name="nombre"><br>
	Direccion: <input type="text" name="direccion"><br>
	Código Postal: <input type="text" name="CP"><br>
	Ciudad: <input type="text" name="ciudad"><br>
	Provincia: <input type="text" name="provincia"><br>
	Teléfono: <input type="text" name="telefono"><br>
	<input type="submit" value="¡Alta!">
</form>
</body>
</html>