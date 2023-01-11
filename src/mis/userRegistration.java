/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mis;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author rravi
 */
public class userRegistration {
    
    public void registration(String user_id,String bday) throws ClassNotFoundException, SQLException{
        splitstring sp = new splitstring();
        String u_id = user_id;
        String uname = sp.createuname(user_id);
        String pwd = sp.createpwd(user_id,bday) ;
        String role = sp.createrole(user_id);
        String query1 ="INSERT INTO user_login_data VALUES (?,?,?,?)";
        dbconnect db = new dbconnect();
        db.connection();
        
        PreparedStatement pt = db.conn.prepareStatement(query1);
        pt.setString(1, uname);
        pt.setString(2, pwd);
        pt.setString(3, role);
        pt.setString(4, u_id);
        
        int rows = pt.executeUpdate();
        if (rows>0) {
            System.out.println("data insert into user_login_data table");
        }
        else{
            System.out.println("data insert faild");
        }
       
    }
}
