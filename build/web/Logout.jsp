

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        session.setAttribute("unm", null);
        session.setAttribute("pass", null);
        session.removeAttribute("UNM");
        session.invalidate();
        out.print("<script LANGUAGE='javascript'> alert('Logout Successfully');document.location='" + "dashboard.html"+ "';</script>");
//        response.sendRedirect("dashboard.html");
        %>
    </body>
</html>
