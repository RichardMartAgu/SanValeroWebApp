package com.sanValero.servlet;

import com.sanValero.dao.Database;
import com.sanValero.dao.StudentDAO;
import com.sanValero.domain.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchStudent")
@MultipartConfig

public class SearchStudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");



        String studentDni = "%" + request.getParameter("search") + "%";
        String StudentFirstName = "%" + request.getParameter("search") + "%";
        String StudentLastName = "%" + request.getParameter("search") + "%";


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();


            List<Student> students = Database.jdbi.withExtension(StudentDAO.class, dao -> {
                return dao.searchStudentByFirstnameOrLastnameOrDni(StudentFirstName, StudentLastName,studentDni);
            });



            request.setAttribute("students", students);
            request.getRequestDispatcher("searchStudents.jsp").forward(request, response);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
