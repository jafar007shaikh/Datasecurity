

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
            a{
                margin-left: 280px;
                color: white;
            }
           table{
                
                font-size: 20px;
            }
             h1,font{
               color: white; 
            }
            font{
                margin-left: 600px;
                color: white;
            }
            
        </style>
    </head>
    <body>
        <br><br>
        <font><a href="Logout.jsp">Logout</a></font>   
    <center><h1> ***Search files***</h1></center>
        <a><img src="image/img-sprite.png" width="200px" alt=""></img></a>
       
        <br>
        <center><div>
                <br><br><br><br>
                <form action="share1.jsp" method="post">
         <table align="center" width="500px">
            <tr>
                <th>Enter Keyword</th>
                <td><input type="text" name="searchkey"></td>
                <td><input type="submit" name="search" value="Search"></td>
            </tr>
         </table>
                </form>
                    

            </div></center>
    </body>
</html>
