<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<script type="text/javascript">
  $(document).ready(function() {
      $("form").on("submit", function(event) {
          event.preventDefault();
          var form = $(this)[0];
          var formData = new FormData(form);
          $.ajax({
              url: "edit-student",
              type: "POST",
              data: formData,
              processData: false,
              contentType: false,
              success: function(data) {
                  $("#result").html(data);
                  setTimeout(function(){
                    window.location.href='list-students.jsp';
                  }, 3000);
              },
          });
      });
  });
</script>

<%
    String action = request.getParameter("action");
    String firstName = request.getParameter("firstName");
    if (firstName == null) firstName = "";
    String lastName = request.getParameter("lastName");
    if (lastName == null) lastName = "";
    String dni = request.getParameter("dni");
    if (dni == null) dni = "";
    String address = request.getParameter("address");
    if (address == null) address = "";
    String telephone = request.getParameter("telephone");
    if (telephone == null) telephone = "";

    String buttonText = "Register";
    if (action.equals("edit")) buttonText = "Edit";
%>

<body class= "bg">
    <div class="container">
        <nav aria-label="breadcrumb" class="pt-25">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="list-students.jsp" style="color: black;">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Student registration</li>
          </ol>
        </nav>
         <form class="row g-3 pd-25" method = "post" action = "edit-student" enctype="multipart/form-data">
            <div class="col-md-6">
                <label for="nombre" class="form-label">First name</label>
                <input type="text" class="form-control" id="nombre" name="firstName" value='<%= firstName %>'>
            </div>
            <div class="col-md-6">
                <label for="apellido" class="form-label">Last name</label>
                <input type="text" class="form-control" id="apellido" name="lastName" value='<%= lastName %>'>
            </div>
            <div class="col-12">
                <label for="dni" class="form-label">Dni</label>
                <input type="text" class="form-control" id="dni" name= "dni" value='<%= dni %>' >
            </div>
            <div class="col-12">
                <label for="dirección" class="form-label">Address</label>
                <input type="text" class="form-control" id="dirección" placeholder="Street" name= "address" value='<%= address %>' >
            </div>
            <div class="col-md-6">
                <label for="teléfono" class="form-label">Phone</label>
                <input type="text" class="form-control" id="telephone" name = "telephone" value='<%= telephone %>'>
            </div>
            <div class="col-md-6">
                <label for="image" class="form-label">Image</label>
                <input type="file" class="form-control" id="image" name="image">
            </div>
            <input type="hidden" name="action" value="<%= action %>"/>
            <%
                if (action.equals("edit")) {
                    int id = Integer.parseInt(request.getParameter("id"));
            %>
                <input type="hidden" name="id" value="<%= id %>"/>
            <%
                }
            %>
            <div class="col-12">
                <input type="submit" class="btn btn-dark" value="<%= buttonText %>"/>
            </div>
        </form>
        <div id="result"></div>
    </div>
</div>




