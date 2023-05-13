<%@ page import="com.sanValero.dao.Database" %>
<%@ page import="com.sanValero.domain.Subject" %>
<%@ page import="com.sanValero.dao.SubjectDAO" %>
<%@ page import="java.util.List" %>


<%@include file="includes/headerSubject.jsp"%>

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
 <section class="py-5 text-center" style="margin-top: 44px;">
   <div class="row py-lg-5">
     <h1 class="fw-light">Student management</h1>
     <br>
     <div style="margin-bottom: 10px;">
     </div>
     <p>
       <a href="add-subject.jsp" class="btn btn-outline-dark">Register new student</a>
     </p>
   </div>
 </section>

    <div class="container d-flex align-items-center">
    <div class="row bg-transparent ">
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
       <p><a class="btn btn-danger" onclick="confirmarBorrado(event)" href="./delete-subject?idSubject=<%= subject.getIdSubject() %">Delete subject</a></p>

   <form id="formulario" action="./delete-subject" >
        <input type="hidden" name="idSubject" id="idSubject">

    </form>
   </div>
  <%
      }
    %>
   </div>
   </div>
 </main>



<%@include file="includes/footer.jsp"%>