/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mis;

/**
 *
 * @author rravi
 */
public class User {
    private int mobile_no;
    private String stid,fname,lname,email,dob;
    
    public User(String stid,String fname,String lname,String email,String dob,int mobile_no){
        
        this.stid = stid;
        this.fname = fname;
        this.lname = lname;
        this.email=email;
        this.dob=dob;
        this.mobile_no=mobile_no;
    }
    
    public int getcon(){
        
        return mobile_no;
    }
    public String getid(){
        return stid;
    }
    public String getfn(){
        return fname;
    }
    public String getln(){
        return lname;
    }
    public String getmail(){
        return email;
    }
    public String getdob(){
        return dob;
    }
}
