<%-- 
    Document   : index
    Created on : Mar 15, 2021, 11:00:42 AM
    Author     : Neha
--%>

<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
          <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" >
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner mt-1 ">
            <div class="carousel-item active">
              <img src="https://source.unsplash.com/1500x300/?painting">
              <div class="carousel-caption d-none d-md-block"> 
                <p>Looking for the landscape painting that will fill your wall with color or modern paintings to redo your space?</p>
                <h5>find your painting Art with Prismaticcompass today! </h5>
              </div>
            </div>
            <div class="carousel-item">
             <img src="https://source.unsplash.com/1600x300/?painting">
             <div class="carousel-caption d-none d-md-block">
                <h5>Fine Art Prints For Home & Offices</h5>
                <p></p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="https://source.unsplash.com/1600x300/?painting">
              <div class="carousel-caption d-none d-md-block"> 
                <p>Imagine your walls filled with paintings that showcase your personality and your journey</p>
                <h5>Order custom made Artworks with Prismaticcompass! </h5>
              </div>
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
        </div> 
       
    </body>
</html>
