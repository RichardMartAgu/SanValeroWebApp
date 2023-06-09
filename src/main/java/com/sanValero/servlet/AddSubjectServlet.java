package com.sanValero.servlet;

import com.sanValero.dao.Database;
import com.sanValero.dao.SubjectDAO;
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


@WebServlet("/add-subject")
@MultipartConfig
public class AddSubjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String imagePath = request.getServletContext().getInitParameter("image-path");
        String subjecName = request.getParameter("subjectName");
        String subjectDescription = request.getParameter("subjectDescription");
        String subjectYear = request.getParameter("subjectYear");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String teacher = request.getParameter("teacher");


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

            Database.jdbi.withExtension(SubjectDAO.class, dao -> {
                dao.addSubject(subjecName, subjectDescription, subjectYear, duration, teacher, fileName);
                return null;
            });




            out.println("<div class='alert alert-success text-center' role='alert'>Subject successful edit </div>");

        } catch (ClassNotFoundException cnfe) {

            cnfe.printStackTrace();
        }
    }
}
