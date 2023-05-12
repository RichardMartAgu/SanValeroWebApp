package com.sanValero.servlet;

import com.sanValero.DAO.Register_DAO;
import com.sanValero.DAO.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteBuy")
@MultipartConfig
public class DeleteRegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        int id = Integer.parseInt(request.getParameter("id"));


        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Database.jdbi.withExtension(Register_DAO.class, dao -> {
                dao.deleteRegister(id);
                return null;
            });

            String url = "registers.jsp";
            response.sendRedirect(url);
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
