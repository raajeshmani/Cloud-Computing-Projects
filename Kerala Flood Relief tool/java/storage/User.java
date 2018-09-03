/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package storage;

import java.io.Serializable;
/**
 *
 * @author ryuuk
 */
public class User implements Serializable{
    
    public String name,location,district,pno,requested,date;
 
   
    public User(String name,String location,String district,String pno,String requested,String date){
        this.name=name;
        this.location=location;
        this.district=district;
        this.pno=pno;
        this.requested=requested;
        this.date=date;
    }
    
}
