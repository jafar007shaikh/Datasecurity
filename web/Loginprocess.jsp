

<%@page import="java.sql.ResultSet"%>
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
        String UserId=request.getParameter("UserId");
        String Pass=request.getParameter("Pass");
        session.setAttribute("unm",UserId);
        session.setAttribute("pass",Pass);
        
       
        
    Connection con=null;
        
        int i=0;
        try{
        con=UtilityClass.getconnect();
        System.out.println("connected");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from register where UserId='"+UserId+"' and Pass=MD5('"+Pass+"')");

        if(rs.next())
        {
          i=1;
        }
        else{
            i=0;
        }
        }catch(Exception e){e.printStackTrace();}
        
        
      if(i==1)
      {
          
      response.sendRedirect("Utility.jsp");
      }
      else{
        out.print("<script LANGUAGE='javascript'> alert('Please enter valid Email Id Or Password'); document.location='dashboard.html';</script>");
        }
        
        %>
        
    </body>
</html>
