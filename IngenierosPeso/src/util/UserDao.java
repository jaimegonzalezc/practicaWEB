package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.regex.Pattern;
import org.apache.log4j.Logger;

import clases.User;

public class UserDao {

	private Connection connection;
	static final Logger log = Logger.getLogger(DbUtil.class);

	public UserDao() {
		connection = DbUtil.getConnection();
	}

	public void addUser(User user) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"insert into Usuarios(DNI,Nombre,Apellido,Telefono,Correo,Contraseña,Departamento) values (?, ?, ?, ?, ?, ?, ?)");
// Parameters start with 1
			preparedStatement.setString(1, user.getDNI());
			preparedStatement.setString(2, user.getNombre());
			preparedStatement.setString(3, user.getApellidos());
			preparedStatement.setInt(4, user.getNumero());
			preparedStatement.setString(5, user.getCorreo());
			preparedStatement.setString(6, user.getContrasena());
			preparedStatement.setString(7, user.getDepartamento());
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			log.error(e.getMessage());
		}
	}

	public User getUser(String userId) {
		PreparedStatement preparedStatement = null;
		String dniDB, passwordDB, nombreDB, apellidoDB, correoDB, departamentoDB;
		int numeroDB;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM mydb.Usuarios where DNI = '" + userId + "';");
			while (rs.next()) {
				dniDB = rs.getString("DNI");
				nombreDB = rs.getString("Nombre");
				apellidoDB = rs.getString("Apellido");
				numeroDB = rs.getInt("Telefono");
				correoDB = rs.getString("Correo");
				passwordDB = rs.getString("Contraseña");
				departamentoDB = rs.getString("Departamento");
				User usuario = new User(dniDB, nombreDB, apellidoDB, correoDB, passwordDB, departamentoDB, numeroDB);
				return usuario;
			}
			rs.close();
		} catch (SQLException e) {
			log.error(e.getMessage());
		}
		return null;
	}

	public ArrayList<User> getTecnicos() {
		ArrayList<User> lista = new ArrayList<User>();
		String dniDB, passwordDB, nombreDB, apellidoDB, correoDB, departamentoDB;
		int numeroDB;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM mydb.Usuarios where Departamento='Tecnico';");
			while (rs.next()) {
				dniDB = rs.getString("DNI");
				nombreDB = rs.getString("Nombre");
				apellidoDB = rs.getString("Apellido");
				numeroDB = rs.getInt("Telefono");
				correoDB = rs.getString("Correo");
				passwordDB = rs.getString("Contraseña");
				departamentoDB = rs.getString("Departamento");
				User usuario = new User(dniDB, nombreDB, apellidoDB, correoDB, passwordDB, departamentoDB, numeroDB);
				lista.add(usuario);
			}
			rs.close();
		} catch (SQLException e) {
			log.error(e.getMessage());
		}
		return lista;
	}
	
	public void deleteUser(String dni) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("delete from mydb.Usuarios where DNI=?");
			// Parameters start with 1
			preparedStatement.setString(1, dni);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			log.error(e.getMessage());
		}
	}

	public String logInAuthentication(String userId, String pswd) {
		PreparedStatement preparedStatement = null;
		String dniDB = "";
		String passwordDB = "";
		String depart ="";
		try {

			Statement statement = connection.createStatement();
			String dniRegexp = "\\d{8}[A-HJ-NP-TV-Z]"; // Prevencion simple de SQL Injection
			if (Pattern.matches(dniRegexp, userId)) {
				ResultSet rs = statement.executeQuery("SELECT * FROM mydb.Usuarios where DNI = '" + userId + "';");
				while (rs.next()) {
					dniDB = rs.getString("DNI");
					passwordDB = rs.getString("Contraseña");
					depart = rs.getString("Departamento");
					
				}
				rs.close();
			}
			if (pswd.equals(passwordDB)) {
				if(depart.equals("Recursos Humanos")) {
					return "RRHH";
				} else {
					return "TEC";
				}
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return "Credenciales erróneas";
	}
	
	
	public void updateUser(User user) {
		try {
			String dni = user.getDNI();
			String nom = user.getNombre();
			String ape = user.getApellidos();
			int tlf = user.getNumero();
			String correo = user.getCorreo();
			
			System.out.println(correo);
			
			PreparedStatement ps = connection.prepareStatement("update mydb.Usuarios set Nombre=?,Apellido=?,Telefono=?,Correo=? where DNI=?");

			ps.setString(1, nom);
			ps.setString(2, ape);
			ps.setInt(3, tlf);
			ps.setString(4, correo);
			ps.setString(5, dni);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			log.error(e.getMessage());
		}
	}
}
