
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Login del usuario</title>
<link href="menuStyle/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="menuStyle/css/heroic-features.css" rel="stylesheet">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <script>
        function validate()
        {
            var dni = document.form.DNI.value;
            var password = document.form.password.value;

            if (dni==null || dni=="")
            {
                alert("Username cannot be blank");
                return false;
            }
            else if(password==null || password=="")
            {
                alert("Password cannot be blank");
                return false;
            }
        }
    </script>
</head>
<body>
<div style="text-align:center"><h1>Login Ingenieros al peso </h1> </div>
<br>
<form name="form" action="LoginServlet" method="post" onsubmit="return validate()">
    <table align="center">
        <tr>
            <td>DNI</td>
            <td><input type="text" name="DNI" required /></td>
        </tr>
        <tr>
            <td>Contraseña</td>
            <td><input type="password" name="password" required /></td>
        </tr>
        <tr>
            <td><span style="color:#ff0000"><%=(request.getAttribute("errMessage") == null) ? ""
                    : request.getAttribute("errMessage")%></span></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Login"></input></td>
        </tr>
    </table>
</form>
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
