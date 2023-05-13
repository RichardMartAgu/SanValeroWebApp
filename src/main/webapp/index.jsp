
<%@include file="includes/header.jsp"%>
     <main role="main" >

           <div id="myCarousel" class="carousel slide" data-ride="carousel" >
             <ol class="carousel-indicators">
               <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
               <li data-target="#myCarousel" data-slide-to="1"></li>
               <li data-target="#myCarousel" data-slide-to="2"></li>
             </ol>
             <div class="carousel-inner" style="padding-top: 80px;" >
               <div class="carousel-item active">
                 <img class="first-slide" src="resources/Bachillerato.jpg" alt="First slide" style="width: 100%; max-height: 500px;">
                 <div class="container">
                   <div class="carousel-caption text-right" >
                     <p><a class="btn btn-lg btn-primary" href="#" role="button">+ INFO</a></p>
                   </div>
                 </div>
               </div>
               <div class="carousel-item">
                 <img class="second-slide" src="resources/cursos.jpg" alt="Second slide" style="width: 100%; max-height: 500px;">
                 <div class="container">
                   <div class="carousel-caption text-right">
                     <p><a class="btn btn-lg btn-primary" href="#" role="button">+ INFO</a></p>
                   </div>
                 </div>
               </div>
               <div class="carousel-item">
                 <img class="third-slide" src="resources/desempleados.jpg" alt="Third slide" style="width: 100%; max-height: 500px;">
                 <div class="container">
                   <div class="carousel-caption text-right">
                     <p><a class="btn btn-lg btn-primary" href="#" role="button">+ INFO</a></p>
                   </div>
                 </div>
               </div>
             </div>
             <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev" >
               <span class="carousel-control-prev-icon" aria-hidden="true" ></span>
               <span class="sr-only" >Previous</span>
             </a>
             <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
               <span class="carousel-control-next-icon" aria-hidden="true"></span>
               <span class="sr-only">Next</span>
             </a>
           </div>

      <div class="container marketing">
        <div class="row featurette" style="margin-top: 30px; margin-bottom: 30px;">
          <hr class="featurette-divider">
          <h2 style="text-align: center; color: blue;">A C T U A L I T Y</h2>
          <hr class="featurette-divider">
          <div class="col-md-7">
            <h2 class="featurette-heading">SECOND DAY OF OPEN DOORS FOR THAT AND BACCALAUREATE <span class="text-muted"></span></h2>
            <p class="lead">Attendees have been able to visit the facilities and have chatted with teachers and students</p>
            <p class="lead">DATE: 04/2023</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="resources/FORO.jpg" alt="Generic placeholder image">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7 order-md-2">
            <h2 class="featurette-heading">CULTURAL FAIR OF THE SECOND CHANCE IN THE CENTERS OF THE SAN VALERO GROUP<span class="text-muted">.</span></h2>
            <p class="lead">Sale of books, stories, CDs, DVDs and vinyl</p>
            <p class="lead">DATE: 05/2023</p>

          </div>
          <div class="col-md-5 order-md-1">
            <img class="featurette-image img-fluid mx-auto" src="resources/FERIA.jpg" alt="Generic placeholder image">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">NATIONAL FINAL OF THE YOUNG BUSINESS TALENTS (YBT)<span class="text-muted"></span></h2>
            <p class="lead">The students of the Higher Degree of Automation and Robotics have been the only ones classified from Aragon</p>
            <p class="lead">DATE: 05/2023</p>

          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="resources/FINAL.jpg" alt="Generic placeholder image">
          </div>
        </div>

        <hr class="featurette-divider">

      </div>



 </main>
<%@include file="includes/footer.jsp"%>