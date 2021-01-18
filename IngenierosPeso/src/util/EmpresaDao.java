package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.regex.Pattern;

import clases.Empresa;

public class EmpresaDao {

	private Connection connection;

	public EmpresaDao() {
		connection = DbUtil.getConnection();
	}

	public void addEmpresa(Empresa empresa) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"insert into mydb.Empresa (CIF,Nombre,Direccion,CP,Ciudad,Provincia,Telefono) values (?, ?, ?, ?, ?, ?, ?)");
// Parameters start with 1
			preparedStatement.setString(1, empresa.getCIF());
			preparedStatement.setString(2, empresa.getNombre());
			preparedStatement.setString(3, empresa.getDireccion());
			preparedStatement.setInt(4, empresa.getCP());
			preparedStatement.setString(5, empresa.getCiudad());
			preparedStatement.setString(6, empresa.getProvincia());
			preparedStatement.setInt(7, empresa.getNumero());
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {

		}
	}

	public Empresa getEmpresa(String empresaId) {
		PreparedStatement preparedStatement = null;
		String cifDB, nombreDB, direccionDB, ciudadDB, provinciaDB;
		int cpDB, numeroDB;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM mydb.Usuarios where DNI = '" + empresaId + "';");
			while (rs.next()) {
				cifDB = rs.getString("CIF");
				nombreDB = rs.getString("Nombre");
				cpDB = rs.getInt("CP");
				numeroDB = rs.getInt("Telefono");
				ciudadDB = rs.getString("Ciudad");
				provinciaDB = rs.getString("Provincia");
				direccionDB = rs.getString("Direccion");
				Empresa empresa = new Empresa(cifDB, nombreDB, direccionDB, cpDB, ciudadDB, provinciaDB, numeroDB);
				return empresa;
			}
		} catch (SQLException e) {
		}
		return null;
	}
	
	public boolean actualizaEmpresa(Empresa empr) {
		try {
			Statement statement = connection.createStatement();
			statement.executeQuery("UPDATE mydb.Empresa SET Telefono="+empr.getNumero()+" where CIF =" + empr.getCIF() + ";");
			
			/*String cif = empr.getCIF();
			String nom = empr.getNombre();
			String dir = empr.getDireccion();
			int cp = empr.getCP();
			String ciu = empr.getCiudad();
			String prov = empr.getProvincia();
			int number= empr.getNumero();
			
			System.out.println(cif);
			
			String sql = "UPDATE mydb.Empresa set CIF=?,Nombre=?,Direccion=?,CP=?,Ciudad=?,Provincia=?,Telefono=? WHERE CIF="+cif;
			
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, cif);
			ps.setString(2, nom);
			ps.setString(3, dir);
			ps.setInt(4, cp);
			ps.setString(5, ciu);
			ps.setString(6, prov);
			ps.setInt(7, number);
							
			boolean i = ps.executeUpdate()>0;
			
			if(i) {
				System.out.println("Si");
			} else {
				System.out.println("NO");
			}
			
			ps.close();
			System.out.println("HOLA");*/
			return true;
		} catch (SQLException e) {
		}
		return false;
	}
	
	public ArrayList<Empresa> getTodasEmpresas() {
		PreparedStatement preparedStatement = null;
		ArrayList<Empresa> empr = new ArrayList<Empresa>();
		String cifDB, nombreDB, direccionDB, ciudadDB, provinciaDB;
		int cpDB, numeroDB;
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM mydb.Empresa;");
			
			while (rs.next()) {
				cifDB = rs.getString("CIF");
				nombreDB = rs.getString("Nombre");
				direccionDB = rs.getString("Direccion");
				cpDB = rs.getInt("CP");
				ciudadDB = rs.getString("Ciudad");
				provinciaDB = rs.getString("Provincia");
				numeroDB = rs.getInt("Telefono");
				Empresa empresa = new Empresa(cifDB,nombreDB,direccionDB,cpDB,ciudadDB,provinciaDB,numeroDB);
				empr.add(empresa);
			}
		} catch (SQLException e) {
		}

		return empr;
	}

	public void deleteEmpresa(String empresaId) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("delete from Empresa where CIF=?");
			// Parameters start with 1
			preparedStatement.setString(1, empresaId);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
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
			}
			if (pswd.equals(passwordDB)) {
				if(depart.equals("Recursos Humanos")) {
					return "RRHH";
				} else {
					return "TEC";
				}
				
			}
		} catch (SQLException e) {
		}
		return "Credenciales erróneas";
	}
	/*
	 * public void updateUser(User user) { try { PreparedStatement preparedStatement
	 * = connection.
	 * prepareStatement("update users set firstname=?, lastname=?, email=?" +
	 * "where userid=?"); // Parameters start with 1 preparedStatement.setString(1,
	 * user.getNombre()); preparedStatement.setString(2, user.getApellidos());
	 * preparedStatement.setString(3, user.getCorreo());
	 * preparedStatement.setString(4, user.getDNI());
	 * preparedStatement.executeUpdate(); } catch (SQLException e) {
	 * Log.logdb.error("SQL Exception: " + e); } }
	 * 
	 * public List<User> getAllUsers() { List<User> userdb = new ArrayList<User>();
	 * if (connection != null) { try { Statement statement =
	 * connection.createStatement(); ResultSet rs =
	 * statement.executeQuery("select * from users;"); while (rs.next()) { User user
	 * = new User(); user.setDNI(rs.getString("userid"));
	 * user.setNombre(rs.getString("firstname"));
	 * user.setApellidos(rs.getString("lastname"));
	 * user.setCorreo(rs.getString("email")); userdb.add(user); } } catch
	 * (SQLException e) { Log.logdb.error("SQL Exception: " + e); } return userdb; }
	 * else { Log.logdb.error("No hay conexion con la bbdd"); return null; }
	 * 
	 * }
	 * 
	 * public User getUserById(int userId) { User user = new User(); try {
	 * PreparedStatement preparedStatement =
	 * connection.prepareStatement("select * from users where userid=?");
	 * preparedStatement.setInt(1, userId); ResultSet rs =
	 * preparedStatement.executeQuery(); if (rs.next()) {
	 * user.setUserid(rs.getInt("userid"));
	 * user.setFirstName(rs.getString("firstname"));
	 * user.setLastName(rs.getString("lastname")); user.setDob(rs.getDate("dob"));
	 * user.setEmail(rs.getString("email")); } } catch (SQLException e) {
	 * Log.logdb.error("SQL Exception: " + e); } return user; }
	 */

}
