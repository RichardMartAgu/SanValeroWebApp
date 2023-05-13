<%@ page import="com.sanValero.dao.Database" %>
<%@ page import="com.sanValero.dao.StudentDAO" %>
<%@ page import="com.sanValero.domain.Student" %>
<%@ page import="java.util.List" %>

<%@include file="includes/headerSubject.jsp"%>
 <main>

<!DOCTYPE html>
<html lang="es">
    <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

<head>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<section class="py-5 text-center" style="margin-top: 44px;">
  <div class="row py-lg-5">
    <h1 class="fw-light">Subject management</h1>
    <br>
    <div style="margin-bottom: 10px;">
    </div>
    <p>
      <a href="add-subject.jsp" class="btn btn-outline-dark">Register new subject</a>
    </p>
  </div>
</section>

<main>
   <div class="container d-flex align-items-center mt-5">

        <%
            for (Subject subject : (List<Subject>)request.getAttribute("subjects")) {

        %>

      <div class="col-sm-12 text-center"style="margin-top: 50px " >
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
         <title>Placeholder</title>
          <image href="../colegio_data/<%= subject.getImage() %>" width="100%" height="100%" />
         <rect width="100%" height="100%" fill="var(--bs-danger-emphasis-color)" opacity="0"></rect>
        </svg>
        <h2 class="fw-semibold text-decoration-underline  p-3"><%= subject.getSubjectName() %></h2>
        <br>
        <h2 class="fw-bold fs-2 text-decoration-underline ">Teacher:</h2>
        <h2 class="fw-semibold fs-3"><%= subject.getTeacher() %></h2>
        <br>
        <h2 class="fw-normal"><%= subject.getSubjectDescription() %></h2>
        <h2 class="fst-italic">Year: <%= subject.getSubjectYear() %></h2>
        <br>
        <h2 class="fw-normal fs-4">Duration: <%= subject.getDuration() %> Hours</h2>

      </div>
     </div>

      <%
             }
          %>
</main>


