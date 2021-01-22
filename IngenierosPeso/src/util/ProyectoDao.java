package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

	public void addProyecto(Proyecto proyecto, String cif, int id) {
		try {
			PreparedStatement preparedStatement1 = connection.prepareStatement(
					"insert into mydb.Proyectos (idProyectos, Titulo,Descripcion,FechaIni,FechaFin) values (?,?,?,?,?)");
			PreparedStatement preparedStatement2 = connection.prepareStatement(
					"insert into mydb.Empresa_tiene_proyectos (Proyectos_idProyectos,Empresa_CIF) values (?,?)");
			
			preparedStatement1.setInt(1, id);
			preparedStatement1.setString(2, proyecto.getTitulo());
			preparedStatement1.setString(3, proyecto.getDescripcion());
			preparedStatement1.setString(4, proyecto.getFechaIni());
			preparedStatement1.setString(5, proyecto.getFechaFin());
			preparedStatement1.executeUpdate();
			preparedStatement1.close();
			
			preparedStatement2.setInt(1, id);
			preparedStatement2.setString(2, cif);
			preparedStatement2.executeUpdate();
			preparedStatement2.close();
			
		} catch (SQLException e) {
			
			System.out.println(e.getMessage());

		}
	}
	
	public ArrayList<Proyecto> listProyectos(String dniUsuario) {
		ArrayList<Proyecto> lista = new ArrayList<Proyecto>();
		
		int idProy;
		String titulo, fechaIni, fechaFin, descripcion;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM mydb.Proyectos \n"
					+ "INNER JOIN mydb.Empleados_estan_proyectos ON mydb.Empleados_estan_proyectos.Proyectos_idProyectos = mydb.Proyectos.idProyectos\n"
					+ "where mydb.Empleados_estan_proyectos.Empleados_Trabajadores_DNI = '" + dniUsuario + "';");
			while (rs.next()) {
				idProy = rs.getInt("Proyectos_idProyectos");
				titulo = rs.getString("Titulo");
				fechaIni = rs.getString("FechaIni");
				fechaFin = rs.getString("FechaFin");
				descripcion = rs.getString("Descripcion");
				Proyecto proyecto = new Proyecto(idProy, titulo, fechaIni, fechaFin, descripcion);
				lista.add(proyecto);
			}
			return lista;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public ArrayList<Proyecto> getTodosProyectos() {
		ArrayList<Proyecto> lista = new ArrayList<Proyecto>();
		int idProy;
		String titulo, fechaIni, fechaFin, descripcion;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM mydb.Proyectos;");
			while (rs.next()) {
				idProy = rs.getInt("idProyectos");
				titulo = rs.getString("Titulo");
				fechaIni = rs.getString("FechaIni");
				fechaFin = rs.getString("FechaFin");
				descripcion = rs.getString("Descripcion");
				Proyecto proyecto = new Proyecto(idProy, titulo, fechaIni, fechaFin, descripcion);
				lista.add(proyecto);
			}
			return lista;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	public int getHorasProy(String dniUsuario, int idProy) {
		int horas = 0;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement
					.executeQuery("SELECT * FROM mydb.Empleados_estan_proyectos WHERE Proyectos_idProyectos = " + idProy
							+ " AND Empleados_Trabajadores_DNI = '" + dniUsuario + "';");
			while (rs.next()) {
				horas = rs.getInt("Horas");
				return horas;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return 0;
	}

	public Proyecto getProyecto(int idProy) {
		String titulo,fechaI, fechaF, desc;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM mydb.Proyectos where idProyectos = '" + idProy + "';");
			while (rs.next()) {
				fechaI = rs.getString("FechaIni");
				titulo = rs.getString("Titulo");
				fechaF = rs.getString("FechaFin");
				desc = rs.getString("Descripcion");
				Proyecto proyecto = new Proyecto(idProy,titulo, fechaI, fechaF, desc);
				return proyecto;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public void updateProyectos(Proyecto pro) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"update mydb.Proyectos set Titulo=?,Descripcion=?,FechaIni=?,FechaFin=?  where idProyectos=?");
			preparedStatement.setString(1, pro.getTitulo());
			preparedStatement.setString(2, pro.getDescripcion());
			preparedStatement.setString(3, pro.getFechaIni());
			preparedStatement.setString(4, pro.getFechaFin());
			preparedStatement.setInt(5, pro.getIdProyecto());
			preparedStatement.executeUpdate();
			preparedStatement.close();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void updateHoras(String dniEmpleado, int idProy, int horas) {

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"UPDATE mydb.Empleados_estan_proyectos SET Horas = Horas + " + horas
					+ " WHERE Proyectos_idProyectos = " + idProy + " and Empleados_Trabajadores_DNI = '" + dniEmpleado
					+ "';");
			//preparedStatement.setInt(1, horas);
			//preparedStatement.setInt(2, idProy);
			//preparedStatement.setString(3, dniEmpleado);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void deleteProyecto(int idProyect) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("delete from mydb.Proyectos where idProyectos=?");
			// Parameters start with 1  
			preparedStatement.setInt(1, idProyect);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	public void actualiza() {
		
	}
	
}