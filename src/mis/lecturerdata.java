/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mis;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author rravi
 */
public class lecturerdata {
        public ArrayList<User> userList() throws SQLException, ClassNotFoundException{
        ArrayList<User> userList = new ArrayList<>();
        
        
            dbconnect db = new dbconnect();
            db.connection();
            
            String query1 = "SELECT user_id,f_name,l_name,email,dob,mobile_no FROM user where user_id IN(SELECT user_id FROM user_login_data WHERE role='lc')";
            Statement st = db.conn.createStatement();
            ResultSet rs = st.executeQuery(query1);
            
            User user1;
            
            while(rs.next()){
                user1 = new User(rs.getString("user_id"),rs.getString("f_name"),rs.getString("l_name"),rs.getString("email"),rs.getString("dob"),rs.getInt("mobile_no"));
                userList.add(user1);
        
            }
        return userList;
    }
    
}
