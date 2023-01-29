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
public class DeleteProduct extends HttpServlet {

     static public  int productID;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         response.setContentType("text/html");
        PrintWriter out = response.getWriter();
         productID =Integer.parseInt(request.getParameter("id"));
        
          try {
            DataSource ds = DataSourceSingleton.getInstance();
            Connection con = ds.getConnection();
            String query = "EXEC [dbo].[DeletePozivod]\n" +
"		@ProizovdID = "+productID+"";
            Statement statement = con.createStatement();
            ResultSet rs2 = statement.executeQuery(query);  
                       response.sendRedirect("editProducts.jsp"); 
        } catch (SQLException ex) {
             response.sendRedirect("editProducts.jsp"); 

        }
    }
}

    


