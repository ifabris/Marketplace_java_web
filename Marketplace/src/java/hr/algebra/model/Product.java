/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.algebra.model;

/**
 *
 * @author Ivan
 */
public class Product {
     
    private int ProizvodID;
    private String ProductName;
    private int Price;
    private String ProductDescription;
    private int CategoryID;
    private String Picture;
    private int Amount;

    public int getProizvodID() {
        return ProizvodID;
    }

    public Product() {
    }

    public void setProizvodID(int ProizvodID) {
        this.ProizvodID = ProizvodID;
    }

    public String getProductName() {
        return ProductName;
    }

    public Product(int ProizvodID, String ProductName, int Price, String ProductDescription, int CategoryID, String Picture, int Amount) {
        this.ProizvodID = ProizvodID;
        this.ProductName = ProductName;
        this.Price = Price;
        this.ProductDescription = ProductDescription;
        this.CategoryID = CategoryID;
        this.Picture = Picture;
        this.Amount = Amount;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public String getProductDescription() {
        return ProductDescription;
    }

    public void setProductDescription(String ProductDescription) {
        this.ProductDescription = ProductDescription;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getPicture() {
        return Picture;
    }

    public void setPicture(String Picture) {
        this.Picture = Picture;
    }

    public int getAmount() {
        return Amount;
    }

    public void setAmount(int Amount) {
        this.Amount = Amount;
    }
}
