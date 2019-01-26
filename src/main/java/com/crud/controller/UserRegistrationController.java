package com.crud.controller;

import com.crud.dao.UserDao;
import com.crud.dao.impl.UserDaoImpl;
import com.crud.domain.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/register")
public class UserRegistrationController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDao userDao = UserDaoImpl.getInstance();

    public UserRegistrationController() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userId = request.getParameter("id");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String login = request.getParameter("login");

        User user = new User(name, password, login);

        if (userId == null || userId == "") {
            userDao.saveUser(user);
        } else {
            Long id = Long.parseLong(userId);
            user.setId(id);
            userDao.updateUser(user);
        }

        response.sendRedirect(request.getContextPath() + "/");
    }

}