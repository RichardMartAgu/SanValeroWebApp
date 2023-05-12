<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.sanValero.dao.Database" %>
<%@ page import="com.sanValero.dao.RegisterDAO" %>
<%@ page import="com.sanValero.domain.Register" %>


<%@ page import="java.util.List" %>


<%@include file="includes/header.jsp"%>
<main>
<div class="album py-5 bg-body-tertiary">
<div class="container " style="margin-top: 50px">

    <h2 style="text-align: center;">REGISTER DETAILS</h2>
<%

    int registerId = Integer.parseInt(request.getParameter("id"));
        Class.forName("com.mysql.cj.jdbc.Driver");
        Database.connect();
        Register register = Database.jdbi.withExtension(RegisterDAO.class, dao -> dao.searchRegisterById(registerId));
%>



    <div class="container">
        <div class="row  d-flex justify-content-center">

        <ul class="list-group col-4">
            <li class="list-group-item font-weight-bold">REGISTER ID</li>
            <li class="list-group-item font-weight-bold">DATE</li>
            <li class="list-group-item font-weight-bold" style="background-color: grey;"></li>
            <li class="list-group-item font-weight-bold">STUDENT FIRST NAME</li>
            <li class="list-group-item font-weight-bold">STUDENT LAST NAME</li>
            <li class="list-group-item font-weight-bold">STUDENT DNI</li>
            <li class="list-group-item font-weight-bold" style="background-color: grey;"></li>
            <li class="list-group-item font-weight-bold">SUBJECT NAME</li>
            <li class="list-group-item font-weight-bold">SUBJECT DESCRIPTION</li>
            <li class="list-group-item font-weight-bold">SUBJECT DURATION</li>
            <li class="list-group-item font-weight-bold">SUBJECT TEACHER</li>




        </ul>
        <ul class="list-group col-4">
              <li class="list-group-item"><%= register.getId_register() %></li>
              <li class="list-group-item"><%= register.getRegisterDate() %></li>
              <li class="list-group-item" style="background-color: grey;"></li>
              <li class="list-group-item"><%= register.getStudent().getFirstName() %></li>
              <li class="list-group-item"><%= register.getStudent().getLastName() %></li>
              <li class="list-group-item"><%= register.getStudent().getDni() %></li>
              <li class="list-group-item" style="background-color: grey;"></li>
              <li class="list-group-item"><%= register.getSubject().getSubjectName() %></li>
              <li class="list-group-item"><%= register.getSubject().getSubjectDescription() %></li>
              <li class="list-group-item"><%= register.getSubject().getDuration() %></li>
              <li class="list-group-item"><%= register.getSubject().getTeacher() %></li>



        </ul>


        </div>

        <div class="container  d-flex justify-content-center">
        <a href="list-registers.jsp" type="button" class="btn btn-primary col-4" style="margin-top: 10px;">RETURN TO REGISTERS</a>
        </div>
    </div>
 </div>
 </div>
</main>

<%@include file= "includes/footer.jsp" %>