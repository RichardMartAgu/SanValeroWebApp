<%@ page import="com.sanValero.dao.Database" %>
<%@ page import="com.sanValero.dao.StudentDAO" %>
<%@ page import="com.sanValero.domain.Student" %>
<%@ page import="java.util.List" %>

<%@include file="includes/headerStudent.jsp"%>
 <main>


<!DOCTYPE html>
<html lang="es">
    <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    
<head>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<section class="py-5 text-center bg" style="margin-top: 44px;">
  <div class="container" style="margin-top: 50px;">
    <h1 class="fw-light">Student management</h1>
    <br>
    <div style="margin-bottom: 10px;">
    </div>
    <p>
      <a href="student-form.jsp?action=Register" class="btn btn-outline-dark">Register new student</a>
    </p>
  </div>
</section>


<div class="album py-5 bg-body-tertiary">
<div class="container " style="margin-top: 50px">

<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
   <%
      Class.forName("com.mysql.cj.jdbc.Driver");
      Database.connect();
      List<Student> studentList = Database.jdbi.withExtension(StudentDAO.class, StudentDAO::getStudents);
      for (Student student : studentList) {
   %>

<div class="col">
  <div class="card shadow-sm card card img">
    <img src="../colegio_data/<%= student.getImage() %>" class="bd-placeholder-img card-img-top"/>
    <div class="card-body">
      <p class="card-text"><%= student.getFirstName() %> <%= student.getLastName() %></p>
      <div class="d-flex justify-content-between align-items-center">
        <div class="btn-group">
          <a href="student-details.jsp?id=<%= student.getId_student() %>" class="btn btn-sm btn-outline-dark">See student details</a>
          <a href="student-form.jsp?id=<%= student.getId_student() %>&action=edit&firstName=<%= student.getFirstName() %>&lastName=<%= student.getLastName() %>&dni=<%= student.getDni() %>&address=<%= student.getAddress() %>&telephone=<%= student.getTelephone() %>"
             class="btn btn-sm btn-outline-dark">Student edit</a>
          <a href="remove-student?id=<%= student.getId_student() %>"
             class="btn btn-sm btn-outline-danger"
             onclick="return confirmDelete('<%= student.getFirstName() %> <%= student.getLastName() %>', <%= student.getId_student() %>);">Delete</a>
         </form>
        </div>
         <small class="text-muted"><%= student.getTelephone() %></small>
          </div>
         </div>
       </div>
     </div>
     <%
        }
     %>
   </div>
 </div>
</div>


<script>
function confirmDelete(name, studentId) {
   swal({
      title: "¿Are you sure you want to eliminate  " + name + "?",
      text: "All records with that student id will be deleted",
      icon: "warning",
      buttons: ["Cancel", "Delete"],
      dangerMode: true,
   })
   .then((willDelete) => {
      if (willDelete) {
         window.location.href = "remove-student?id=" + studentId;
      }
   });
   return false;
}
</script>

<%@include file="includes/footer.jsp"%>