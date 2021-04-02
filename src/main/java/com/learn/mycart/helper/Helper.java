/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.helper;

/**
 *
 * @author Neha
 */
public class Helper {
    
    
     public static String getTenWords(String desc)
    {
        String[] st= desc.split(" ");
         if(st.length>10)
         {
             String temp="";
             for(int i=0;i<10;i++)
             {
                 temp=temp+st[i]+" ";
             }
           
             return (temp+"...");
         }
         else
             return (st +"...");
    
    }
}
