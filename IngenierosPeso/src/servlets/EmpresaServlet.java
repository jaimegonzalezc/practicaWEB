package servlets;


import clases.Empresa;
import util.EmpresaDao;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



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
		
		String cif = (String) request.getParameter("CIF");
		String nombre = (String) request.getParameter("nombre");
		String direccion = (String) request.getParameter("direccion");
		int cp = Integer.getInteger(request.getParameter("CP"));
		String ciudad = (String) request.getParameter("ciudad");
		String provincia = (String) request.getParameter("provincia");
		int telefono = Integer.getInteger(request.getParameter("telefono"));
		
		if (action.equals("alta")) {
			Empresa empresa = new Empresa(cif,nombre,direccion,cp,ciudad,provincia,telefono);
			dao.addEmpresa(empresa);
            request.getRequestDispatcher("gestionempresa.jsp").forward(request, response);
		} else if(action.equals("elimina")) {
			dao.deleteEmpresa(cif);
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
