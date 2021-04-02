<%-- 
    Document   : index
    Created on : Mar 15, 2021, 11:00:42 AM
    Author     : Neha
--%>


<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
            
            .card:hover {
           
            background: white;

          }
        </style>
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
              <img src="https://source.unsplash.com/1500x300/?colour">
              <div class="carousel-caption d-none d-md-block"> 
                <p>Looking for the landscape painting that will fill your wall with color or modern paintings to redo your space?</p>
                <h5>find your painting Art with Prismaticcompass today! </h5>
              </div>
            </div>
            <div class="carousel-item">
             <img src="https://source.unsplash.com/1600x300/?colour">
             <div class="carousel-caption d-none d-md-block">
                <h5>Fine Art Prints For Home & Offices</h5>
                <p></p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="https://source.unsplash.com/1600x300/?color">
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
        <%
                ProductDao dao=new ProductDao(FactoryProvider.getFactory());//getting allProducts
                List<Product> list =dao.getAllProducts();
                CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist= cdao.getCategories();
                
        %>
        <div class="row mt-3 ml-3">
            
            <!--show categories-->
            <div class="col-md-2" >
                
                <div class="list-group mt-4">
                     <a href="#" class="list-group-item list-group-item-action active">
                      All Categories</a>
                     <%
                    for(Category c:clist)
                    {
                       %>
                        
                        <a href="#" class="list-group-item list-group-item-action"> <%=c.getTitle() %></a>
                       
                       <%
                    }
                    %>
                  
                </div>
            </div>
            <div class="col-md-8">
               
                <div class="row mt-4">
                    <div class="col-md-12">
                        
                             <!--fetching products-->
                             <div class="card-columns">
                             <%
                             for(Product p :list)
                             {
                             %>
                             
                                 <div class="card card-lg" >
                                     <div class="container text-center"> <img class="card-img-top m-2" src="img/products/<%= p.getpImage() %>" style="max-height: 500 px;max-width: 200px; width: auto;" alt="Card image" >
                                    </div>
                                      <div class="card-body">
                                          <h5 class="card-title"><%= p.getpName() %> </h5>
                                          <p class="card-text">
                                              <%= p.getpDesc() %>
                                          </p>
                                      </div>
                                      <div class="card-footer mb-0">
                                          <div class="row">
                                              <div class="col-md-6">
                                                    <h6 class="card-text mt-2 mr-3">&#8377; <%= p.getpPrice() %> </h6>
                                            </div>
                                             <div class="col-md-6">
                                              <button class="btn custom-bg text-white border-0">Add to cart</button>
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
            </div>
        </div>
    </body>
</html>
