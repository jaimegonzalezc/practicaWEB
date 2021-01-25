package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import clases.User;
import util.DbUtil;
import util.UserDao;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger log = Logger.getLogger(DbUtil.class);

    public LoginServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String dni = request.getParameter("DNI");
        String password = request.getParameter("password");
        UserDao dao = new UserDao(); 
        String userValidate = dao.logInAuthentication(dni, password); 
        User usuario = dao.getUser(dni);
		request.setAttribute("nombre", usuario.getNombre()); 
    	request.setAttribute("dni", dni);
        
        if(userValidate.equals("TEC"))
        {
            request.getRequestDispatcher("/menu.jsp").forward(request, response);
            log.info("Ha iniciado sesión el técnico "+dni);
        }
        else if(userValidate.equals("RRHH")) {
            request.getRequestDispatcher("/menurh.jsp").forward(request, response);
            log.info("Ha iniciado sesión el usuario de recursos humanos "+dni);
        }
        else {
        	request.setAttribute("errMessage", userValidate); 
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            log.info("Error al iniciar sesión");
        }
	}

}
