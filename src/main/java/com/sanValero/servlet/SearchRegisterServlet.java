package com.sanValero.servlet;

import com.sanValero.dao.Database;
import com.sanValero.dao.SubjectDAO;
import com.sanValero.domain.Subject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchProduct")
@MultipartConfig

public class SearchRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");



        String subject_name = "%" + request.getParameter("search") + "%";
        String teacher = "%" + request.getParameter("search") + "%";


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();


            List<Subject> products = Database.jdbi.withExtension(SubjectDAO.class, dao -> {
                return dao.searchSubjectByNameOrTeacher(subject_name, teacher);
            });



            request.setAttribute("products", products);
            request.getRequestDispatcher("searchProducts.jsp").forward(request, response);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
