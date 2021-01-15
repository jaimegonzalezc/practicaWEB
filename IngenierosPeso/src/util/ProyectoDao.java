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
		System.out.println("holas");
		connection = DbUtil.getConnection();
	}

	public ArrayList<Proyecto> listProyectos(String dniUsuario) {
		ArrayList<Proyecto> lista = new ArrayList<Proyecto>();
		int idProy;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement
					.executeQuery("SELECT * FROM mydb.Empleados_estan_proyectos where Empleados_Trabajadores_DNI = '"
							+ dniUsuario + "';");
			while (rs.next()) {
				idProy = rs.getInt("Poyectos_idPoyectos");
				Proyecto proyecto = getProyecto(idProy);
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
			ResultSet rs = statement.executeQuery("SELECT * FROM mydb.Empleados_estan_proyectos WHERE Poyectos_idPoyectos = " + idProy + " AND Empleados_Trabajadores_DNI = '" + dniUsuario + "';");
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

}