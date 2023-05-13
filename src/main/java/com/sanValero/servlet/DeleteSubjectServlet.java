package com.sanValero.servlet;

import com.sanValero.dao.Database;
import com.sanValero.dao.RegisterDAO;
import com.sanValero.dao.SubjectDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/delete-subject")
public class DeleteSubjectServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int idSubject = Integer.parseInt(request.getParameter("idSubject"));
        System.out.println(idSubject);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Database.jdbi.withExtension(
                    RegisterDAO.class,
                    dao -> {
                        dao.deleteRegisterBySubject(idSubject);
                        return null;
                    });

            Database.jdbi.withExtension(
                    SubjectDAO.class,
                    dao -> {
                        dao.deleteSubject(idSubject);
                        return null;
                    });

            response.sendRedirect("list-subjects.jsp");

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
