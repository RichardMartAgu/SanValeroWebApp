
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.sanValero.dao.Database" %>
<%@ page import="com.sanValero.dao.RegisterDAO" %>
<%@ page import="com.sanValero.domain.Register" %>


<%@ page import="java.util.List" %>


<%@include file="includes/header.jsp"%>
<main>
<div class="album py-5 bg-body-tertiary">
  <div class="container" style="margin-top: 50px">
    <div class="container d-flex justify-content-center">
        <a href="addRegister.jsp" class="btn btn-primary my-2 mx-auto">ADD A NEW REGISTER</a>
    </div>
    <h2 style="text-align: center;">REGISTERS LIST</h2>
    <table class="table">
      <tr>
        <th>ID</th>
        <th>STUDENT NAME</th>
        <th>SUBJECT NAME</th>
        <th>DATE OF REGISTER</th>
        <th>OPTIONS</th>
      </tr>
      <%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Database.connect();
        List<Register> registerList = Database.jdbi.withExtension(RegisterDAO.class, RegisterDAO::getRegisters);
        for (Register register : registerList) {
          int idc = register.getId_register();
      %>
      <tr>
        <td><%= register.getId_register() %></td>
        <td><%= register.getStudent().getFirstName() + " " +  register.getStudent().getLastName() %></td>
        <td><%= register.getSubject().getSubjectName() %></td>
        <td><%= register.getRegisterDate() %></td>
        <td>
          <a href="detailsRegister.jsp?id=<%= register.getId_register()%>" class="btn btn-sm btn-outline-secondary">DETAILS</a>
          <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal<%= idc%>">DELETE</button>
            <div class="modal fade" id="exampleModal<%= idc%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel">DELETE ALERT</h5>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                  Are you sure to delete this register?
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                  <a href="deleteRegister?id=<%= idc %>" type="button" class="btn btn-primary" >Acept</a>
                                </div>
                              </div>
                            </div>
            </div>
        </td>
      </tr>
      <% } %>
    </table>
    <div class="container d-flex justify-content-center">
      <a href="addRegister.jsp" class="btn btn-primary my-2 mx-auto">ADD A NEW REGISTER</a>
    </div>
  </div>
</div>


</main>


<%@include file="includes/footer.jsp"%>