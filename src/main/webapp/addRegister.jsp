<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.sanValero.dao.Database" %>
<%@ page import="com.sanValero.dao.RegisterDAO" %>
<%@ page import="com.sanValero.domain.Register" %>


<%@ page import="java.util.List" %>


<%@include file="includes/header.jsp"%>
<main>



<div class="container " style="margin-top: 100px">

    <h2 style="text-align: center;">ADD A NEW REGISTER</h2>


    <div class="container col-6">
    <form action="addRegister" method="post" enctype= "multipart/form-data">

      <div class="mb-3">
         <label for="id_student" class="form-label">STUDENT ID</label>
         <input type="text" class="form-control" id="id_student" name="id_student">
      </div>
      <div class="mb-3">
          <label for="id_subject" class="form-label">SUBJECT ID</label>
          <input type="text" class="form-control" id="id_subject" name="id_subject">
      </div>
      <div class="mb-3">
         <label for="date" class="form-label">REGISTER DATE</label>
         <input type="date" class="form-control" id="date" name="date">
      </div>

        <div class="container  d-flex justify-content-center">
            <button type="submit" class="btn btn-primary">Confirmar el registro</button>
        </div>
    </form>

        <div class="container  d-flex justify-content-center">
        <a href="list-registers.jsp" type="button" class="btn btn-primary col-4" style="margin-top: 20px;">RETURN TO REGISTERS</a>
        </div>
    </div>
</div>
</main>

<%@include file= "includes/footer.jsp" %>
