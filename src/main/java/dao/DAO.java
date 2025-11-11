package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
    private static final String URL_JDBC = "jdbc:mysql://localhost:3306/garaman";
    private static final String URL_USER = "root";
    private static final String URL_PASS = "12345";

    protected Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public DAO() {
        try {
            if(connection == null || connection.isClosed()) {
                connection = DriverManager.getConnection(URL_JDBC, URL_USER, URL_PASS);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
