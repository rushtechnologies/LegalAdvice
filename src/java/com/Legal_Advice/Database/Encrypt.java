package com.Legal_Advice.Database;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author CARLOSHG
 */
public class Encrypt {
    private final Connection connect;
    private final String  encryptid = "call encryptid(?);";
    private final String  encryptst = "call encryptst(?);";
    private final String  decrypt = "call decrypt(?);";
    
    public Encrypt(){
        Connect connection=new com.Legal_Advice.Database.Connect();
        this.connect=connection.getConnection();
    }
    
    public String encryptid(int id){
        
        String encrypted="";
        
        CallableStatement call = null;
        ResultSet result = null;
        try{
            call=connect.prepareCall(encryptid);
            call.setInt(1, id);
            result=call.executeQuery();
            if(result.next()){
                encrypted=result.getString(1);
            }
        }
        catch(SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
        finally{
            if(call!=null){
                try{
                    call.close();
                }
                catch(SQLException e){
                    System.out.println("Error: "+e.getMessage());
                }
                finally{
                }
            }
        }
        
        return encrypted;
    
    }
    
    public String encryptst(String toencrypt){
        
        String encrypted="";
        
        CallableStatement call=null;
        ResultSet result = null;
        try{
            call=connect.prepareCall(encryptst);
            call.setString(1, toencrypt);
            result=call.executeQuery();
            if(result.next()){
                encrypted=result.getString(1);
            }
        }
        catch(SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
        finally{
            if(call!=null){
                try{
                    call.close();
                }
                catch(SQLException e){
                    System.out.println("Error: "+e.getMessage());
                }
                finally{
                }
            }
        }
        
        return encrypted;
    
    }
    
    public String decrypt(String encrypted){
        
        String decrypted="";
        
        CallableStatement call=null;
        ResultSet result=null;
        try{
            call=connect.prepareCall(decrypt);
            call.setString(1, encrypted);
            result=call.executeQuery();
            if(result.next()){
                decrypted=result.getString(1);
            }
        }
        catch(SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
        finally{
            if(call!=null){
                try{
                    call.close();
                }
                catch(SQLException e){
                    System.out.println("Error: "+e.getMessage());
                }
                finally{
                }
            }
        }
        
        return decrypted;
    
    }
    
}