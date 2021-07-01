/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SingUp;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.*;

@MultipartConfig
public class Login extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
            String first_name=request.getParameter("first_name"); 
            String last_name=request.getParameter("last_name"); 
            String password=request.getParameter("password"); 
            String email=request.getParameter("email"); 
            Part part = request.getPart("file");
            String filename = part.getSubmittedFileName();
            
            try {
            	Thread.sleep(2000);
            	Class.forName("com.mysql.jdbc.Driver");
            	
            	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/signup?characterEncoding=latin1","root","abhay123");
           String g="insert into user(first_name,last_name,password,email,filename) values(?,?,?,?,?)";
           PreparedStatement pstmt=con.prepareStatement(g);
           pstmt.setString(1, first_name);
           pstmt.setString(2, last_name);
           pstmt.setString(3, password);
           pstmt.setString(4, email);
           pstmt.setString(5, filename);
           pstmt.executeUpdate();
           InputStream is=part.getInputStream();
           byte []data=new byte[is.available()];
           is.read(data);
           String path=request.getRealPath("/")+"image"+File.separator+filename;
           FileOutputStream fos = new FileOutputStream(path);
           fos.write(data);
           fos.close();
           out.println("Done") ;
           
            }
            catch(Exception e) {
            	e.printStackTrace();
            	out.println(e);
            }
           
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
