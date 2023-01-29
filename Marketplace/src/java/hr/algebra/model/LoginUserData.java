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
public class LoginUserData {
  private int  LoginUserDataID ;
  private String  LoginUserDataTime ;
  private int  LoginUserDataPersonID ;
  private String  LoginUserDataPersonIP ;

    public int getLoginUserDataID() {
        return LoginUserDataID;
    }

    public void setLoginUserDataID(int LoginUserDataID) {
        this.LoginUserDataID = LoginUserDataID;
    }

    public String getLoginUserDataTime() {
        return LoginUserDataTime;
    }

    public void setLoginUserDataTime(String LoginUserDataTime) {
        this.LoginUserDataTime = LoginUserDataTime;
    }

    public int getLoginUserDataPersonID() {
        return LoginUserDataPersonID;
    }

    public void setLoginUserDataPersonID(int LoginUserDataPersonID) {
        this.LoginUserDataPersonID = LoginUserDataPersonID;
    }

    public String getLoginUserDataPersonIP() {
        return LoginUserDataPersonIP;
    }

    public void setLoginUserDataPersonIP(String LoginUserDataPersonIP) {
        this.LoginUserDataPersonIP = LoginUserDataPersonIP;
    }

    public LoginUserData(int LoginUserDataID, String LoginUserDataTime, int LoginUserDataPersonID, String LoginUserDataPersonIP) {
        this.LoginUserDataID = LoginUserDataID;
        this.LoginUserDataTime = LoginUserDataTime;
        this.LoginUserDataPersonID = LoginUserDataPersonID;
        this.LoginUserDataPersonIP = LoginUserDataPersonIP;
    }

    public LoginUserData() {
    }
  
}
