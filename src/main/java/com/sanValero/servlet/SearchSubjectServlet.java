package com.sanValero.servlet;

import com.sanValero.dao.Database;
import com.sanValero.dao.StudentDAO;
import com.sanValero.dao.SubjectDAO;
import com.sanValero.domain.Student;
import com.sanValero.domain.Subject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchSubject")
@MultipartConfig

public class SearchSubjectServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");



        String subjectName = "%" + request.getParameter("search") + "%";
        String subjectTeacher = "%" + request.getParameter("search") + "%";
        String subjectDescription = "%" + request.getParameter("search") + "%";


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();


            List<Subject> subjects = Database.jdbi.withExtension(SubjectDAO.class, dao -> {
                return dao.searchSubjectByNameByTeacherByDescription(subjectName, subjectTeacher,subjectDescription);
            });



            request.setAttribute("subjects", subjects);
            request.getRequestDispatcher("searchSubject.jsp").forward(request, response);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
