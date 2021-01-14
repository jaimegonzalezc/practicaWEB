package servlets;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clases.User;
import util.UserDao;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String dni = request.getParameter("DNI");
        String password = request.getParameter("password");
        UserDao dao = new UserDao(); 
        String userValidate = dao.logInAuthentication(dni, password); 
        System.out.println(dao.getUser(dni).getApellidos());
        System.out.println(userValidate);
        if(userValidate.equals("TEC"))
        {
	        User usuario = dao.getUser(dni);
			request.setAttribute("nombre", usuario.getNombre()); 
        	request.setAttribute("dni", dni); 
            request.getRequestDispatcher("/menu.jsp").forward(request, response);
        }
        else if(userValidate.equals("RRHH")) {
        	User usuario = dao.getUser(dni);
			request.setAttribute("nombre", usuario.getNombre()); 
        	request.setAttribute("dni", dni); 
            request.getRequestDispatcher("/menurh.jsp").forward(request, response);
        }
        else {
        	request.setAttribute("errMessage", userValidate); 
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
	}

}
