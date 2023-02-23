/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class FileUploadServlet extends HttpServlet {
    /*
     create images folder at, C:\Users\Dharmesh Mourya\Documents\NetBeansProjects\ImageProject\build\web\images
     */

    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //int id = Integer.parseInt(request.getParameter("id"));
        //String firstName = request.getParameter("firstname");
       // String lastName = request.getParameter("lastname");
        
        int jobAppID = Integer.parseInt(request.getParameter("jobAppID"));
        String jobAppDate = request.getParameter("jobAppDate");
        Integer jobID = (Integer)request.getSession().getAttribute("jobID");
         Integer jsID = (Integer)request.getSession().getAttribute("jsID");
       // int jobID = Integer.parseInt(request.getParameter("jobID"));
      // JsID jsID= (JsID)setAttribute.getRequestParameter("jsID");
        String jobTitle = request.getParameter("jobTitle");
        //int jsID = Integer.parseInt(request.getParameter("jsID"));
        String jsName = request.getParameter("jsName");
        String jsEmail = request.getParameter("jsEmail");
        Part part = request.getPart("file");//
        String resume = extractFileName(part);//file name

        /**
         * *** Get The Absolute Path Of The Web Application ****
         */
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String savePath = uploadPath + File.separator + resume;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
        dbFileName = UPLOAD_DIR + File.separator + resume;
        part.write(savePath + File.separator);
        //out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
        /*
         You need this loop if you submitted more than one file
         for (Part part : request.getParts()) {
         String fileName = extractFileName(part);
         part.write(savePath + File.separator + fileName);
         }*/
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kbmc", "root", "");
            PreparedStatement pst = con.prepareStatement("insert into jobApplication values(?,?,?,?,?,?,?,?,?)");
            pst.setInt(1, jobAppID);
            pst.setString(2, jobAppDate);
            pst.setInt(3, jobID);
            pst.setString(4, jobTitle);
            pst.setInt(5, jsID);
            pst.setString(6, jsName);
            pst.setString(7, jsEmail);
            pst.setString(8, dbFileName);
            pst.setString(9, savePath);
            pst.executeUpdate();
            out.println("<center><h1>File inserted Succesfully......</h1></center>");
            out.println("<center><a href='viewApplication.jsp?jobAppID=" + jobAppID + "'>Display</a></center>");
        } catch (Exception e) {
            out.println(e);
        }

    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("resume")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}