/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mis;

/**
 *
 * @author rravi
 */
public class splitstring {
    
    public String createuname(String c_id){
        String[] id = c_id.split("/");
        String u_id=id[0]+id[2];
        return u_id;
    }
    
    public String createpwd(String c_id,String bday){
        
        String uid = this.createuname(c_id);
        String[] bd = bday.split("-");
        String pwd = uid+bd[0];
        return pwd;
    }
    public String createrole(String c_id){
        String[] id = c_id.split("/");
        String role;
        if (id[0].matches("TG")) {
            role="st";
        }
        else if(id[0].matches("TL")){
            role="lc";
        }
        else if(id[0].matches("TO")){
            role="to";
        }
        else{
            role="ad";
        }
        
        return role;
    }
}
