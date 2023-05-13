<%@ page import="com.sanValero.dao.Database" %>
<%@ page import="com.sanValero.domain.Subject" %>
<%@ page import="com.sanValero.dao.SubjectDAO" %>

<%@include file="includes/header.jsp"%>

<script type="text/javascript">
  $(document).ready(function() {
      $("form").on("submit", function(event) {
          event.preventDefault();
          var form = $(this)[0];
          var formData = new FormData(form);
          $.ajax({
              url: "add-subject",
              type: "POST",
              data: formData,
              processData: false,
              contentType: false,
              success: function(data) {
                  $("#result").html(data);
              },
              error: function(jqXHR, textStatus, errorThrown) {
                  $("#error-message").html("Fallo al registrar! " + errorThrown);
              }
          });
      });
  });

</script>

<style>
body {
  background-image: linear-gradient(to bottom, #e1ecf8, #003399);
}
</style>
<main>

<div class="container px-5">
    <h3 class="display-4 fw-normal text-center">Add Subject</h3>
    <br/> <br/>
    <form class="row g-3 needs">
     <div class="col-md-6">
            <label for="nombre" class="form-label">Subject Name</label>
            <input type="text" class="form-control" id="subjectName" name="subjectName" >
            <div class="invalid-feedback">
                  Por favor ingrese el nombre del profesor.
            </div>
        </div>

      <div class="col-md-6">
        <label for="inputEmail" class="form-label">Subject Description</label>
        <input type="name" class="form-control" id="subjectDescription"name="subjectDescription" required>
        </div>
      <div class="col-md-6">
        <label for="inputPassword4" class="form-label">Subject Year</label>
        <input type="year" class="form-control" id="subjectYear"name="subjectYear">
      </div>
      <div class="col-12">
        <label for="inputAddress" class="form-label">Duration</label>
        <input type="text" class="form-control" id="duration" name="duration" >
        <div class="invalid-feedback">
              Por favor ingrese la dirección.
         </div>
      </div>
      <div class="col-12">
              <label for="name" class="form-label">Teacher</label>
              <input type="text" class="form-control" id="teacher" name="teacher" required>
        </div>

     <div class="col-md-6">
           <label for="image" class="form-label">Image (opcional)</label>
           <input type="file" class="form-control" id="image" name="image">
     </div>

   <div class="col-12 text-center">
        <button type="submit" class="btn btn-outline-warning btn-lg" onclick="refreshPage()">Add</button>
   </div>
  </div>
</form>

 <div id="result"></div>
 <div class= "text-center bg-danger-subtle text-danger-emphasis fs-4" id="error-message"></div>
</div>
 </script>
  <script type="text/javascript">
        function refreshPage() {
            setTimeout(function() {
                location.reload();
            }, 2000);
        }
    </script>
<main/>

<%@include file="includes/footer.jsp"%>