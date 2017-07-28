

<%@page import="srv1.UtilityClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Believe Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstarp-css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstarp-css -->
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--// css -->
<!--fonts-->
<link href='http://fonts.googleapis.com/css?family=Questrial' rel='stylesheet' type='text/css'>
<!--/fonts-->
<!--js-->

<script src="js/jquery.min.js">
</script>
<script type="text/javascript">
      function getDat()
      {
          var e = document.getElementById("sel1");
            var strOption = e.options[e.selectedIndex].value;
            document.getElementById("txtfil").value=strOption;
      }
  </script>

<!--/js-->
        <title>JSP Page</title>
    </head>
    <body>
       
        <div id="home" class="header">
	<div class="container">
		<div class="header-info">
                    <div class="header-info-left"></div>
                    
                    <div id="team" class="services-bottom">
		 <center><a href="#"><img src="images/download.gif" width="300px" alt=""/></a></center>
                 <form action="download2.jsp" method="post" >
                     
                     
			 <table width="950px" height="200px" align="center">
            <tr>
               
                
            </tr>
            <tr>
                 <td><p>Click to Show All file</p></td>
                <td>
                    <select  name="file1" >
                        <option>Select</option>
                        <%
                           
                            
                            String unm=""+session.getAttribute("unm");
                            //String s1=request.getParameter("file1");
                            //String key=port2.getkey(s1, unm);
                            
                            
                            
                            
                           
                       
                            String[] s=UtilityClass.LisstFiles(unm).split(",");
                            int i=0;
                            while(i<s.length){
                            %>
                  
                            <option><%=s[i]%></option>
                           <%
                           i++;
                            }                                                
                           %>
                        
                    </select>
                    
                </td>
                
               
            </tr>
           <tr>
               <td></td>
              
               <td><input type="submit" value="Download" /></td>
           </tr>
         </table>
                 </form>
		<div class="container">
			<div class="services-top">
			
                        </div>
	</div>
                        <div class="introducing-bottom">
</div>
</div>
        <br><br>
        
    </body>
</html>
