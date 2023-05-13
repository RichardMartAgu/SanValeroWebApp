package com.sanValero.servlet;

import com.sanValero.dao.StudentDAO;
import com.sanValero.dao.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

@WebServlet("/edit-student")
@MultipartConfig
public class AddEditStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String imagePath = request.getServletContext().getInitParameter("image-path");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dni = request.getParameter("dni");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");

        int id = 0;
        String action = request.getParameter("action");
        if (action.equals("edit")) {
            id = Integer.parseInt(request.getParameter("id"));
        }

        try {

            Part imagePart = request.getPart("image");
            String fileName;
            if (imagePart.getSize() == 0) {
                fileName = "no_image.jpg";
            } else {
                fileName = UUID.randomUUID() + ".jpg";
                InputStream fileStream = imagePart.getInputStream();
                Files.copy(fileStream, Path.of(imagePath + File.separator + fileName));
            }
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            if (action.equals("edit")) {
                int studentId = id;
                Database.jdbi.withExtension(StudentDAO.class, dao -> {
                    dao.editStudent(firstName, lastName, dni, address, telephone, fileName, studentId);
                    return null;
                });
            } else {
                Database.jdbi.withExtension(StudentDAO.class, dao -> {
                    dao.addStudent(firstName, lastName, dni, address, telephone, fileName);
                    return null;
                });
            }

            out.println("<div class='alert alert-success text-center' role='alert'>Correctly registered student</div>");

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}

