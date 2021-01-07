import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    public LoginServlet() {

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Here username and password are the names which I have given in the input box in Login.jsp page. Here I am retrieving the values entered by the user and keeping in instance variables for further use.

        String dni = request.getParameter("DNI");
        String password = request.getParameter("password");
        UserDao dao = new UserDao(); //creating object for LoginDao. This class contains main logic of the application.

        String userValidate = dao.logInAuthentication(dni, password); //Calling authenticateUser function

        if(userValidate.equals("EXITO")) //If function returns success string then user will be rooted to Home page
        {

        }
    }
}
