
<%@ page import="com.sanValero.dao.Database" %>
<%@ page import="com.sanValero.dao.StudentDAO" %>
<%@ page import="com.sanValero.domain.Student" %>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<%
    int studentId =Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Student student = Database.jdbi.withExtension(StudentDAO.class, dao -> dao.getStudent(studentId));
%>


<main class="p-25">
    <div class="card-custom">
        <div class="card mb-3">
          <img src="../colegio_data/<%= student.getImage() %>" class="bd-placeholder-img card-img-top"/>
          <div class="card-body d-flex flex-column align-items-center">
            <h4 class="card-title" ><%= student.getFirstName() %> <%= student.getLastName() %></h4>
            <p class="card-text" >DNI: <%= student.getDni() %></p>
            <p class="card-text" >Adrees: <%= student.getAddress() %></p>
            <p class="card-text" >Telephone: <%= student.getTelephone() %></p>
            <p class="card-text" >Id Student: <%= student.getId_student() %></p>
          </div>
        </div>
    </div>
</main>