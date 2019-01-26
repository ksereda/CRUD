package com.crud.controller;

import com.crud.dao.UserDao;
import com.crud.dao.impl.UserDaoImpl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/user/delete")
public class DeleteUserController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public DeleteUserController() {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userId = request.getParameter("id");

        if (userId == "" || userId == null) {
            request.getRequestDispatcher("/").forward(request, response);
        } else {
            Long id = Long.parseLong(userId);
            UserDao userDao = UserDaoImpl.getInstance();

            userDao.deleteUser(id);

            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}