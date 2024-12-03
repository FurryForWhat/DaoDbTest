package main;

import src.dao.UserDaoImpl;
import model.User;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        // Create an instance of UserDaoImpl to interact with the database
        UserDaoImpl userDao = new UserDaoImpl() {
            @Override
            public void setParameters(PreparedStatement preparedStatement, User user) {
                try {
                    // Set parameters for the insert statement
                    preparedStatement.setString(1, user.getName());
                    preparedStatement.setInt(2, user.getAge());
                    preparedStatement.setString(3, user.getEmail());
                    preparedStatement.setString(4, user.getFatherName());
                } catch (SQLException e) {
                    System.err.println("Error setting parameters: " + e.getMessage());
                }
            }
        };

        // Create a new user to be inserted
        User newUser = new User("Lin Lat Shwe Yi Toe", 23, "HateCity@gmail.com", "U Hla Toe");

        // Call the create method to insert the user into the database
        System.out.println("Inserting a new user into the database...");
        userDao.create(newUser);

        // Optionally, you can add more operations here, such as finding or deleting a user
        // Example: Fetch and display all users (if such a method exists in your DAO)
        // List<User> users = userDao.findAll();
        // users.forEach(System.out::println);
    }
}
