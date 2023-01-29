/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import hr.algebra.dal.sql.DataSourceSingleton;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author Ivan
 */
public class EditCategory extends HttpServlet {

     static public  String categoryName;
    static public  int categoryID;

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html");
        PrintWriter out = response.getWriter();
         categoryName = request.getParameter("pName");
         categoryID =Integer.parseInt(request.getParameter("id"));
         
         try {
            DataSource ds = DataSourceSingleton.getInstance();
            Connection con = ds.getConnection();
            String query = "EXEC	[dbo].[EditCategory]\n" +
"		@categoryID = "+categoryID+",\n" +
"		@categoryName = N'"+categoryName+"'";
            Statement statement = con.createStatement();
            ResultSet rs2 = statement.executeQuery(query);  
                       response.sendRedirect("editCategories.jsp"); 
        } catch (SQLException ex) {
            response.sendRedirect("editCategories.jsp"); 

        }
    }


}
