<%@page import="com.learn.mycart.entities.User"%>
<%
    User user1 = (User)session.getAttribute("current-user");
 %>

<div class="header">
        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #276678; text-decoration: white;" >
          <a class="navbar-brand" href="index.jsp">Prismaticcompass</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
              </li>

              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </li>

            </ul>
              <ul class ="navbar-nav ml-auto">
                  <%
                  if(user1==null)
                  {
                  
                      %>
                        <li class="nav-item active">
                          <a class="nav-link" href="login.jsp">Login</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="register.jsp">Register</a>
                        </li>
                     <%
                  }
                  else
                  {
                     %>
                        <li class="nav-item active">
                            <a class="nav-link" href="#!"><%=user1.getUserName() %></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="LogoutServlet">Logout</a>
                        </li>
                        
                     <%
                  }
                  %>
                


              </ul>

          </div>
        </nav>
        <!-- <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" src="img/mock.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="img/prisma.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="img/stars.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div> -->
</div>
