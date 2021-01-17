package servlets;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clases.Empresa;
import clases.Proyecto;
import util.ProyectoDao;

@WebServlet("/ProyectoServlet")
public class ProyectoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProyectoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		ProyectoDao proyDao = new ProyectoDao();
		
		//int idProy = Integer.getInteger(request.getParameter("id"));
		String FIni = (String) request.getParameter("FI");
		String FFin = (String) request.getParameter("FF");
		String Descr = (String) request.getParameter("Descr");
		
		if(action.equals("alta")) {
			
			Proyecto proyec = new Proyecto(22,FIni,FFin,Descr);
			proyDao.addProyecto(proyec);;
            request.getRequestDispatcher("gestionproyectos.jsp").forward(request, response);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
