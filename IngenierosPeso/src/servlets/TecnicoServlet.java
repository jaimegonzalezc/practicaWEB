package servlets;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

import util.DbUtil;
import util.ProyectoDao;
import util.UserDao;
import clases.User;



@WebServlet("/TecnicoServlet")
public class TecnicoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger log = Logger.getLogger(DbUtil.class);
       

    public TecnicoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String dni = (String) request.getParameter("dni");
		UserDao dao = new UserDao();
		
		if (action.equals("getusuario")) {
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
			log.info("Se ha editado el usuario "+dni);
			
		} else if(action.equals("elimina")) {
			dao.deleteUser(dni);
			request.getRequestDispatcher("editaempleados.jsp").forward(request, response);
			log.info("Se ha eliminado el usuario "+dni);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action"); 
		 String dni = request.getParameter("DNI");
		 System.out.println("ENTRO");
		if(action.equals("fichar")) {
			ProyectoDao pro = new ProyectoDao();
			
			int horas = Integer.parseInt(request.getParameter("horasDedicadas"));
			int id = Integer.parseInt(request.getParameter("idProy"));
			
			pro.updateHoras(dni, id, horas);
			request.setAttribute("dni", dni);
			request.getRequestDispatcher("ficharHoras.jsp").forward(request, response);
			log.info("El usuario "+dni+" ha fichado horas en el proyecto "+id);
			
		} else if(action.equals("alta")) {
			UserDao dao = new UserDao();
			
			String nombre = request.getParameter("Nombre");
			String ape = request.getParameter("Apellidos");
			int telf = Integer.parseInt(request.getParameter("Tlf"));
			String correo = request.getParameter("Correo");
			
			User user = new User(dni,nombre,ape,correo,dni,"Tecnico",telf);
			
			dao.addUser(user);
			request.getRequestDispatcher("gestionaempleados.jsp").forward(request, response);
			log.info("Se ha dado de alta un nuevo usuario");
		} 
		 
		
		
	}

}
