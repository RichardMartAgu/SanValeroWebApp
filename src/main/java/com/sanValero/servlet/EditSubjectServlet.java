package com.sanValero.servlet;

import com.sanValero.dao.Database;
import com.sanValero.dao.SubjectDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/edit-subject")
public class EditSubjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int idSubject = Integer.parseInt(request.getParameter("idSubject"));
        String subjecName = request.getParameter("subjectName");
        String subjectDescription = request.getParameter("subjectDescription");
        String subjectYear = request.getParameter("subjectYear");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String teacher = request.getParameter("teacher");


        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            Database.jdbi.withExtension(
                    SubjectDAO.class,
                    dao -> {
                        dao.editSubject( subjecName, subjectDescription, subjectYear, duration,teacher,idSubject);
                        return null;
                    });

            out.println(
                    "<div class='alert alert-success text-center' role='alert'>Subject successful edit </div>");

        } catch (ClassNotFoundException cnfe) {

            cnfe.printStackTrace();
        }
    }
}
