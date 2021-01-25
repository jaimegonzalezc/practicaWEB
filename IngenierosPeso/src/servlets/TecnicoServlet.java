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
			try {
				String nombre = request.getParameter("Nombre");
				String ape = request.getParameter("Apellidos");
				int telf = Integer.parseInt(request.getParameter("Tlf"));
				String correo = request.getParameter("Correo");
				
				
				User user = new User(dni,nombre,ape,correo,dao.getUser(dni).getContrasena(),"Tecnico",telf);
				
				dao.updateUser(user);
				request.getRequestDispatcher("editaempleados.jsp").forward(request, response);
				log.info("Se ha editado el usuario "+dni);
			} catch (Exception e) {
				//TODO: handle exception
				response.sendRedirect(response.encodeRedirectURL("eEditar.html"));
				log.error(e.getMessage());
			}
		} else if(action.equals("elimina")) {
			try {
				dao.deleteUser(dni);
				request.getRequestDispatcher("editaempleados.jsp").forward(request, response);
				log.info("Se ha eliminado el usuario "+dni);
			} catch (Exception e) {
				//TODO: handle exception
				response.sendRedirect(response.encodeRedirectURL("eBorrado.html"));
				log.error(e.getMessage());
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action"); 
		 String dni = request.getParameter("DNI");
		if(action.equals("fichar")) {
			try {
				ProyectoDao pro = new ProyectoDao();
			
				int horas = Integer.parseInt(request.getParameter("horasDedicadas"));
				int id = Integer.parseInt(request.getParameter("idProy"));
				
				pro.updateHoras(dni, id, horas);
				request.setAttribute("dni", dni);
				request.getRequestDispatcher("ficharHoras.jsp").forward(request, response);
				log.info("El usuario "+dni+" ha fichado horas en el proyecto "+id);
			} catch (Exception e) {
				//TODO: handle exception
				response.sendRedirect(response.encodeRedirectURL("eFichar.html"));
				log.error(e.getMessage());
			}
			
			
		} else if(action.equals("alta")) {
			try {
				UserDao dao = new UserDao();
			
				String nombre = request.getParameter("Nombre");
				String ape = request.getParameter("Apellidos");
				int telf = Integer.parseInt(request.getParameter("Tlf"));
				String correo = request.getParameter("Correo");
				
				User user = new User(dni,nombre,ape,correo,dni,"Tecnico",telf);
				
				dao.addUser(user);
				request.getRequestDispatcher("gestionaempleados.jsp").forward(request, response);
				log.info("Se ha dado de alta un nuevo usuario");
			} catch (Exception e) {
				//TODO: handle exception
				response.sendRedirect(response.encodeRedirectURL("eAlta.html"));
				log.error(e.getMessage());
			}
			
		} 
		 
		
		
	}

}
