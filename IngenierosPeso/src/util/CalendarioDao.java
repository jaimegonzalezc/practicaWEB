package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import org.apache.log4j.Logger;

import clases.Calendario;

public class CalendarioDao {

	private Connection connection;
	static final Logger log = Logger.getLogger(DbUtil.class);

	public CalendarioDao() {
		connection = DbUtil.getConnection();
	}

	public Calendario getCalendario(String userId) {
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
			log.error(e.getMessage());
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
			rs.close();
			return lista;
		} catch (SQLException e) {
			log.error(e.getMessage());
		}
		return null;
	}
	
	public void insertCalendario(Calendario calendario) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO Calendario(FechaIni,FechaFin,Descripcion,Estado,Empleado_Usuarios_DNI,Recursos_humanos_Usuarios_DNI) VALUES (?, ?, ?, ?, ?, ?)");
// Parameters start with 1
			preparedStatement.setString(1, calendario.getFechaIni());
			preparedStatement.setString(2, calendario.getFechaFin());
			preparedStatement.setString(3, calendario.getDescripcion());
			preparedStatement.setString(4, calendario.getEstado());
			preparedStatement.setString(5, calendario.getDniEmp());
			preparedStatement.setString(6, calendario.getDniRh());
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			log.error(e.getMessage());
		}
	}

}
