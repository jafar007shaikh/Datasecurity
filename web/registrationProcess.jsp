


<%@page import="java.sql.Statement"%>
<%@page import="srv1.UtilityClass"%>
<%@page import="com.sun.corba.se.impl.util.Utility"%>
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
      String name=request.getParameter("name");
      String UserId=request.getParameter("UserId");
      String Pass=request.getParameter("Pass");
      String contact=request.getParameter("contact");
      
      try{
              
         Connection con=null;
         boolean b = false;
            con=UtilityClass.getconnect();
            System.out.println("connection successfull");
            Statement st=con.createStatement();
             boolean rs=st.execute("INSERT INTO register(name,UserId,Pass,contact) VALUES('"+name+"','"+UserId+"',MD5('"+Pass+"'),'"+contact+"')");
             if(rs=true)
      {
      out.print("<script LANGUAGE='javascript'> alert('REGISTERED SUCCESSFULLY="+UserId+"'); document.location='dashboard.html';</script>");
      }
            con.close();
             
      }
      catch(Exception e){e.printStackTrace();}
     
        %>
        
    </body>
</html>
