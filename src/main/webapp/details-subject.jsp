<%@ page import="com.sanValero.dao.Database" %>
<%@ page import="com.sanValero.domain.Subject" %>
<%@ page import="com.sanValero.dao.SubjectDAO" %>
<%@ page import="java.util.List" %>


<%@include file="includes/header.jsp"%>
<style>
    body {
      background-image: linear-gradient(to bottom, #e1ecf8, #003399);

    }
  </style>
<main>
    <div class="container d-flex align-items-center mt-5">

     <%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Database.connect();
        int idSubject = Integer.parseInt(request.getParameter("idSubject"));
        Subject subject = Database.jdbi.withExtension(SubjectDAO.class, dao -> dao.searchSubjectById(idSubject));

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
 </main>

<%@include file="includes/footer.jsp"%>