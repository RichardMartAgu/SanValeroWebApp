<%@ page import="com.sanValero.dao.Database" %>
<%@ page import="com.sanValero.dao.StudentDAO" %>
<%@ page import="com.sanValero.domain.Student" %>
<%@ page import="java.util.List" %>

<%@include file="includes/header.jsp"%>
 <main>

<!DOCTYPE html>
<html lang="es">

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
              <a href="view-details.jsp?id=<%= student.getId_student() %>" class="btn btn-sm btn-outline-info">See student details</a>
              <a href="student-form.jsp?id=<%= student.getId_student() %>&action=edit&firstName=<%= student.getFirstName() %>&lastName=<%= student.getLastName() %>&dni=<%= student.getDni() %>&address=<%= student.getAddress() %>&telephone=<%= student.getTelephone() %>"
                 class="btn btn-sm btn-outline-warning">Student edit</a>
              <a href="remove-student?id=<%= student.getId_student() %>"
                 class="btn btn-sm btn-outline-danger"
                 onclick="return confirmDelete('<%= student.getFirstName() %> <%= student.getLastName() %>', <%= student.getId_student() %>);">Delete</a>
             </form>
            </div>
             <small class="text-muted">Id <%= student.getId_student() %></small>
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
