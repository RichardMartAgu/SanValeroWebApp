<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.sanValero.DAO.Database" %>
<%@ page import="com.sanValero.DAO.Register_DAO" %>
<%@ page import="com.sanValero.Domain.Register" %>


<%@ page import="java.util.List" %>


<%@include file="includes/Index.jsp"%>
<main>

  <hr class="featurette-divider">
    <h2 style="text-align: center;">REGISTER DETAILS</h2>
<%

    int registerId = Integer.parseInt(request.getParameter("id"));
        Class.forName("com.mysql.cj.jdbc.Driver");
        Database.connect();
        Register register = Database.jdbi.withExtension(Buy_DAO.class, dao -> dao.searchBuy(buyId));
%>



    <div class="container">
        <div class="row  d-flex justify-content-center">

        <ul class="list-group col-4">
            <li class="list-group-item font-weight-bold">ID DE COMPRA</li>
            <li class="list-group-item font-weight-bold">FECHA</li>
            <li class="list-group-item font-weight-bold">ID CLIENTE COMPRADOR</li>
            <li class="list-group-item font-weight-bold">NOMBRE CLIENTE</li>
            <li class="list-group-item font-weight-bold">APELLIDOS CLIENTE</li>
            <li class="list-group-item font-weight-bold">ID PRODUCTO COMPRADO</li>
            <li class="list-group-item font-weight-bold">NOMBRE PRDUCTO</li>
            <li class="list-group-item font-weight-bold">PRECIO PRODUCTO</li>



        </ul>
        <ul class="list-group col-4">
              <li class="list-group-item"><%= buy.getId_buy() %></li>
              <li class="list-group-item"><%= buy.getBuyDate() %></li>
              <li class="list-group-item"><%= buy.getClient().getId_client() %></li>
              <li class="list-group-item"><%= buy.getClient().getFirstName() %></li>
              <li class="list-group-item"><%= buy.getClient().getLastName() %></li>
              <li class="list-group-item"><%= buy.getProduct().getId_product() %></li>
              <li class="list-group-item"><%= buy.getProduct().getName_p() %></li>
              <li class="list-group-item"><%= buy.getProduct().getPrice() %></li>



        </ul>


        </div>

        <div class="container  d-flex justify-content-center">
        <a href="buys.jsp" type="button" class="btn btn-primary col-4" style="margin-top: 10px;">Volver a la lista de compras</a>
        </div>
    </div>
</main>

<%@include file= "includes/footer.jsp" %>