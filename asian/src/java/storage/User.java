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
    
    public String sport,gold,silver,bronze,total;
 
   
    public User(String sport,String gold,String silver,String bronze,String total){
        this.sport=sport;
        this.gold=gold;
        this.silver=silver;
        this.bronze=bronze;
        this.total=total;
    }
    
}
