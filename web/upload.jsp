

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body{
                background:#202835;
            }
            th{
                color: white;
            }
            font{
               color: white;
               font-size: 30px
               
            }
           
            
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
</head>
    </head>
    <body>
        <br>
    <center><font>Upload File</font></center>
   
        <br><br>
        <form action="FileUploading" method="post" enctype="multipart/form-data" >           
           <table width="400px" height="250px" align="center">
            <tr>
                <th>Select File To Upload </th>
<!--                <th><input type="text" size="25px" value=""></th>-->

                <th><input type="file" name="file"></th>
            </tr>
            <tr>
                 <th>Enter A Keyword </th>
                 <th><input type="text" size="25px" name="key1"></th>
              
            </tr>
           <tr>
                <td></td>
                <th><input type="submit" name="submit" value="Upload"></th>
            </tr>
            
        </table>
        </form>
    </body>
</html>
