/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mis;

/**
 *
 * @author rravi
 */
public class validation { 
    
    /**
     *variable declaration
     */
    public static boolean mobile_status,stid_status,name_status,dob_status,gender_status,email_status;
    
    public static void main(String[] args) {
        
    }
    public boolean mobileval(String mobile){
        
        if((mobile.matches("^(?:7|0|(?:\\+94))[0-9]{9}$"))){
            mobile_status=true;
        }
        else{
            mobile_status=false;
        }
        
        return mobile_status;
    }
    public boolean stidval(String stid){
        if(stid.matches("^(TG)/[0-9]{4}/[0-9]{3}$")){
            stid_status=true;
        }
        else{
            stid_status=false;
        }
        
        return stid_status;
    }
    public boolean nameval(String name){
        
        if(name.matches("[A-Za-z]+")){
            name_status=true;
        }else{
            name_status=false;
        }
        return name_status;
    }
    
    public boolean dobval(String dob){
        
        if (dob.matches("^[0-9]{4}-(1[0-2]|0[1-9])-(3[01]|[12][0-9]|0[1-9])$")) {
            dob_status=true;
        }
        else{
            dob_status=false;
        }
        return dob_status;
    }
    public boolean genderval(boolean m,boolean f){
        if (m||f) {
            gender_status=true;
        }
        else{
           gender_status=false; 
        }
        return gender_status;
    }
    public boolean emailval(String mail){
        String regex="^(([^<>()\\[\\]\\\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        if (mail.matches(regex)) {
            email_status=true;
        }
        else{
            email_status=false;
        }
        
        return email_status;
    }
    public boolean toidval(String stid){
        if(stid.matches("^(TO)/[0-9]{4}/[0-9]{3}$")){
            stid_status=true;
        }
        else{
            stid_status=false;
        }
        
        return stid_status;
    }
    public boolean lcidval(String stid){
        if(stid.matches("^(TL)/[0-9]{4}/[0-9]{3}$")){
            stid_status=true;
        }
        else{
            stid_status=false;
        }
        
        return stid_status;
    }
}
