

<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="srv1.UtilityClass"%>
<%@page import="java.io.FileOutputStream"%>

<%@page import="java.io.File"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <%

            String fname = request.getParameter("file1");
            String unm = "" + session.getAttribute("unm");
            String path = System.getenv("OPENSHIFT_DATA_DIR");
 
            //   path=path.substring(0,path.lastIndexOf("\\")); 
            String destpath = path + File.separator + "EncrptFiles" + File.separator;

                     // com.mycompany.test.DecryptFileData_Service dec=new DecryptFileData_Service();
            // com.mycompany.test.DecryptFileData port1=dec.getDecryptFileDataPort();
            List<byte[]> byt = UtilityClass.Down(destpath + fname, unm);
//                     File f=new File("Download Files");
//                     if(!f.exists())
//                     {
//                        f.mkdir();           
//                     }
            File ff = new File(destpath + "DownloadFiles" + File.separator + fname);
            FileOutputStream fout = new FileOutputStream(ff);
            fout.write(byt.get(0));
            fout.flush();
            fout.close();

            UtilityClass.fileDecrypt(destpath + "DownloadFiles" + File.separator + fname, unm, fname);
//                    out.println("<script LANGUAGE='javascript'> alert('Decryption and downloading Comleted');document.location='" + "share.jsp"+ "';</script>");

            String filePath = destpath + "DownloadFiles" + File.separator + "DecryptFiles" + File.separator + fname;
            File downloadFile = new File(filePath);
            FileInputStream inStream = new FileInputStream(downloadFile);
            //after new download 
            ServletContext context = request.getServletContext();
            String mimeType = context.getMimeType("");
            if (mimeType == null) {
                // set to binary type if MIME mapping not found
                mimeType = "application/octet-stream";
            }
            System.out.println("MIME type: " + mimeType);

            // modifies response
            response.setContentType(mimeType);
            response.setContentLength((int) downloadFile.length());

            // forces download
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
            response.setHeader(headerKey, headerValue);

            // obtains response's output stream
            OutputStream outStream = response.getOutputStream();

            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            while ((bytesRead = inStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, bytesRead);
            }

            inStream.close();
            outStream.close();

//                 else{
//                    out.println("<script LANGUAGE='javascript'> alert('Decryption Error');</script>");
//                    out.println("Decryption Error");
//                    }

        %>
    </body>
</html>
