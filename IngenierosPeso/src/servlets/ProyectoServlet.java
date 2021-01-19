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
		
		String id = (String) request.getParameter("idpro");
		int idpro = Integer.parseInt(id);
		
		if(action.equals("elimina")) {	
			proyDao.deleteProyecto(idpro);
			request.getRequestDispatcher("editaproyectos.jsp").forward(request, response);
		} else if(action.equals("editar")) {
			String titulo = (String) request.getParameter("titulo");
			String desc = (String) request.getParameter("desc");
			String fini = (String) request.getParameter("fi");
			String ffin = (String) request.getParameter("fn");
			
			System.out.println(titulo);
			
			Proyecto pro = new Proyecto(idpro,titulo,fini,ffin,desc);
			proyDao.updateProyectos(pro);
			request.getRequestDispatcher("editaproyectos.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		ProyectoDao proyDao = new ProyectoDao();
		
		
        if(action.equals("alta")) {
        	String Titulo = (String) request.getParameter("Titulo");
    		String FIni = (String) request.getParameter("FI");
    		String FFin = (String) request.getParameter("FF");
    		String Descr = (String) request.getParameter("Descr");
    		
			Proyecto proyec = new Proyecto(Titulo,FIni,FFin,Descr);
			proyDao.addProyecto(proyec);
            request.getRequestDispatcher("gestionproyectos.jsp").forward(request, response);
            
		} else if(action.equals("fichar")) {
			String tmp = request.getParameter("idProy");
	        String aux = request.getParameter("horasDedicadas");	
	        int horasDedicadas = Integer.parseInt(aux), idProy = Integer.parseInt(tmp);
	        String dni = (String) request.getParameter("dni");
	        proyDao.updateHoras(dni, idProy, horasDedicadas);
	        request.setAttribute("dni", dni); 
	        request.getRequestDispatcher("/ficharHoras.jsp").forward(request, response);
		}
        
	}

}
