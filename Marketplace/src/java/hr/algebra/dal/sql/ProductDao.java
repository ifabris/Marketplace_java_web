/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.algebra.dal.sql;

import hr.algebra.model.Cart;
import hr.algebra.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ivan
 */
public class ProductDao {
    
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    public ProductDao(Connection con) {
		super();
		this.con = con;
	}
    
    public List<Product> getAllProducts() {
        List<Product> book = new ArrayList<>();
        try {

            query = "select * from Proizvod";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
                row.setProizvodID(rs.getInt("ProizvodID"));
                row.setProductName(rs.getString("ProductName"));
                row.setPrice(rs.getInt("Price"));
                row.setProductDescription(rs.getString("ProductDescription"));
                row.setCategoryID(rs.getInt("CategoryID"));
                row.setPicture(rs.getString("Picture"));
                row.setAmount(rs.getInt("Amount"));

                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
    
     public Product getSingleProduct(int id) {
		 Product row = null;
	        try {
	            query = "select * from Proizvod where ProizvodID=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	row = new Product();
	                row.setProizvodID(rs.getInt("ProizvodID"));
                        row.setProductName(rs.getString("ProductName"));
                        row.setPrice(rs.getInt("Price"));
                        row.setProductDescription(rs.getString("ProductDescription"));
                        row.setCategoryID(rs.getInt("CategoryID"));
                        row.setPicture(rs.getString("Picture"));
                        row.setAmount(rs.getInt("Amount"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }
     
     
     public int getTotalCartPrice(ArrayList<Cart> cartList) {
        int sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select Price from Proizvod where ProizvodID=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getProizvodID());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getInt("Price")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }
     
    
    public List<Cart> getCartProducts(ArrayList<Cart> cartList){
        List<Cart> book = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from Proizvod where ProizvodID=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getProizvodID());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setProizvodID(rs.getInt("ProizvodID"));
                        row.setProductName(rs.getString("ProductName"));
                        row.setPrice(rs.getInt("Price")* item.getQuantity());
                        row.setProductDescription(rs.getString("ProductDescription"));
                        row.setCategoryID(rs.getInt("CategoryID"));
                        row.setPicture(rs.getString("Picture"));
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
}
