/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.algebra.dal.sql;


import hr.algebra.model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


public class OrderDao {
	
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
     static public  int productID;
     static public  int personID;
     static public  String date;
     static public  int quantity;
     static public  String paymenth;
     
    
    

	public OrderDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertOrder(Order model) {
        boolean result = false;
        productID = model.getProductID();
        personID = model.getPersonID();
        date = model.getOrderDate();
        quantity = model.getQuantity();
        paymenth = model.getPaymenth();
        try {
            query = "EXEC	[dbo].[InsertOrder]\n" +
"		@ProductID = "+productID+",\n" +
"		@PersonID = "+personID+",\n" +
"		@OrderDate = '"+date+"',\n" +
"		@Quantity = "+quantity+",\n" +
"		@Paymenth = N'"+paymenth+"'";
            pst = this.con.prepareStatement(query);
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            result = false;
        }
        return result;
    }
	

    public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from Orders where PersonID=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                int pId = rs.getInt("ProductID");
                order.setOrderID(rs.getInt("OrderID"));
                order.setProductID(pId);
                order.setPersonID(id);
                order.setOrderDate(rs.getString("OrderDate"));
                order.setQuantity(rs.getInt("Quantity"));
                order.setPaymenth(rs.getString("Paymenth"));
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from Orders";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                int pId = rs.getInt("ProductID");
                order.setOrderID(rs.getInt("OrderID"));
                order.setProductID(pId);
                order.setPersonID(rs.getInt("PersonID"));
                order.setOrderDate(rs.getString("OrderDate"));
                order.setQuantity(rs.getInt("Quantity"));
                order.setPaymenth(rs.getString("Paymenth"));
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }
}
