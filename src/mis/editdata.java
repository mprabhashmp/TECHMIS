/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mis;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author rravi
 */
public class editdata {
    
    public String department,gend,add;
    
    public void getdata(String st_id) throws ClassNotFoundException, SQLException{
        
        dbconnect db = new dbconnect();
        db.connection();
        
        String query1 = "SELECT address,gender FROM user WHERE user_id=?";
        String query2 = "SELECT Department_name FROM department WHERE department_id=(SELECT department_id FROM user_department WHERE user_id=?)";
        PreparedStatement pt = db.conn.prepareStatement(query1);
        PreparedStatement pt1 = db.conn.prepareStatement(query2);
        pt.setString(1, st_id);
        pt1.setString(1, st_id);

        
        ResultSet result = pt.executeQuery();
        ResultSet result1 = pt1.executeQuery();
        
        while(result.next()){
        this.add = result.getString("address");
        this.gend = result.getString("gender");
        
        }
        while(result1.next()){
        this.department = result1.getString("Department_name");
        }
    }
    
}
