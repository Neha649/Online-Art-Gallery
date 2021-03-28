<%-- 
    Document   : login
    Created on : Mar 25, 2021, 6:08:06 AM
    Author     : Neha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
           <%@include file="components/common_css_js.jsp" %>
    </head>
    
          <%@include file="components/navbar.jsp" %>
          <div class="container">
              <div class="row">
                  <div class="col-md-6 offset-md-3">
                      <div class="card mt-5">
                          <h2 style="text-align: center; margin-top: 20px">Login</h2>
                          <div class="card-body">
                              
                              <%@include file="components/message.jsp" %>
                              <form action="LoginServlet" method="post">
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                  <a href="register.jsp" class="text-center d-block mb-4">Don't have an account? Create here!</a>
                                
                                  <div class="container text-center ">
                                      <button type="submit" class="btn btn-primary btn-block custom-bg border-0">Login</button>
                                  </div>
                              </form>
                          </div>
                      </div>
                  </div>
              </div>
          </div>     
    
</html>
