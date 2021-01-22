package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clases.Calendario;
import util.CalendarioDao;

@WebServlet("/CalendarioServlet")
public class CalendarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CalendarioServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action.equals("getcalendario")) {
			String dni = (String) request.getParameter("dni");
			request.setAttribute("dni", dni);
			request.getRequestDispatcher("consultarCalendario.jsp").forward(request, response);
		}
		else if (action.equals("diaslibres")) {
			String dni = (String) request.getParameter("dni");
			request.setAttribute("dni", dni);
			request.getRequestDispatcher("diasLibres.jsp").forward(request, response);
		}
		else if (action.equals("horaslibres")) {
			String dni = (String) request.getParameter("dni");
			request.setAttribute("dni", dni);
			request.getRequestDispatcher("horasLibres.jsp").forward(request, response);
		}
		else if (action.equals("vacaciones")) {
			String dni = (String) request.getParameter("dni");
			request.setAttribute("dni", dni);
			request.getRequestDispatcher("vacaciones.jsp").forward(request, response);
		} else {
			System.out.println("Error");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CalendarioDao cal = new CalendarioDao();
		if (request.getParameter("dialibre") != null) {
			String fechaIni = request.getParameter("FechaIni");
			String dniUser = request.getParameter("dni");
			String motivo = request.getParameter("motivo");
			Calendario calendario = new Calendario(fechaIni, fechaIni, motivo, "Pendiente", dniUser, "00000000A");
			cal.insertCalendario(calendario);
			request.setAttribute("dni", dniUser);
			request.setAttribute("dialibre", true);
			request.getRequestDispatcher("menu.jsp").forward(request, response);		
		}
		else if (request.getParameter("horaslibres") != null) {
			String fecha = request.getParameter("FechaIni");
			String horaIni = request.getParameter("horaIni");
			String horaFin = request.getParameter("horaFin");
			String dniUser = request.getParameter("dni");
			String motivo = request.getParameter("motivo");
			String fechaIni = fecha + " " + horaIni;
			String fechaFin = fecha + " " + horaFin;
			Calendario calendario = new Calendario(fechaIni, fechaFin, motivo, "Pendiente", dniUser, "00000000A");
			cal.insertCalendario(calendario);
			request.setAttribute("dni", dniUser);
			request.setAttribute("dialibre", true);
			request.getRequestDispatcher("menu.jsp").forward(request, response);		
		}
		else if (request.getParameter("vacaciones") != null) {
			String fechaIni = request.getParameter("FechaIni");
			String fechaFin = request.getParameter("FechaFin");
			String dniUser = request.getParameter("dni");
			Calendario calendario = new Calendario(fechaIni, fechaFin, "Vacaciones", "Pendiente", dniUser, "00000000A");
			cal.insertCalendario(calendario);
			request.setAttribute("dni", dniUser);
			request.setAttribute("dialibre", true);
			request.getRequestDispatcher("menu.jsp").forward(request, response);		
		} else {
			System.out.println("Error");
		}
		
	}

}