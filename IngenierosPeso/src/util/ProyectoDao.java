package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import clases.Proyecto;

public class ProyectoDao {

	private Connection connection;

	public ProyectoDao() {
		connection = DbUtil.getConnection();
	}

	public ArrayList<Proyecto> listProyectos(String dniUsuario) {
		ArrayList<Proyecto> lista = new ArrayList<Proyecto>();
		int idProy;
		String fechaIni, fechaFin, descripcion;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM mydb.Poyectos \n"
					+ "INNER JOIN mydb.Empleados_estan_proyectos ON mydb.Empleados_estan_proyectos.Poyectos_idPoyectos = mydb.Poyectos.idPoyectos\n"
					+ "where mydb.Empleados_estan_proyectos.Empleados_Trabajadores_DNI = '" + dniUsuario + "';");
			while (rs.next()) {
				idProy = rs.getInt("Poyectos_idPoyectos");
				fechaIni = rs.getString("FechaIni");
				fechaFin = rs.getString("FechaFin");
				descripcion = rs.getString("Descripcion");
				Proyecto proyecto = new Proyecto(idProy, fechaIni, fechaFin, descripcion);
				lista.add(proyecto);
			}
			return lista;
		} catch (SQLException e) {
		}
		return null;
	}

	public int getHorasProy(String dniUsuario, int idProy) {
		int horas = 0;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement
					.executeQuery("SELECT * FROM mydb.Empleados_estan_proyectos WHERE Poyectos_idPoyectos = " + idProy
							+ " AND Empleados_Trabajadores_DNI = '" + dniUsuario + "';");
			while (rs.next()) {
				horas = rs.getInt("Horas");
				return horas;
			}
		} catch (SQLException e) {
		}
		return 0;
	}

	public Proyecto getProyecto(int idProy) {
		String fechaI, fechaF, desc;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM mydb.Proyectos where idProyectos = '" + idProy + "';");
			while (rs.next()) {
				fechaI = rs.getString("FechaIni");
				fechaF = rs.getString("FechaFin");
				desc = rs.getString("Descripcion");
				Proyecto proyecto = new Proyecto(idProy, fechaI, fechaF, desc);
				return proyecto;
			}
		} catch (SQLException e) {
		}
		return null;
	}
	
	public void updateHoras (String dniEmpleado, String idProy, int horas) {
		int horasAnteriores;
		try {
			Statement statement = connection.createStatement();
			System.out.println(dniEmpleado);
			System.out.println(idProy);
			System.out.println(horas);
			ResultSet rs = statement.executeQuery("UPDATE mydb.Empleados_estan_proyectos SET Horas = Horas + " + 
			horas + "WHERE (Poyectos_idPoyectos = " + idProy + ") and (Empleados_Trabajadores_DNI = '" + dniEmpleado + "');");
		} catch (SQLException e) {
			System.out.println("Cagada shurmano");
		}
	}

}