


<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="srv1.UtilityClass"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
               background: #202835;
               
            }
            div{
                 background:#F2F2F2;
                 width:800px;
                 height:400px;
                 border-radius: 20px;
                
            }
            li{
                margin-left: 0px;
                color: white;
            }
            table{
                
                width:450px;
                height:200px;
                font-size: 20px;
            }
            td{
                
            }
            h1,a{
               color: white; 
            }
             font{
                margin-left: 800px;
           
            }
            
        </style>
    </head>
    <body>
        <br><br>
         <font><a href="Logout.jsp">Logout</a></font>  
        <a><img src="image/aa.jpg" width="200px" alt=""></img></a>
        <br>
         <center><h1> ***Share files***</h1></center>
         <br>
        <%
        String user=UtilityClass.getAllUsers();
        
        String[] all=user.split(",");
        
        
        %>
        
        <form action="datashare.jsp">
            <center> <table><tr><td>
            <select name="file2">
                <option>FileName</option>
        <%
        String key=request.getParameter("searchkey");
       
        String s1=UtilityClass.LisstFilesShare(key);
        String[] s=s1.split(",");
        
       %>
               
       <%
       
       int i=1;
                            while(i<s.length){
                            %>
                                
                              
                               <option><%=s[i]%></option>
                                                    
                           
                          <%
                           i++;
                            }                                                
                           %>
                           </select> 
                    </td>
                    <td>
                           <select name="user">  
                               <option>All Users</option>
                           <%
                            int j=1;
                           while(j<all.length)
                           {
                           %>
                        
                           
                           <option><%=all[j]%></option>
                           <%
                           j++;
                           }
                           %>
                           </select>
                    </td>
                    <td>
                        <input type="submit" value="Share"></td>
                </table></center>
                           </form>
    </body>
</html>
