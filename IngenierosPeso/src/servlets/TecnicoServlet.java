package servlets;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ProyectoDao;

@WebServlet("/TecnicoServlet")
public class TecnicoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TecnicoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		String dni = (String) request.getParameter("dni");
		if (action.equals("getusuario")) {
			request.setAttribute("dni", dni); 
            request.getRequestDispatcher("ficharHoras.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * String action = request.getParameter("action"); UserDao dao = new UserDao();
		 * 
		 * String dni = (String) request.getParameter("dni"); if
		 * (action.equals("getusuario")) { request.setAttribute("dni", dni);
		 * request.getRequestDispatcher("ficharHoras.jsp").forward(request, response); }
		 */
		ProyectoDao pro = new ProyectoDao();
		
		int horas = Integer.parseInt(request.getParameter("horasDedicadas"));
		int id = Integer.parseInt(request.getParameter("idProy"));
		String dni = request.getParameter("dni");
		
		pro.updateHoras(dni, id, horas);
		request.setAttribute("dni", dni);
		request.getRequestDispatcher("ficharHoras.jsp").forward(request, response);
		
	}

}
