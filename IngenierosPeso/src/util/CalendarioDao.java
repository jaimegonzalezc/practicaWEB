package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import clases.Calendario;
import clases.Proyecto;

public class CalendarioDao {

	private Connection connection;

	public CalendarioDao() {
		connection = DbUtil.getConnection();
	}

	public Calendario getCalendario(String userId) {
		PreparedStatement preparedStatement = null;
		String fechaI, fechaF, descripcion, estado;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM mydb.Usuarios where DNI = '" + userId + "';");
			while (rs.next()) {
				fechaI = rs.getString("FechaIni");
				fechaF = rs.getString("FechaFin");
				descripcion = rs.getString("Descripcion");
				estado = rs.getString("Estado");
				Calendario calendario = new Calendario(fechaI, fechaF, descripcion, estado, userId, "");
				return calendario;
			}
		} catch (SQLException e) {
		}
		return null;
	}
	
	public ArrayList<Calendario> listCalendario(String dniUsuario) {
		ArrayList<Calendario> lista = new ArrayList<Calendario>();
		String fechaIni, fechaFin, descripcion, estado, dniRH;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM mydb.Calendario WHERE Empleado_Usuarios_DNI = '" + dniUsuario +"';");
			while (rs.next()) {
				fechaIni = rs.getString("FechaIni");
				fechaFin = rs.getString("FechaFin");
				descripcion = rs.getString("Descripcion");
				estado = rs.getString("Estado");
				dniRH = rs.getString("Recursos_humanos_Usuarios_DNI");
				Calendario calendario = new Calendario(fechaIni, fechaFin, descripcion, estado, dniUsuario, dniRH);
				lista.add(calendario);
			}
			return lista;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

}
