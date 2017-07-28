

<%@page import="java.sql.Statement"%>
<%@page import="srv1.UtilityClass"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String fname=request.getParameter("file2");
        String Usernm=request.getParameter("user");
      // out.print(fname);
       //out.print(Usernm);
        Connection conn=UtilityClass.getconnect();
        Statement st=conn.createStatement();
        st.execute("insert into tblshare values('"+fname+"','"+Usernm+"')");   
        conn.close();
        out.println("<script LANGUAGE='javascript'> alert('Data Shared'); document.location='Utility.jsp'; </script>");
        
        %>
    </body>
</html>
