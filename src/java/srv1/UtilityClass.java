package srv1;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.spec.SecretKeySpec;

public class UtilityClass {

    public static Connection getconnect() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.13.52.130:3306/cloud", "adminxHgfiD7", "2U31HyQibhx6");
            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud", "root", "1212");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }

    public static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (int i = 0; i < children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        return dir.delete();
    }

    public static boolean fileEncrypt(String fname, String key, String destpath, String UserId) {
        boolean R = false;
        try {
            String s = fname.substring(fname.lastIndexOf(File.separator) + 1);

            FileInputStream fis = new FileInputStream(new File(fname));

            String haskkey = SHA.crypt(key);

            AESenc(fname, destpath, haskkey);
            Date dt = new java.util.Date();

            String que = "insert into encrptfiles values('" + s + "','" + haskkey + "','" + dt + "','" + UserId + "','" + key + "')";
            Connection con = getconnect();
            Statement st = con.createStatement();
            st.execute(que);
            con.close();

            R = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return R;
    }

    public static String SHAkey(FileInputStream fis) {
        StringBuffer hexString = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] dataBytes = new byte[1024];

            int nread = 0;
            while ((nread = fis.read(dataBytes)) != -1) {
                md.update(dataBytes, 0, nread);
            };
            byte[] mdbytes = md.digest();

            //convert the byte to hex format method 1
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < mdbytes.length; i++) {
                sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1));
            }

            System.out.println("Hex format : " + sb.toString());

            //convert the byte to hex format method 2
            hexString = new StringBuffer();
            for (int i = 0; i < mdbytes.length; i++) {
                hexString.append(Integer.toHexString(0xFF & mdbytes[i]));
            }

            System.out.println("Hex format : " + hexString.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hexString.toString();
    }

    public static void AESenc(String srcpath, String despath, String encryptionKey) {
        try {

            encryptionKey = encryptionKey.substring(0, 16);
            SecretKeySpec key = new SecretKeySpec(encryptionKey.getBytes("UTF-8"), "AES");
            File SRFil = new File(srcpath);
            FileInputStream fis = new FileInputStream(SRFil);
            Cipher encipher = Cipher.getInstance("AES");
            encipher.init(Cipher.ENCRYPT_MODE, key);
            CipherInputStream cis = new CipherInputStream(fis, encipher);
            File encF = new File(despath);
            if (!encF.exists()) {
                encF.createNewFile();
            }
            FileOutputStream fout = new FileOutputStream(encF);

            int count = 0;
            byte[] buffer = new byte[1024];
            while ((count = cis.read(buffer)) >= 0) {
                fout.write(buffer, 0, count);
            }
            cis.close();

            fout.flush();
            fout.close();
            Thread.sleep(1000);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public static String getAllUsers() {
        String buf = "";
        try {
            Connection con = getconnect();
            Statement st = con.createStatement();

            String str1 = "select UserId from encrptfiles ";
            ResultSet rs = st.executeQuery(str1);
            while (rs.next()) {
                buf = buf + "," + rs.getString(1);
            }
            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return buf;
    }

    public static boolean readfile(byte[] file, String unm, String output) {
        boolean b = false;
        try {

            FileOutputStream fout = new FileOutputStream(output);
            fout.write(file);
            fout.flush();
            fout.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public static byte[] fileRead(String fname) {
        byte[] barr = null;
        try {
            File f = new File(fname);
            int l = (int) f.length();
            barr = new byte[l];

            FileInputStream fin = new FileInputStream(f);
            DataInputStream din = new DataInputStream(fin);

            din.read(barr, 0, l);
            din.close();
            fin.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return barr;
    }

    public static String LisstFiles(String txtLogID) {
        String buf = "";
        try {
            Connection con = getconnect();
            Statement st = con.createStatement();
            //String str="select * from tblFile ";
            String str1 = "select * from encrptfiles where UserId='" + txtLogID + "'";
            ResultSet rs = st.executeQuery(str1);
            while (rs.next()) {
                buf = buf + "," + rs.getString(1);
                //buf=buf.replace(",","\\");
            }
            con.close();
//          if(buf.length()>1){
//              buf=buf.substring(2);
//          }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return buf.substring(1).trim();
    }

    public static ArrayList<byte[]> Down(String fname, String UID) {

        ArrayList<byte[]> b = new ArrayList<byte[]>();
        File f = new File(fname);
        try {
//        if(f.exists())
//        {
            FileInputStream fin = new FileInputStream(f);
            DataInputStream in = new DataInputStream(fin);
            int formDataLength = (int) f.length();

            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            while (totalBytesRead < formDataLength) {
                byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                totalBytesRead += byteRead;
            }

            fin.close();
            // b.ensureCapacity(1);
            b.add(dataBytes);

//  }else{
//            System.out.println("ERROR File Not Found :"+fname);
//            return null;
//        }
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
        return b;

    }

    public static boolean fileDecrypt(String fname, String UID, String Filename) {
        boolean R = false;
        try {
            // fname=fname.replace(",","\\");
            String pass = getFileAtt(UID, Filename);
            //pass=SHA.crypt(pass);

            try {

//             File myfold2=new File("EncrptFiles");
//             deleteDir(myfold2);
//             myfold2.mkdir();
                String s = fname.substring(fname.lastIndexOf(File.separator));
                String path = fname.substring(0, fname.lastIndexOf(File.separator));

                AESdec(fname, path +File.separator+ "DecryptFiles"+File.separator + s, pass);
                R = true;
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return R;
    }

    public static String getFileAtt(String uid, String fnam) {
        String s = "";
        try {
            Connection con = getconnect();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from encrptfiles where UserId='" + uid + "' and filename='" + fnam + "'");

            if (rs.next()) {
                s = rs.getString(2);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return s;
    }

    public static void AESdec(String srcpath, String despath, String encryptionKey) {
        try {

            encryptionKey = encryptionKey.substring(0, 16);
            SecretKeySpec key = new SecretKeySpec(encryptionKey.getBytes("UTF-8"), "AES");
            FileInputStream encfis = new FileInputStream(new File(srcpath));
            // File decfile=new File(despath);            
//        if(!decfile.exists()){
//               decfile.createNewFile();}
            FileOutputStream decfos = new FileOutputStream(despath);

            Cipher decipher = Cipher.getInstance("AES");

            decipher.init(Cipher.DECRYPT_MODE, key);
            CipherOutputStream fout = new CipherOutputStream(decfos, decipher);

            int count = 0;
            byte[] buffer = new byte[1024];
            while ((count = encfis.read(buffer)) >= 0) {
                fout.write(buffer, 0, count);
            }
            encfis.close();
            fout.flush();
            fout.close();
            Thread.sleep(1000);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public static String LisstFilesShare(String keyword) {
        String buf = "";
        try {
            Connection con = getconnect();
            Statement st = con.createStatement();
            //String str="select * from tblFile ";
            String str1 = "select * from encrptfiles where key1='" + keyword + "'";
            ResultSet rs = st.executeQuery(str1);
            while (rs.next()) {
                buf = buf + "," + rs.getString(1);
            }
            con.close();
//          if(buf.length()>1){
//              buf=buf.substring(2);
//          }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return buf;
    }
}
