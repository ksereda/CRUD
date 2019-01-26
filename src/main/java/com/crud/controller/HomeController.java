package com.crud.controller;

import com.crud.dao.UserDao;
import com.crud.dao.impl.UserDaoImpl;
import com.crud.domain.User;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/")
public class HomeController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDao userDao = UserDaoImpl.getInstance();

    public HomeController() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<User> users = userDao.findAllUsers();
        request.setAttribute("customerList", users);
        request.getRequestDispatcher("home.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);

    }

}