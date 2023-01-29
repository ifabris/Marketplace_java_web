/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import hr.algebra.dal.sql.DataSourceSingleton;
import hr.algebra.dal.sql.UserDao;
import hr.algebra.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


/**
 *
 * @author Ivan
 */
public class LoginServlet extends HttpServlet {

    static public String username;
    static public String password;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
         username = request.getParameter("uname");
         password = request.getParameter("psw");
        try {
            DataSource ds = DataSourceSingleton.getInstance();
            Connection con = ds.getConnection();
            UserDao udao = new UserDao(con);
            User user = udao.userLogin(username, password);
            String ipAddress = request.getRemoteAddr();
            udao.userLoginTime(user, ipAddress);
            if (user != null) {
				request.getSession().setAttribute("auth", user);
                                System.out.print("user logged in");
				response.sendRedirect("Home.html");}
        } catch (SQLException ex) {
            out.println("there is no user");
        }

     
    }



}
