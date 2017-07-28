/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package srv1;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;

/**
 *
 * @author Navjot
 */
public class FileUploading extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {

                HttpSession sess = request.getSession();

                System.err.println("Loged User is "+sess +"\n output of get pro. "+System.getProperty("OPENSHIFT_REPO_DIR"));

               
                System.err.println("m here " + System.getenv("OPENSHIFT_DATA_DIR"));
                String unm = "" + sess.getAttribute("unm");
                DiskFileUpload upload = new DiskFileUpload();
                List items = upload.parseRequest(request);
                //File directory = new File(request.getServletContext().getRealPath(""));
                //String path = directory.getAbsolutePath();
                String path = System.getenv("OPENSHIFT_DATA_DIR");
                System.out.println("path is "+ path);
              path = path.substring(0, path.lastIndexOf(File.separator));
              //  path = path.substring(0, path.lastIndexOf(File.separator));
                String destpath = path + File.separator + "EncrptFiles" + File.separator;
                path = path + File.separator + "FILES" + File.separator;
                FileItem fil = (FileItem) items.get(0);
                String fname = fil.getName();
//           String pa= FilenameUtils.getPath(fname);
//         
//                 System.out.println("whole path=="+
                FileItem pass = (FileItem) items.get(1);
                String key = pass.getString();

                String ext = fil.getName().substring(fil.getName().lastIndexOf("."));
                String name = fname.substring(0, fname.lastIndexOf("."));
                File f = new File(path + name + ext);
                System.err.println("output path  is" + path + name + ext);
                FileOutputStream fout = new FileOutputStream(f);
                fout.write(fil.get());
                fout.flush();
                fout.close();

                boolean bb = UtilityClass.fileEncrypt(path + name + ext, key, destpath + name + ext, unm);

                if (bb) {

                    out.println("<script LANGUAGE='javascript'> alert('File Encrypted and Uploaded Successfully '); document.location='" + "download.jsp" + "';</script>");

                } else {
                    out.println("<script LANGUAGE='javascript'> alert('error');document.location='" + "download.jsp" + "'; </script>");

                }

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
