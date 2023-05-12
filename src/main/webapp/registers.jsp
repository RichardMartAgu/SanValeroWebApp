
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.sanValero.dao.Database" %>
<%@ page import="com.sanValero.dao.RegisterDAO" %>
<%@ page import="com.sanValero.domain.Register" %>


<%@ page import="java.util.List" %>


<%@include file="includes/header.jsp"%>
<main>




    <h2 style="text-align: center;">REGISTERS LIST</h2>

  <div class="album py-5 bg-body-tertiary">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="justify-content: center;">

                <%
                  Class.forName("com.mysql.cj.jdbc.Driver");
                  Database.connect();
                  List<Register> registerList = Database.jdbi.withExtension(RegisterDAO.class, RegisterDAO::getRegisters);
                      for (Register register:
                           registerList) {
                  int idc = register.getId_register();
                %>

        <div class="col">
          <div class="card shadow-sm h-500">
            <div class="card-body">
              <b class="card-text">REGISTER ID = <%= register.getId_register() %></b>
              <p class="card-text">STUDENT NAME = <%= register.getStudent().getFirstName() + " " +  register.getStudent().getLastName()%></p>
              <p class="card-text">STUDENT DNI = <%= register.getStudent().getDni()%></p>
              <p class="card-text">SUBJECT = <%= register.getSubject().getSubjectName() %></p>
              <p class="card-text">TEACHER = <%= register.getSubject().getTeacher()%></p>
              <p class="card-text">REGISTER DATE = <%= register.getRegisterDate() %></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">

                  <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal<%= idc%>">BORRAR</button>
                  <div class="modal fade" id="exampleModal<%= idc%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel">CONFIRMACION DE BORRADO</h5>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                  ¿Seguro que desea borrar la compra?
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                  <a href="deleteRegister?id=<%= idc %>" type="button" class="btn btn-primary" >Aceptar</a>
                                </div>
                              </div>
                            </div>
                          </div>
                  <a href="detailsRegister.jsp?id=<%= register.getId_register()%>" class="btn btn-sm btn-outline-secondary">VER DETALLES</a>
                </div>
                <small class="text-body-secondary"> </small>
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

</main>


<%@include file="includes/footer.jsp"%>