package com.Legal_Advice.ImpDAO;

import com.Legal_Advice.DAO.iContacto;
import com.Legal_Advice.Models.Contacto;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CARLOSHG
 */
public class ImpContacto implements iContacto{

    private final Connection connect;
    private final String createcontactquery = "call createContact(0,?,?,'Pendiente');";
    private final String updatecontactquery = "call updateContact(?,?,?);";
    private final String readcontactuserquery = "call readContactUsuario(?);";
    private final String readcontactabogadoquery = "call readContactAbogado(?);";
    private CallableStatement call = null;

    public ImpContacto() {
        com.Legal_Advice.Database.Connect connection=new com.Legal_Advice.Database.Connect();
        this.connect=connection.getConnection();
    }
    
    @Override
    public List<Contacto> readContactAbogado(int abogado) {
        
        List<Contacto> contactos = new ArrayList<>();
        
        ResultSet result = null;
        try{
            call=connect.prepareCall(readcontactabogadoquery);
            call.setInt(1, abogado);
            result = call.executeQuery();
            while(result.next()){
                Contacto contacto = new Contacto();
                contacto.setContacto_id(result.getInt("contacto_id"));
                contacto.setUsuario(result.getInt("usuario"));
                contacto.setAbogado(result.getInt("abogado"));
                contacto.setEstado(result.getString("estado"));
                contactos.add(contacto);
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
        
        return contactos;
        
    }

    @Override
    public List<Contacto> readContactUsuario(int usuario) {
        
        List<Contacto> contactos=new ArrayList<>();
        
        ResultSet result = null;
        try{
            call=connect.prepareCall(readcontactuserquery);
            call.setInt(1, usuario);
            result = call.executeQuery();
            while(result.next()){
                Contacto contacto = new Contacto();
                contacto.setContacto_id(result.getInt("contacto_id"));
                contacto.setUsuario(result.getInt("usuario"));
                contacto.setAbogado(result.getInt("abogado"));
                contacto.setEstado(result.getString("estado"));
                contactos.add(contacto);
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
        
        return contactos;
        
    }

    @Override
    public boolean createContact(int usuario, int abogado) {
        boolean create=false;
        
        try{
            call=connect.prepareCall(createcontactquery);
            call.setInt(1, usuario);
            call.setInt(2, abogado);
            call.executeUpdate();
        }
        catch(SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
        finally{
            if(call!=null){
                try{
                    create=true;
                    call.close();
                }
                catch(SQLException e){
                    System.out.println("Error: "+e.getMessage());
                }
                finally{
                }
            }
        }
        
        return create;
        
    }

    @Override
    public boolean updateContact(int usuario, int abogado, String estado) {
        boolean update=false;
        
        try{
            call=connect.prepareCall(updatecontactquery);
            call.setInt(1, usuario);
            call.setInt(2, abogado);
            call.setString(3, estado);
            call.executeUpdate();
        }
        catch(SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
        finally{
            if(call!=null){
                try{
                    update=true;
                    call.close();
                }
                catch(SQLException e){
                    System.out.println("Error: "+e.getMessage());
                }
                finally{
                }
            }
        }
        
        return update;
        
    }
    
}