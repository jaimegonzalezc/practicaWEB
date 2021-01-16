package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ProyectoDao;

@WebServlet("/ProyectoServlet")
public class ProyectoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProyectoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String idProy = request.getParameter("idProy");
        String aux = request.getParameter("horasDedicadas");	
        int horasDedicadas = Integer.parseInt(aux);
        String dni = (String) request.getAttribute("dni");
        ProyectoDao dao = new ProyectoDao();
        dao.updateHoras(dni, idProy, horasDedicadas);
        request.setAttribute("dni", dni); 
        request.getRequestDispatcher("/ficharHoras.jsp").forward(request, response);
	}

}
