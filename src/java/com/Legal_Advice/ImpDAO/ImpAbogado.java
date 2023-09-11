package com.Legal_Advice.ImpDAO;

import com.Legal_Advice.DAO.iAbogado;
import com.Legal_Advice.Database.Encrypt;
import com.Legal_Advice.Models.Abogado;
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
public class ImpAbogado implements iAbogado{

    private final Connection connect;
    private final String signinquery="call abogadoSignin(?,?,?,?,?,?,?,?,?);";
    private final String logininquery="call abogadoLogin(?,?);";
    private final String readquery="call readAbogado(?);";
    private final String abogadoExistance="call abogadoExists(?);";
    private final String readallquery="call readAllAbogado();";
    private final String updatequery="call abogadoUpdate(?,?,?,?,?,?,?,?);";
    private final String updatepassquery="call abogadoUpdatePass(?,?);";
    private final Encrypt encrypt = new Encrypt();
    private CallableStatement call = null;
    
    public ImpAbogado(){
        com.Legal_Advice.Database.Connect connection=new com.Legal_Advice.Database.Connect();
        this.connect=connection.getConnection();
    }
    
    @Override
    public boolean signin(Abogado abogado) {
        boolean signin=false;
        CallableStatement call=null;
        try{
            call=connect.prepareCall(signinquery);
            call.setInt(1, abogado.getAbogado_id());
            call.setString(2, abogado.getA_nombre());
            call.setString(3, encrypt.encryptst(abogado.getA_contra()));
            call.setString(4, abogado.getA_correo());
            call.setString(5, abogado.getA_cedula());
            call.setLong(6, abogado.getA_telefono());
            call.setString(7, abogado.getA_pregunta());
            call.setString(8, abogado.getA_respuesta());
            call.setBoolean(9, abogado.isA_activacion());
            call.executeUpdate();
        } catch(SQLException e){
            System.out.println("Error: "+e.getMessage());
        } finally{
            if(call!=null){
                try{
                    signin=true;
                    call.close();
                } catch(SQLException e){
                    System.out.println("Error: "+e.getMessage());
                } finally{}
            }
        }
        
        return signin;
        
    }

    @Override
    public int login(String a_nombre, String a_contra) {
        
        int abogado_id=0;
        
        ResultSet result=null;
        try{
            call=connect.prepareCall(logininquery);
            call.setString(1, a_nombre);
            call.setString(2, encrypt.encryptst(a_contra));
            result=call.executeQuery();
            if(result.next())
                abogado_id=result.getInt(1);
            else
                abogado_id=0;
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
        return abogado_id;
    }

    @Override
    public Abogado readAbogado(int abogado_id) {
        
        Abogado abogado=new Abogado();
        
        ResultSet result=null;
        try{
            call=connect.prepareCall(readquery);
            call.setInt(1, abogado_id);
            result=call.executeQuery();
            if(result.next()){
                abogado.setAbogado_id(result.getInt("abogado_id"));
                abogado.setA_nombre(result.getString("a_nombre"));
                abogado.setA_contra(encrypt.decrypt(result.getString("a_contra")));
                abogado.setA_correo(result.getString("a_correo"));
                abogado.setA_cedula(result.getString("a_cedula"));
                abogado.setA_telefono(result.getLong("a_telefono"));
                abogado.setA_pregunta(result.getString("a_pregunta"));
                abogado.setA_respuesta(result.getString("a_respuesta"));
                abogado.setA_activacion(result.getBoolean("a_activacion"));
            } else{
                return null;
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
        return abogado;
    }

    @Override
    public List<Abogado> readAllAbogado() {
        
        List<Abogado> abogados = new ArrayList<>();
        
        ResultSet result = null;
        try{
            call=connect.prepareCall(readallquery);
            result=call.executeQuery();
            while(result.next()){
                Abogado abogado = new Abogado();
                abogado.setAbogado_id(result.getInt("abogado_id"));
                abogado.setA_nombre(result.getString("a_nombre"));
                abogado.setA_contra(result.getString("a_contra"));
                abogado.setA_correo(result.getString("a_correo"));
                abogado.setA_cedula(result.getString("a_cedula"));
                abogado.setA_telefono(result.getLong("a_telefono"));
                abogado.setA_pregunta(result.getString("a_pregunta"));
                abogado.setA_respuesta(result.getString("a_respuesta"));
                abogados.add(abogado);
            }
        } catch(SQLException e){
            System.out.println("Error: "+e.getMessage());
        } finally{
            if(call != null){
                try{
                    call.close();
                } catch(SQLException e){
                    System.out.println("Error: "+e.getMessage());
                } finally{}
            }
        }
        
        return abogados;
        
    }

    @Override
    public int existanceAbogado(String a_nombre) {
        
        int abogado_id=0;
        
        ResultSet result=null;
        try{
            call=connect.prepareCall(abogadoExistance);
            call.setString(1, a_nombre);
            result=call.executeQuery();
            if(result.next())
                abogado_id=result.getInt(1);
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
        
        return abogado_id;
    }

    @Override
    public boolean updateAbogado(Abogado abogado) {
        
        boolean update = false;
        
        try{
            call = connect.prepareCall(updatequery);
            call.setInt(1, abogado.getAbogado_id());
            call.setString(2, abogado.getA_nombre());
            call.setString(3, abogado.getA_correo());
            call.setString(4, abogado.getA_cedula());
            call.setLong(5, abogado.getA_telefono());
            call.setString(6, abogado.getA_pregunta());
            call.setString(7, abogado.getA_respuesta());
            call.setBoolean(8, abogado.isA_activacion());
            call.executeUpdate();
        }
        catch(SQLException e){
            System.out.println("Error "+e.getMessage());
        }
        finally{
            if(call!=null){
                try{
                    update = true;
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

    @Override
    public boolean updateAbogadoPass(int abogado_id, String a_contra) {
        
        boolean update = false;
        
        try{
            call=connect.prepareCall(updatepassquery);
            call.setInt(1, abogado_id);
            call.setString(2, encrypt.encryptst(a_contra));
            call.executeUpdate();
        }
        catch(SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
        finally{
            if(call!=null){
                try{
                    call.close();
                    update = true;
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