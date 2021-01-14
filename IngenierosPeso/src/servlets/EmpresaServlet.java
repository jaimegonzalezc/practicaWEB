package servlets;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clases.Empresa;
import util.EmpresaDao;

/**
 * Servlet implementation class logoutServlet
 */
@WebServlet("/Empresa")
public class EmpresaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		
		if (action.equals("alta")) {
			
			String cif = (String) request.getParameter("CIF");
			String nombre = (String) request.getParameter("nombre");
			String direccion = (String) request.getParameter("direccion");
			//int cp = (int) request.getParameter("CP").toString();
			int hola = 0;
			String ciudad = (String) request.getParameter("ciudad");
			String provincia = (String) request.getParameter("provincia");
			int pepe = 0;
			Empresa empresa = new Empresa(cif,nombre,direccion,hola,ciudad,provincia,pepe);
			dao.addEmpresa(empresa);
			request.setAttribute("cif", cif);
            request.getRequestDispatcher("empresas/gestionempresa.jsp").forward(request, response);
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
