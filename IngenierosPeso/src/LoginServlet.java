import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String dni = request.getParameter("DNI");
        String password = request.getParameter("password");
        UserDao dao = new UserDao(); //creating object for LoginDao. This class contains main logic of the application.

        String userValidate = dao.logInAuthentication(dni, password); //Calling authenticateUser function

        if(userValidate.equals("EXITO")) //If function returns success string then user will be rooted to Home page
        {
        	response.sendRedirect("menu.jsp");
        }
        else {
        	request.getRequestDispatcher("login.jsp").forward(request, response);
        }
	}

}
