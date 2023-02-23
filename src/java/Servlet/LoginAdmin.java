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

@WebServlet(urlPatterns = {"/LoginAdmin"})
public class LoginAdmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //work on dopost method
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        //accept username and password from index.html
        String email = request.getParameter("adminEmail");
        String password = request.getParameter("adminPass");

        
        try{
            //open connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kbmc?useSSL=false","root","");
            
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from admin where adminEmail='"+email+"' and adminPass='"+password+"'");
            
            if(rs.next()){
                request.getSession().setAttribute("adminEmail",rs.getString("adminEmail"));
                request.getSession().setAttribute("adminName",rs.getString("adminName"));
                request.getSession().setAttribute("adminID", rs.getInt("adminID"));   
                response.sendRedirect("adminDashboard.jsp");
            }
            else{
                response.sendRedirect("errorResponse.jsp");
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
