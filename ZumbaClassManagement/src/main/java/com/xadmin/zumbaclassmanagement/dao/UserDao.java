package com.xadmin.zumbaclassmanagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xadmin.zumbaclassmanagement.bean.User;

public class UserDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root@123";
    private String jdbcDriver = "com.mysql.cj.jdbc.Driver";

    private static final String INSERT_USERS_SQL = "INSERT INTO users VALUES " + " (?, ?, ?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country,timing from users where id =?;";
    private static final String SELECT_USER_BY_TIMING = "select id,name,email,country,timing from users where timing =?;";
    private static final String SELECT_ALL_USERS = "select * from users;";
    private static final String DELETE_USERS_SQL = "delete from users where id =?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?, email = ?, country = ?, timing = ? where id = ?;";

    public UserDao() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            System.out.println("Connecting to database...");
            System.out.println("JDBC URL: " + jdbcURL);
            System.out.println("Username: " + jdbcUsername);
            
            Class.forName(jdbcDriver);
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("Connection successful!");
        } catch (SQLException e) {
            System.out.println("Connection failed. SQLException: " + e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC driver not found. ClassNotFoundException: " + e.getMessage());
            e.printStackTrace();
        }
        return connection;
    }
    

    // Insert user method
    public void insertUser(User user) {
        System.out.println(INSERT_USERS_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
        	preparedStatement.setInt(1,user.getId());
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getCountry());
            preparedStatement.setString(5, user.getTiming());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }


    // Selecting User by ID
    public User selectUserById(int id) {
        User user = null;
        // Establishing a connection
        try (Connection connection = getConnection();
             // Create a statement using the connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Process the ResultSet object
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                String timing = rs.getString("timing");
                user = new User(id, name, email, country, timing);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    // Selecting user by timings
    public User selectUserByTiming(String timing) {
        User user = null;
        // Establishing a connection
        try (Connection connection = getConnection();
             // Create a statement using the connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_TIMING)) {
            preparedStatement.setString(1, timing);
            System.out.println(preparedStatement);
            // Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Process the ResultSet object
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                String timing1 = rs.getString("timing");
                user = new User(id, name, email, country, timing1);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }


    // Selecting all users
    public List<User> selectAllUsers() {

        List<User> users = new ArrayList<>();
        // Establish a connection
        try (Connection connection = getConnection();
             // Create a statement using the connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            System.out.println(preparedStatement);
            // Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Process the ResultSet object
            while (rs.next()) {
            	int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                String timing = rs.getString("timing");
                users.add(new User(id, name, email, country, timing));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }


    // updating a user
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL)) {
            System.out.println("Updated User: " + statement);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setString(4, user.getTiming());
            statement.setInt(5, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }


    // Deleting a User
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }

    }


}
