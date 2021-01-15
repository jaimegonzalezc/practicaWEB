package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import clases.Calendario;

public class CalendarioDao {

	private Connection connection;

	public CalendarioDao() {
		//connection = DbUtil.getConnection();
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

}
