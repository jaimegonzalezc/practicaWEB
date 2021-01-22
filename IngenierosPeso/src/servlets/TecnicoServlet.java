package servlets;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ProyectoDao;
import util.UserDao;
import clases.User;

@WebServlet("/TecnicoServlet")
public class TecnicoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TecnicoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String dni = (String) request.getParameter("dni");
		UserDao dao = new UserDao();
		
		if (action.equals("getusuario")) {
			//String dni = (String) request.getParameter("dni");
			request.setAttribute("dni", dni); 
            request.getRequestDispatcher("ficharHoras.jsp").forward(request, response);
		}else if(action.equals("editar")) {
			
			
			String nombre = request.getParameter("Nombre");
			String ape = request.getParameter("Apellidos");
			int telf = Integer.parseInt(request.getParameter("Tlf"));
			String correo = request.getParameter("Correo");
			
			
			User user = new User(dni,nombre,ape,correo,dao.getUser(dni).getContrasena(),"Tecnico",telf);
			
			dao.updateUser(user);
			request.getRequestDispatcher("editaempleados.jsp").forward(request, response);
			
		} else if(action.equals("elimina")) {
			dao.deleteUser(dni);
			request.getRequestDispatcher("editaempleados.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String action = request.getParameter("action"); 
		 
		 String dni = request.getParameter("DNI");
		 
		 /* String dni = (String) request.getParameter("dni"); if
		 * (action.equals("getusuario")) { request.setAttribute("dni", dni);
		 * request.getRequestDispatcher("ficharHoras.jsp").forward(request, response); }
		 */
		 
		if(action.equals("fichar")) {
			ProyectoDao pro = new ProyectoDao();
			
			int horas = Integer.parseInt(request.getParameter("horasDedicadas"));
			int id = Integer.parseInt(request.getParameter("idProy"));
			
			pro.updateHoras(dni, id, horas);
			request.setAttribute("dni", dni);
			request.getRequestDispatcher("ficharHoras.jsp").forward(request, response);
		} else if(action.equals("alta")) {
			UserDao dao = new UserDao();
			
			
			String nombre = request.getParameter("Nombre");
			String ape = request.getParameter("Apellidos");
			int telf = Integer.parseInt(request.getParameter("Tlf"));
			String correo = request.getParameter("Correo");
			
			User user = new User(dni,nombre,ape,correo,dni,"Tecnico",telf);
			
			dao.addUser(user);
			request.getRequestDispatcher("gestionaempleado.jsp").forward(request, response);
		} 
		 
		
		
	}

}
