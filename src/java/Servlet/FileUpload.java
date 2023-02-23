
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

@WebServlet("/FileUpload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class FileUpload extends HttpServlet {
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
        
            int jsID = Integer.parseInt(request.getParameter("jsID"));
            String jsName = request.getParameter("jsName");
            String jsEmail = request.getParameter("jsEmail");
            String jsPass = request.getParameter("jsPass");
            String jsAbout = request.getParameter("jsAbout");
            String jsAddress = request.getParameter("jsAddress");
            String jsDOB = request.getParameter("jsDOB");
            String jsCity = request.getParameter("jsCity");
            String jsNo = request.getParameter("jsNo");
            String jsCGPA = request.getParameter("jsCGPA");
            String jsQualification = request.getParameter("jsQualification");
            String jsMajor = request.getParameter("jsMajor");
            String jsResume = request.getParameter("jsResume");
            
            Part part = request.getPart("file");//
            String fileName = extractFileName(part);//file name

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
        String savePath = uploadPath + File.separator + fileName;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
        dbFileName = UPLOAD_DIR + File.separator + fileName;
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
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kbmc?useSSL=false", "root", "");
            PreparedStatement pst = con.prepareStatement("insert into jobseeker values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setInt(1, jsID);
            pst.setString(2, jsName);
            pst.setString(3, jsEmail);
            pst.setString(4, jsPass);
            pst.setString(5, jsAbout);
            pst.setString(6, jsAddress);
            pst.setString(7, jsDOB);
            pst.setString(8, jsCity);
            pst.setString(9, jsNo);
            pst.setString(10, jsCGPA);
            pst.setString(11, jsQualification);
            pst.setString(12, jsMajor);
            pst.setString(13, jsResume);
            pst.setString(14, dbFileName);
            pst.setString(15, savePath);
            pst.executeUpdate();
            out.print("<thead>");
                                   
            out.println("<center><div style='background-color: lightgrey;\n" +
                        "  width: 300px;\n" +
                        "  border: 10px solid green;\n" +
                        "  padding: 100px;\n" +
                        "  margin: 200px;'><h2>The file has been uploaded successfully......</h2></div></center>");
            out.println("<center><a href='jProfile.jsp?jsID=" + jsID + "'>Display</a></center>");
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
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}