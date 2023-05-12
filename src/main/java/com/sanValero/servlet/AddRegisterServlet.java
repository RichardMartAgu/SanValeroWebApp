package com.sanValero.servlet;

import com.sanValero.DAO.Database;
import com.sanValero.DAO.Register_DAO;
import com.sanValero.DAO.StudentDAO;
import com.sanValero.DAO.SubjectDAO;
import com.sanValero.Domain.Student;
import com.sanValero.Domain.Subject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

@WebServlet("/addBuy")
@MultipartConfig
public class AddRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        int id_student = Integer.parseInt(request.getParameter("id_student"));
        int id_subject = Integer.parseInt(request.getParameter("id_subject"));
        String date = request.getParameter("date");
        LocalDate localDate = LocalDate.parse(date);

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Student student = Database.jdbi.withExtension(StudentDAO.class,
                    dao -> dao.searchStudent(id_student));


            Subject subject = Database.jdbi.withExtension(SubjectDAO.class,
                    dao -> dao.searchSubject(id_subject));




            if (student == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('EL CLIENTE NO EXISTE');");
                out.println("location='registerBuy.jsp';");
                out.println("</script>");

            } else if (subject == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('EL PRODUCTO NO EXISTE');");
                out.println("location='registerBuy.jsp';");
                out.println("</script>");

            } else {
                Database.jdbi.withExtension(Register_DAO.class, dao -> {
                    dao.addRegister(id_student, id_subject, localDate);
                    return null;
                });
                String url = "registerOk.jsp";
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
