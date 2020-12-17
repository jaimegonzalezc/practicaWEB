package com.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.company.User;

public class UserDao {

    private Connection connection;

    public UserDao() {
        connection = DbUtil.getConnection();
    }

    public void addUser(User user) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into Usuarios(DNI,Nombre,Apellido,Telefono,Correo,Contraseña,Departamento) values (?, ?, ?, ?, ?, ?, ?)");
// Parameters start with 1
            preparedStatement.setString(1, user.getDNI());
            preparedStatement.setString(2, user.getNombre());
            preparedStatement.setString(3, user.getApellidos());
            preparedStatement.setInt(4, user.getNumero());
            preparedStatement.setString(5, user.getCorreo());
            preparedStatement.setString(6, user.getContrasena());
            preparedStatement.setString(7, user.getDepartamento());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void deleteUser(int userId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from users where userid=?");
            // Parameters start with 1
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            Log.logdb.error("SQL Exception: " + e);
        }
    }

    public void updateUser(User user) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update users set firstname=?, lastname=?, email=?" + "where userid=?");
// Parameters start with 1
            preparedStatement.setString(1, user.getNombre());
            preparedStatement.setString(2, user.getApellidos());
            preparedStatement.setString(3, user.getCorreo());
            preparedStatement.setString(4, user.getDNI());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            Log.logdb.error("SQL Exception: " + e);
        }
    }

    /*
    public List<User> getAllUsers() {
        List<User> userdb = new ArrayList<User>();
        if (connection != null)
        {
            try {
                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery("select * from users;");
                while (rs.next()) {
                    User user = new User();
                    user.setDNI(rs.getString("userid"));
                    user.setNombre(rs.getString("firstname"));
                    user.setApellidos(rs.getString("lastname"));
                    user.setCorreo(rs.getString("email"));
                    userdb.add(user);
                }
            } catch (SQLException e) {
                Log.logdb.error("SQL Exception: " + e);
            }
            return userdb;
        }
        else
        {
            Log.logdb.error("No hay conexion con la bbdd");
            return null;
        }

    }

    public User getUserById(int userId) {
        User user = new User();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from users where userid=?");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                user.setUserid(rs.getInt("userid"));
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setDob(rs.getDate("dob"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            Log.logdb.error("SQL Exception: " + e);
        }
        return user;
    }
    */
}
