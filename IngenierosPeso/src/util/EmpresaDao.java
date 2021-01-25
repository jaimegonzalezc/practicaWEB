package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import org.apache.log4j.Logger;

import clases.Empresa;

public class EmpresaDao {

	private Connection connection;
	static final Logger log = Logger.getLogger(DbUtil.class);

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
			log.error(e.getMessage());
		}
	}

	public Empresa getEmpresa(String empresaId) {
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
		rs.close();
		} catch (SQLException e) {
			log.error(e.getMessage());
		}
		return null;
	}
	
	public boolean actualizaEmpresa(Empresa empr) {
		try {
			String cif = empr.getCIF();
			String nom = empr.getNombre();
			String dir = empr.getDireccion();
			int cp = empr.getCP();
			String ciu = empr.getCiudad();
			String prov = empr.getProvincia();
			int number= empr.getNumero();
			
			String sql = "UPDATE mydb.Empresa set CIF=?,Nombre=?,Direccion=?,CP=?,Ciudad=?,Provincia=?,Telefono=? WHERE CIF=?";
			
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, cif);
			ps.setString(2, nom);
			ps.setString(3, dir);
			ps.setInt(4, cp);
			ps.setString(5, ciu);
			ps.setString(6, prov);
			ps.setInt(7, number);
			ps.setString(8, cif);
							
			ps.executeUpdate();
			
			ps.close();
			System.out.println("HOLA");
			return true;
		} catch (SQLException e) {
			log.error(e.getMessage());
		}
		return false;
	}
	
	public ArrayList<Empresa> getTodasEmpresas() {
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
			rs.close();
		} catch (SQLException e) {
			log.error(e.getMessage());
		}

		return empr;
	}

	public void deleteEmpresa(String empresaId) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("delete from Empresa where CIF=?");
			// Parameters start with 1
			preparedStatement.setString(1, empresaId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			log.error(e.getMessage());
		}
	}

}
