import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {

    private static Connection connection = null;

    public static Connection getConnection() {

        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://82.158.11.198:3306/mydb";
        String user = "newuser";
        String password = "1234567890";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            connection = DriverManager.getConnection(url, user, password);
            System.out.println("Conectado");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            System.out.println("Error de conexión");
        }
        return connection;
    }
}
