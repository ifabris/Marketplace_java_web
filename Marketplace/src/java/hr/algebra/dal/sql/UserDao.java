/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.algebra.dal.sql;

import hr.algebra.model.LoginUserData;
import hr.algebra.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ivan
 */
public class UserDao {
    private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	public User userLogin(String username, String password) {
		User user = null;
        try {
            query = "EXEC userLogin\n" +
"		@pLoginName = N'"+username +"',\n" +
"		@pPassword = N'"+password+"'";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            if(rs.next()){
            	user = new User();
            	user.setId(rs.getInt("UserID"));
            	user.setUsername(rs.getString("LoginName"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
        
        public void userLoginTime(User user, String ip){
                LocalDateTime now = LocalDateTime.now();
              try {
                query = "EXEC	[dbo].[LoginUserTime]\n" +
"		@UserID = "+user.getId()+",\n" +
"		@IP = N'"+ip+"',\n" +
"		@time = '"+now+"'";
                pst = this.con.prepareStatement(query);
                rs = pst.executeQuery();
            } catch (Exception e) {

            }
 
        }
        
        public List<LoginUserData> getLogins(){
            List<LoginUserData> lud = new ArrayList<>();
            try {
                query = "select * from LoginUserData";
                pst = this.con.prepareStatement(query);
                rs = pst.executeQuery();
                while(rs.next()){
                    LoginUserData row = new LoginUserData();
                row.setLoginUserDataID(rs.getInt("LoginUserDataID"));
                row.setLoginUserDataTime(rs.getString("LoginUserTime"));
                row.setLoginUserDataPersonID(rs.getInt("PersonID"));
                row.setLoginUserDataPersonIP(rs.getString("IPAdresa"));

                lud.add(row);
                }
            } catch (Exception e) {
                 System.out.print(e.getMessage());
            }
            return lud;
            
        }
}
