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
 <script>
         function confirmarBorrado(event) {
           event.preventDefault();
           swal({
             title: "Are you sure?",
             text: "Once deleted, it cannot be recovered!",
             icon: "warning",
             buttons: true,
             dangerMode: true,
           })
           .then((willDelete) => {
             if (willDelete) {
             document.getElementById('formulario').submit();
             } else {
               swal("Deletion canceled.");
             }
           });
         }
 </script>

    <div class="container d-flex align-items-center mt-5">
    <div class="row bg-transparent "style="margin-top: 50px ">
     <%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Database.connect();
        List<Subject> subjectList = Database.jdbi.withExtension(SubjectDAO.class, SubjectDAO::getSubject);
        for (Subject subject : subjectList) {
     %>

   <div class="col-sm-4 text-center" >
     <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
      <title>Placeholder</title>
       <image href="../colegio_data/<%= subject.getImage() %>" width="100%" height="100%" />
      <rect width="100%" height="100%" fill="var(--bs-secondary-color)" opacity="0"></rect>
     </svg>
     <h2 class="fw-semibold text-decoration-underline border border-info rounded p-3"><%= subject.getSubjectName() %></h2>
     <br>

     <h2 class="fst-italic">Year: <%= subject.getSubjectYear() %></h2>
     <br>
     <p><a class="btn btn-info" href="./details-subject.jsp?idSubject=<%= subject.getIdSubject() %>">Show more of subject</a></p>
     <p><a class="btn btn-warning" href="./edit-subject.jsp?idSubject=<%= subject.getIdSubject() %>">Edit subject</a></p>
   <form id="formulario" action="./delete-subject" >
     <input type="hidden" name="idSubject" value="<%= subject.getIdSubject() %>">
     <p><a class="btn btn-danger" onclick="confirmarBorrado(event)" href="./delete-subject.jsp?idSubject=<%= subject.getIdSubject() %>">Delete subject</a></p>
    </form>
   </div>
  <%
      }
    %>
   </div>
   </div>
 </main>



<%@include file="includes/footer.jsp"%>