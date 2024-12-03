package database;

import java.util.Properties;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    private String url;
    private String username;
    private String passwd;
    private Connection connection;

    public ConnectionFactory() {
        try (FileInputStream fis = new FileInputStream("application.properties")) {
            Properties properties = new Properties();
            properties.load(fis);
            this.url = properties.getProperty("db.url");
            this.username = properties.getProperty("db.username");
            this.passwd = properties.getProperty("db.password");

            if (url == null || username == null || passwd == null) {
                throw new IllegalArgumentException("Missing required database configuration properties.");
            }
        } catch (IOException e) {
            System.err.println("Failed to load database config: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            System.err.println("Configuration error: " + e.getMessage());
        }
    }

    public String getName() {
        return this.username;
    }

    public String getUrl() {
        return this.url;
    }

    public String getPass() {
        return this.passwd;
    }

    public Connection createConnection() {
        try {
            this.connection = DriverManager.getConnection(this.url, this.username, this.passwd);
        } catch (SQLException e) {
            System.err.println("Failed to create connection: " + e.getMessage());
        }
        return this.connection;
    }

    public void closeConnection() {
        try {
            if (this.connection != null && !this.connection.isClosed()) {
                this.connection.close();
            }
        } catch (SQLException e) {
            System.err.println("Failed to close connection: " + e.getMessage());
        }
    }
}
