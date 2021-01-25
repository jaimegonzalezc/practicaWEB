package servlets;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

import clases.Proyecto;
import util.DbUtil;
import util.ProyectoDao;


@WebServlet("/ProyectoServlet")
public class ProyectoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger log = Logger.getLogger(DbUtil.class);
	
	ProyectoDao proyDao = new ProyectoDao();

    public ProyectoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		String id = (String) request.getParameter("idpro");
		int idpro = Integer.parseInt(id);
		
		if(action.equals("elimina")) {	
			proyDao.deleteProyecto(idpro);
			request.getRequestDispatcher("editaproyectos.jsp").forward(request, response);
			log.info("Proyecto "+ id +" eliminado.");
		} else if(action.equals("editar")) {
			String titulo = (String) request.getParameter("titulo");
			String desc = (String) request.getParameter("desc");
			String fini = (String) request.getParameter("fi");
			String ffin = (String) request.getParameter("ff");
			
			Proyecto pro = new Proyecto(idpro,titulo,fini,ffin,desc);
			
			proyDao.updateProyectos(pro);
			request.getRequestDispatcher("editaproyectos.jsp").forward(request, response);
			log.info("Proyecto "+ id +" editado.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

        if(action.equals("alta")) {
        	String Titulo = (String) request.getParameter("Titulo");
    		String FIni = (String) request.getParameter("FI");
    		String FFin = (String) request.getParameter("FF");
    		String Descr = (String) request.getParameter("Descr");
    		String cif = (String) request.getParameter("CIF");
    		int tamaño = proyDao.getTodosProyectos().size();
			int ultpro = proyDao.getTodosProyectos().get(tamaño-1).getIdProyecto();
    		
			Proyecto proyec = new Proyecto(ultpro+1,Titulo,FIni,FFin,Descr);
			proyDao.addProyecto(proyec,cif,ultpro+1);
            request.getRequestDispatcher("gestionproyectos.jsp").forward(request, response);
            
            log.info("Nuevo proyecto.");
            
		} else if(action.equals("fichar")) {
			String tmp = request.getParameter("idProy");
	        String aux = request.getParameter("horasDedicadas");	
	        int horasDedicadas = Integer.parseInt(aux), idProy = Integer.parseInt(tmp);
	        String dni = (String) request.getParameter("dni");
	        proyDao.updateHoras(dni, idProy, horasDedicadas);
	        request.setAttribute("dni", dni); 
	        request.getRequestDispatcher("/ficharHoras.jsp").forward(request, response);
	        log.info("Fichadas horas del día anterior.");
		}
        
	}

}
