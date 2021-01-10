
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<div style="text-align:center"><h1>Login application in Java using MVC and MySQL </h1> </div>
<br>
<form name="form" action="Login" method="post" onsubmit="return validate()">
    <table align="center">
        <tr>
            <td>DNI</td>
            <td><input type="text" name="DNI" /></td>
        </tr>
        <tr>
            <td>Contraseña</td>
            <td><input type="password" name="password" /></td>
        </tr>
        <tr> <!-- refer to the video to understand request.getAttribute() -->
            <td><span style="color:#ff0000"><%=(request.getAttribute("errMessage") == null) ? ""
                    : request.getAttribute("errMessage")%></span></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Login"></input></td>
        </tr>
    </table>
</form>
</body>
</html>