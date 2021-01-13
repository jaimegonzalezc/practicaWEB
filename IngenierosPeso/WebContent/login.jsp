
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
<div style="text-align:center"><h1>Login Ingenieros al peso </h1> </div>
<br>
<form name="form" action="LoginServlet" method="post" onsubmit="return validate()">
    <table align="center">
        <tr>
            <td>DNI</td>
            <td><input type="text" name="DNI" /></td>
        </tr>
        <tr>
            <td>Contraseña</td>
            <td><input type="password" name="password" /></td>
        </tr>
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
