package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;

public class DbUtil {
	
	static final Logger log = Logger.getLogger(DbUtil.class);
	
    private static Connection connection = null;

    public static Connection getConnection() {

        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/mydb";
        String user = "root";
        String password = "TOCA$mela1";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
        	
            connection = DriverManager.getConnection(url, user, password);
            log.info("conectado");
           
        } catch (SQLException throwables) {
            log.error(throwables.getMessage());
        }
        return connection;
    }
}
