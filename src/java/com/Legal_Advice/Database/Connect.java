package com.Legal_Advice.Database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author CARLOSHG
 */
public class Connect {
    String url = "jdbc:mysql://localhost/legal_advice";
    String usr = "root";
    String pass = "n0m3l0";
    Connection conexion = null;
    Statement s = null;
    
    public Connection getConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conexion = DriverManager.getConnection(url,usr,pass);
        }
        catch(Exception e){
            System.out.println("Error: "+e.toString());
        }
        return conexion;
    }
    
    public void cerrar() throws SQLException{
        conexion.close();
    }
}