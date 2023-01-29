/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.algebra.model;

import java.util.Date;

/**
 *
 * @author Ivan
 */
public class Order{
	
    private int OrderID;
    private int ProductID;
    private int PersonID;
    private String OrderDate;
    private int Quantity;
    private String Paymenth;

    public String getPaymenth() {
        return Paymenth;
    }

    public void setPaymenth(String Paymenth) {
        this.Paymenth = Paymenth;
    }

    public Order() {
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public Order(int OrderID, int ProductID, int PersonID, String OrderDate, int Quantity, String Paymenth) {
        this.OrderID = OrderID;
        this.ProductID = ProductID;
        this.PersonID = PersonID;
        this.OrderDate = OrderDate;
        this.Quantity = Quantity;
        this.Paymenth = Paymenth;
    }



    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getPersonID() {
        return PersonID;
    }

    public void setPersonID(int PersonID) {
        this.PersonID = PersonID;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }
    
    
}
