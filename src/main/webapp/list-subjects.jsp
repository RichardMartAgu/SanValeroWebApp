<%@ page import="com.sanValero.dao.Database" %>
<%@ page import="com.sanValero.domain.Subject" %>
<%@ page import="com.sanValero.dao.SubjectDAO" %>
<%@ page import="java.util.List" %>


<%@include file="includes/header.jsp"%>

<div class="d-flex justify-content-center">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Listar Subject</li>
    </ol>
  </nav>
</div>
<main>
    <div class="d-flex justify-content-center align-items-center ">

    </div>
    <div class="row bg-body-tertiary ">
     <%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Database.connect();
        List<Subject> subjectList = Database.jdbi.withExtension(SubjectDAO.class, SubjectDAO::getSubject);
        for (Subject subject : subjectList) {
     %>

   <div class="col-sm-4 text-center" >
     <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
      <title>Placeholder</title>

      <rect width="100%" height="100%" fill="var(--bs-secondary-color)" opacity="0"></rect>
     </svg>
     <h2 class="fw-normal"><%= subject.getSubjectName() %></h2>
     <h2 class="fw-normal"><%= subject.getSubjectDescription() %></h2>
   </div>
  <%
      }
    %>
   </div>
 </main>

<%@include file="includes/footer.jsp"%>