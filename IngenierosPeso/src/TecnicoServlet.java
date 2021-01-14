

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TecnicoServlet")
public class TecnicoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TecnicoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		UserDao dao = new UserDao();
		String dni = (String) request.getParameter("dni");
		if (action.equals("getusuario")) {
			request.setAttribute("dni", dni); 
            request.getRequestDispatcher("/ficharHoras.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
