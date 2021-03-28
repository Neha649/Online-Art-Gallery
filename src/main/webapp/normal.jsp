<%@page import="com.learn.mycart.entities.User"%>
<%
    User user2= (User)session.getAttribute("current-user");
    if(user2==null)
    {
        session.setAttribute("message","Please Login First!");
        response.sendRedirect("login.jsp");
        return;
    }
     else
    {
        if(user2.getUserType().equals("admin"))
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
     
    <body>
         <%@include file="components/navbar.jsp" %>
        <h1>This is user panel</h1>
    </body>
</html>
