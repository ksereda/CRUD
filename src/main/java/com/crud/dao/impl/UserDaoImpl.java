package com.crud.dao.impl;

import com.crud.dao.UserDao;
import com.crud.db.Database;
import com.crud.domain.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class UserDaoImpl implements UserDao {

    private static UserDaoImpl customerDaoImpl = null;

    private Connection connection = Database.getConnection();

    public long saveUser(User user) {

        String sql = "INSERT INTO users (name, password, login) VALUES(?,?,?)";

        long id = 0;

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getLogin());

            if (pstmt.executeUpdate() > 0) {
                ResultSet rs = pstmt.getGeneratedKeys();

                if (rs.next()) {
                    id = rs.getLong(1);
                }

            }
        } catch (Exception e) {
            e.getMessage();
        }

        return id;

    }

    public void updateUser(User user) {

        String sql = "UPDATE users SET name=?, password=?, login=? WHERE id=?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getLogin());
            pstmt.setLong(4, user.getId());
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.getMessage();
        }

    }

    public void deleteUser(Long id) {

        String sql = "DELETE FROM users WHERE id=?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setLong(1, id);
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.getMessage();
        }

    }

    public User findUserById(Long id) {

        String sql = "SELECT * FROM users WHERE id=?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setLong(1, id);
            ResultSet resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getLong(1));
                user.setName(resultSet.getString(2));
                user.setPassword(resultSet.getString(3));
                user.setLogin(resultSet.getString(4));

                return user;
            }

        } catch (Exception e) {
            e.getMessage();
        }

        return null;

    }

    public List<User> findAllUsers() {

        String sql = "SELECT * FROM users";

        List<User> users = null;

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {

                if (users == null)
                    users = new ArrayList<>();

                User user = new User();
                user.setId(resultSet.getLong(1));
                user.setName(resultSet.getString(2));
                user.setPassword(resultSet.getString(3));
                user.setLogin(resultSet.getString(4));

                users.add(user);
            }

        } catch (Exception e) {
            e.getMessage();
        }

        return users;

    }

    public static UserDao getInstance() {

        if (customerDaoImpl == null) {
            customerDaoImpl = new UserDaoImpl();
        }

        return customerDaoImpl;

    }
}