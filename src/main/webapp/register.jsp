<%-- 
    Document   : register
    Created on : Mar 15, 2021, 4:08:31 PM
    Author     : Neha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
         <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
         <div class="container-fluid">
                <div class="row mt-5">
                 <div class="col-md-4 offset-md-4">

                     <div class="card px-5">
                          <%@include file= "components/message.jsp" %>
                            <h3 class="text-center my-3">Sign Up!</h3>
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                   <label for="name"> User Name</label>
                                   <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter here">
                                  </div>
                                <div class="form-group">
                                   <label for="email">Email</label>
                                   <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here">
                                  </div>
                                <div class="form-group">
                                   <label for="password">Password</label>
                                   <input name="user_password"type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter here">
                                  </div>
                                <div class="form-group">
                                   <label for="phone">Contact Number</label>
                                   <input name="user_phone"type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter here">
                                  </div>
                                <div class="form-group">
                                      <label for="password">Address</label>
                                      <textarea name="user_address" style="height: 150px;" class ="form-control" placeholder="Enter Address"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Register</button>
                                    <button class="btn btn-outline-warning">Reset</button>
                                </div>

                            </form>
                     </div>
                 </div>
             </div> 
         </div>
    </body>
</html>
