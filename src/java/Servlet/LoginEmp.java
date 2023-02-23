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

@WebServlet(urlPatterns = {"/LoginEmp"})
public class LoginEmp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //work on dopost method
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        //accept username and password from index.html
        String email = request.getParameter("empEmail");
        String password = request.getParameter("empPass");

        
        try{
            //open connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kbmc?useSSL=false","root","");
            
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from employer where empEmail='"+email+"' and empPass='"+password+"'");
            
            if(rs.next()){
                request.getSession().setAttribute("empEmail",rs.getString("empEmail"));
                request.getSession().setAttribute("empName",rs.getString("empName"));
                request.getSession().setAttribute("empID", rs.getInt("empID"));   
                response.sendRedirect("empDashboard.jsp");
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
