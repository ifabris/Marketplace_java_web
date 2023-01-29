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
public class AddProduct extends HttpServlet {

    static public  String productName;
    static public  String productDescription;
    static public  int productPrice;
    static public  int productAmount;
    static public  int productCategoryID;
    static public  String productPictureURL;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
         productName = request.getParameter("pName");
         productDescription = request.getParameter("pDesc");
         productPrice =Integer.parseInt(request.getParameter("pPrice"));
         productAmount = Integer.parseInt(request.getParameter("pAmount"));
         productCategoryID = Integer.parseInt(request.getParameter("pCategory"));
         productPictureURL = request.getParameter("pUrl");
         
         try {
            DataSource ds = DataSourceSingleton.getInstance();
            Connection con = ds.getConnection();
            String query = "EXEC [dbo].[AddProduct]\n" +
"		@ProizvodName = N'"+productName+"',\n" +
"		@Price = "+productPrice+",\n" +
"		@ProductDescription = N'"+productDescription+"',\n" +
"		@CategoryID = "+productCategoryID+",\n" +
"		@Picture = "+productPictureURL+",\n" +
"		@Amount = "+productAmount+"";
            Statement statement = con.createStatement();
            ResultSet rs2 = statement.executeQuery(query);  
                       response.sendRedirect("editProducts.jsp"); 
        } catch (SQLException ex) {
            response.sendRedirect("editProducts.jsp"); 
        }
      
    }


}
