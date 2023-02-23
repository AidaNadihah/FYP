package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aida
 */
@WebServlet(urlPatterns = {"/LoginJs"})
public class LoginJs extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //work on dopost method
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        //accept username and password from index.html
        String email = request.getParameter("jsEmail");
        String password = request.getParameter("jsPass");

        
        try{
            //open connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kbmc?useSSL=false","root","");
            
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from jobseeker where jsEmail='"+email+"' and jsPass='"+password+"'");
            
            if(rs.next()){
                request.getSession().setAttribute("jsName",rs.getString("jsName"));
                request.getSession().setAttribute("jsID", rs.getInt("jsID"));   
                response.sendRedirect("jsDashboard.jsp");
            }
            else{
                response.sendRedirect("error.jsp");
            }
            con.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    

}
