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

<section class="py-5 text-center" style="margin-top: 44px;">
  <div class="row py-lg-5">
    <h1 class="fw-light">Student management</h1>
    <br>
    <div style="margin-bottom: 10px;">
    </div>
    <p>
      <a href="student-form.jsp?action=Register" class="btn btn-outline-dark">Register new student</a>
    </p>
  </div>
</section>

<main>
    <div class="album py-5 bg-body-tertiary">
        <div class="container d-flex justify-content-center">

    <div class="row ">
   <%
    for (Student student : (List<Student>)request.getAttribute("students")) {
   %>

  <div class="card-custom">
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


     <%
        }
     %>
   </div>
  </div>
 </div>
</main>


<script>
function confirmDelete(name, studentId) {
   swal({
      title: "¿Are you sure you want to eliminate  " + name + "?",
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