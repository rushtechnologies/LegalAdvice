package com.Legal_Advice.ImpDAO;

import com.Legal_Advice.DAO.iUsuario;
import com.Legal_Advice.Database.Encrypt;
import com.Legal_Advice.Models.Usuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author CARLOSHG
 */
public class ImpUsuario implements iUsuario{

    private final Connection connect;
    private final String signinquery="call usuarioSignin(?,?,?,?,?,?,?);";
    private final String logininquery="call usuarioLogin(?,?);";
    private final String readquery="call readUser(?);";
    private final String userExistance="call userExists(?);";
    private final String updatequery="call userUpdate(?,?,?,?,?,?);";
    private final String updatepassquery="call userUpdatePass(?,?);";
    private final Encrypt encrypt = new Encrypt();
    private CallableStatement call = null;
    
    public ImpUsuario() {
        com.Legal_Advice.Database.Connect connection=new com.Legal_Advice.Database.Connect();
        this.connect=connection.getConnection();
    }
    
    @Override
    public boolean signin(Usuario usuario) {
        
        boolean signin=false;
        
        try{
            call=connect.prepareCall(signinquery);
            call.setInt(1, usuario.getUsuario_id());
            call.setString(2, usuario.getU_nombre());
            call.setString(3, encrypt.encryptst(usuario.getU_contra()));
            call.setString(4, usuario.getU_correo());
            call.setString(5, usuario.getU_pregunta());
            call.setString(6, usuario.getU_respuesta());
            call.setBoolean(7, usuario.isU_activacion());
            call.executeUpdate();
        }
        catch(SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
        finally{
            if(call!=null){
                try{
                    signin=true;
                    call.close();
                }
                catch(SQLException e){
                    System.out.println("Error: "+e.getMessage());
                }
                finally{
                }
            }
        }
        return signin;
    }

    @Override
    public int login(String u_nombre, String u_contra) {
        
        int usuario_id=0;
        
        ResultSet result=null;
        try{
            call=connect.prepareCall(logininquery);
            call.setString(1, u_nombre);
            call.setString(2, encrypt.encryptst(u_contra));
            result=call.executeQuery();
            if(result.next())
                usuario_id=result.getInt(1);
            else
                usuario_id=0;
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
        return usuario_id;
    }
    
    
    @Override
    public Usuario readUsuario(int usuario_id) {
        
        Usuario usuario = new Usuario();
        
        ResultSet result = null;
        try{
            call=connect.prepareCall(readquery);
            call.setInt(1, usuario_id);
            result=call.executeQuery();
            if(result.next()){
                usuario.setUsuario_id(result.getInt("usuario_id"));
                usuario.setU_nombre(result.getString("u_nombre"));
                usuario.setU_contra(encrypt.decrypt(result.getString("u_contra")));
                usuario.setU_correo(result.getString("u_correo"));
                usuario.setU_pregunta(result.getString("u_pregunta"));
                usuario.setU_respuesta(result.getString("u_respuesta"));
                usuario.setU_activacion(result.getBoolean("u_activacion"));
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
        return usuario;
    }

    @Override
    public int existanceUsuario(String u_nombre) {
        
        int usuario_id=0;
        
        ResultSet result=null;
        try{
            call=connect.prepareCall(userExistance);
            call.setString(1, u_nombre);
            result=call.executeQuery();
            if(result.next())
                usuario_id=result.getInt(1);
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
        
        return usuario_id;
    }

    @Override
    public boolean updateUsuario(Usuario usuario) {
        
        boolean update = false;
        
        try{
            call = connect.prepareCall(updatequery);
            call.setInt(1, usuario.getUsuario_id());
            call.setString(2, usuario.getU_nombre());
            call.setString(3, usuario.getU_correo());
            call.setString(4, usuario.getU_pregunta());
            call.setString(5, usuario.getU_respuesta());
            call.setBoolean(6, usuario.isU_activacion());
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
    public boolean updateUsuarioPass(int usuario_id, String u_contra) {
        
        boolean update = false;
        
        try{
            call=connect.prepareCall(updatepassquery);
            call.setInt(1, usuario_id);
            call.setString(2, encrypt.encryptst(u_contra));
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