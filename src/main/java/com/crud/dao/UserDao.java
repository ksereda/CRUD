package com.crud.dao;

import com.crud.domain.User;
import java.util.List;

public interface UserDao {

    long saveUser(User user);

    void updateUser(User user);

    void deleteUser(Long id);

    User findUserById(Long id);

    List<User> findAllUsers();

}