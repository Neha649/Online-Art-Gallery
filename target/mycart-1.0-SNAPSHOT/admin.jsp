<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user= (User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message","Please Login First!");
        response.sendRedirect("login.jsp");
        return;
    }
    else
    {
        if(user .getUserType().equals("normal"))
        {
            session.setAttribute("message", "This Page is Restricted!");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@include file="components/common_css_js.jsp" %>
    </head>
      <%@include file="components/navbar.jsp" %>
    <body>
        <div class="container admin">
            <!--msg for successful data entry-->
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
            
            <div class="row mt-4">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container-fluid">
                            <img style="max-width: 60px;" class="img-fluid" src="img/customer.png" alt="">
                        </div>
                        <h3>Users</h3>
                        <h4>150</h4>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container-fluid">
                            <img style="max-width: 60px;" class="img-fluid" src="img/list.png" alt="">
                        </div>
                        <h3>Categories</h3>
                        <h4>3</h4>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container-fluid">
                            <img style="max-width: 60px;" class="img-fluid" src="img/received.png" alt="">
                        </div>
                        <h3>Products</h3>
                        <h4>128</h4>
                    </div>
                </div>
            </div>
        </div>
            <!--second row-->
            <div class="row mt-3">
                <!--first col-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                    <div class="card-body text-center">
                        <div class="container-fluid">
                            <img style="max-width: 60px;" class="img-fluid" src="img/add.png" alt="">
                        </div>
                        <h3> Add Category</h3>
                        
                    </div>
                </div>
                </div>
                 <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                    <div class="card-body text-center">
                        <div class="container-fluid">
                            <img style="max-width: 60px;" class="img-fluid" src="img/painting.png" alt="">
                        </div>
                        <h3>Add product</h3>
                    </div>
                </div>
                </div>
            </div>
        </div>
        <!-- category model beginning-->
        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header ">
                <h5 class="modal-title" id="exampleModalLabel">Add Category Below</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <form action="ProductOperationServlet" method="post">
                      <input type="hidden" name="operation" value="addcategory">
                      <div class="form-group">
                          <input type="text" class="form-control" name="catTitle" placeholder="Add Category Title" required=""/>
                      </div>
                      <div class="form-group">
                          <textarea style="height: 100px;" class="form-control" placeholder="Category Description" name="catDescription" required=""></textarea> 
                      </div>
                      
                       <div class="container text-right">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button class="btn btn-primary">Save Changes</button>
                        </div>
                  </form>
              </div>  
                 <div class="modal-footer">
                   
                 </div>
            </div>
          </div>
        </div>

        <!-- category model ending -->
        <!-- product model ending -->  
        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header ">
                <h5 class="modal-title" id="exampleModalLongTitle">Add Product Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control" name="pName" placeholder="Enter Product Name" required=""/>
                        </div>
                        <div class="form-group">
                            <textarea style="height: 100px;" class="form-control" placeholder="Product Description" name="pDescription" required=""></textarea> 
                        </div>
                        <div class="form-group">
                             <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required=""/>
                        </div>
                        <div class="form-group">    
                             <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required=""/>
                         </div>
                        <div class="form-group">
                             <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required=""/>
                        </div>
                        <!--product category dynamically fetching-->
                        <%
                           CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
                           List<Category> list=cdao.getCategories();
                        
                        %>
                        
                        <div class="form-group">
                            <select name="catId" class="form-control" id="">
                                
                                <%
                                    for(Category c: list){
                                %>
                                <option value="<%= c.getCategoryId()%> "> <%= c.getTitle() %></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>  
                            <!--image feed-->
                            <div class="form-group">
                                <input type="file" name="pImage" required=""/>
                            </div>
                            
                        </div>
                        <div class="container text-right">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button class="btn btn-primary">Save Changes</button>
                        </div>
                    </form>
                  
              </div>
                 <div class="modal-footer">
                   
                 </div>
            </div>
          </div>
        </div>
        <!-- product model ending -->
    </body>
</html>
