package servlets;

import java.io.IOException;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clases.Calendario;
import util.CalendarioDao;
import util.DbUtil;

@WebServlet("/CalendarioServlet")
public class CalendarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger log = Logger.getLogger(DbUtil.class);

	public CalendarioServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String dni = (String) request.getParameter("dni");
		request.setAttribute("dni", dni);

		if (action.equals("getcalendario")) {
			request.getRequestDispatcher("consultarCalendario.jsp").forward(request, response);
		}
		else if (action.equals("diaslibres")) {
			request.getRequestDispatcher("diasLibres.jsp").forward(request, response);
		}
		else if (action.equals("horaslibres")) {
			request.getRequestDispatcher("horasLibres.jsp").forward(request, response);
		}
		else if (action.equals("vacaciones")) {
			request.getRequestDispatcher("vacaciones.jsp").forward(request, response);
		} else {
			log.error("Error de calendario.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CalendarioDao cal = new CalendarioDao();
		if (request.getParameter("dialibre") != null) {
			String fechaIni = request.getParameter("FechaIni");
			String dniUser = request.getParameter("dni");
			String motivo = request.getParameter("motivo");
			Calendario calendario = new Calendario(fechaIni, fechaIni, motivo, "Pendiente", dniUser, null);
			cal.insertCalendario(calendario);
			request.setAttribute("dni", dniUser);
			request.setAttribute("dialibre", true);
			request.getRequestDispatcher("menu.jsp").forward(request, response);
			log.info("Usuario "+dniUser+" pide dia libre.");
		}
		else if (request.getParameter("horaslibres") != null) {
			String fecha = request.getParameter("FechaIni");
			String horaIni = request.getParameter("horaIni");
			String horaFin = request.getParameter("horaFin");
			String dniUser = request.getParameter("dni");
			String motivo = request.getParameter("motivo");
			String fechaIni = fecha + " " + horaIni;
			String fechaFin = fecha + " " + horaFin;
			Calendario calendario = new Calendario(fechaIni, fechaFin, motivo, "Pendiente", dniUser, null);
			cal.insertCalendario(calendario);
			request.setAttribute("dni", dniUser);
			request.setAttribute("dialibre", true);
			request.getRequestDispatcher("menu.jsp").forward(request, response);
			log.info("Usuario "+dniUser+" pide horas libres.");
		}
		else if (request.getParameter("vacaciones") != null) {
			String fechaIni = request.getParameter("FechaIni");
			String fechaFin = request.getParameter("FechaFin");
			String dniUser = request.getParameter("dni");
			Calendario calendario = new Calendario(fechaIni, fechaFin, "Vacaciones", "Pendiente", dniUser, null);
			cal.insertCalendario(calendario);
			request.setAttribute("dni", dniUser);
			request.setAttribute("dialibre", true);
			request.getRequestDispatcher("menu.jsp").forward(request, response);
			log.info("Usuario "+dniUser+" pide vacaciones.");
		} else {
			log.error("Error al procesar pedida de calendario.");
		}
		
	}

}