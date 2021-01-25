package servlets;


import clases.Empresa;
import util.DbUtil;
import util.EmpresaDao;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;



/**
 * Servlet implementation class logoutServlet
 */
@WebServlet("/Empresa")
public class EmpresaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger log = Logger.getLogger(DbUtil.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpresaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");
		EmpresaDao dao = new EmpresaDao();
		
		String cif = (String) request.getParameter("CIF");

		
		if (action.equals("alta")) {
			try{
				String nombre = (String) request.getParameter("nombre");
				String direccion = (String) request.getParameter("direccion");
				int cp = Integer.parseInt(request.getParameter("CP"));
				String ciudad = (String) request.getParameter("ciudad");
				String provincia = (String) request.getParameter("provincia");
				int telefono = Integer.parseInt(request.getParameter("telefono"));
				Empresa empresa = new Empresa(cif,nombre,direccion,cp,ciudad,provincia,telefono);
				dao.addEmpresa(empresa);
				request.getRequestDispatcher("gestionempresa.jsp").forward(request, response);
				log.info("Dada de alta una nueva empresa.");
			} catch(Exception e) {
				response.sendRedirect(response.encodeRedirectURL("eAlta.html"));
				log.error(e.getMessage());
			}
		} else if(action.equals("elimina")) {
			try{
				dao.deleteEmpresa(cif);
				request.getRequestDispatcher("editaempresa.jsp").forward(request, response);
				log.info("Eliminada empresa "+cif);
			}catch(Exception e) {
				response.sendRedirect(response.encodeRedirectURL("eAlta.html"));
				log.error(e.getMessage());
			}
		} else if(action.equals("editar")) {
			try {
				String nombre = (String) request.getParameter("nombre");
				String direccion = (String) request.getParameter("direccion");
				int cp = Integer.parseInt(request.getParameter("CP"));
				String ciudad = (String) request.getParameter("ciudad");
				String provincia = (String) request.getParameter("provincia");
				int telefono = Integer.parseInt(request.getParameter("telefono"));
				Empresa empr = new Empresa(cif,nombre,direccion,cp,ciudad,provincia,telefono);
				dao.actualizaEmpresa(empr);
				request.getRequestDispatcher("editaempresa.jsp").forward(request, response);
				log.info("Han editado la empresa "+cif);
			} catch (Exception e) {
				response.sendRedirect(response.encodeRedirectURL("eAlta.html"));
				log.error(e.getMessage());
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
