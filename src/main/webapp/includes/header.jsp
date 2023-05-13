<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!doctype html>
<html lang="es">
  <head>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="icon" href="resources/favicon.ico">

    <title>SAN VALERO WEB </title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/carousel/">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <style>
    .card img{
      height: 300px;
    }
    .pt-25{
      padding-top:25px;
      padding-bottom: 25px;
    }
    .p-25{
      padding: 152px;
    }
    .card-custom{
       width: 459px;
       margin: 0 auto;
    }
    .pd-25{
       padding-top: 30px;
    }
    .bg{
        background-image: linear-gradient(to bottom, #e1ecf8, #003399);
    }
    </style>

  </head>
<body>

    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top" style="padding: 5px; background-color: white; height: 80px; ">

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto" >
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp" style="color: black;">HOME <span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="list-students.jsp" style="color: black;">STUDENTS</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="list-subjects.jsp" style="color: black;">SUBJECTS</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="list-registers.jsp" style="color: black;">REGISTERS</a>
            </li>
          </ul>
           <a class="navbar-brand mx-auto" href="index.jsp">
             <img src="resources/logo_web_70_aniversario_san_valero.jpg" alt="" style="width: 240px; height: 80px;">
           </a>
          <form action="searchStudent" method="post" class="form-inline mt-2 mt-md-0 d-none">
            <input class="form-control mr-sm-2" name="search" method="post" type="text" id="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">SEARCH</button>
          </form>
        </div>
      </nav>
    </header>
  </body>