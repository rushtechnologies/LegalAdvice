package com.Legal_Advice.ImpDAO;

import com.Legal_Advice.DAO.iSugerencia;
import com.Legal_Advice.Models.Sugerencia;
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
public class ImpSugerencia implements iSugerencia{

    private final Connection connect;
    private final String querycreateSugerencia="call createSugerencia(?,?,?,?,?,?);";
    private final String queryreadSugerenciasUsuario="call readSugerenciasUsuario(?);";
    private final String queryreadSugerenciasAbogado="call readSugerenciasAbogado(?);";   
    private final String queryupdateAprobacionSugerencia="call updateAprobacionSugerencia(?,?);";
    private final String queryreadSugerenciasAbogados="call readSugerenciasAbogados();";
    private CallableStatement call = null;

    public ImpSugerencia() {
        com.Legal_Advice.Database.Connect connection=new com.Legal_Advice.Database.Connect();
        this.connect=connection.getConnection();
    }
    
    @Override
    public boolean createSugerencia(Sugerencia sugerencia) {
        
        boolean create = false;
        
        try{
            call = connect.prepareCall(querycreateSugerencia);
            call.setInt(1, sugerencia.getSugerencia_id());
            call.setString(2, sugerencia.getSugerencia());
            call.setString(3, sugerencia.getS_titulo());
            call.setString(4, sugerencia.getS_categoria());
            call.setInt(5, sugerencia.getS_aprobacion());
            call.setInt(6, sugerencia.getAbogado_id());
            call.executeUpdate();
        } catch (SQLException e){
            System.out.println("Error: " + e.getMessage());
        } finally{
            if(call!=null){
                try{
                    create = true;
                    call.close();
                } catch(SQLException e){
                    System.out.println("Error: "+e.getMessage());
                } finally{}
            }
        }
        
        return create;
        
    }

    @Override
    public List<Sugerencia> readSugerenciasUsuario(String s_categoria) {
        
        List<Sugerencia> sugerencias = new ArrayList<>();
        
        ResultSet result = null;
        try{
            call = connect.prepareCall(queryreadSugerenciasUsuario);
            call.setString(1, s_categoria);
            result = call.executeQuery();
            while (result.next()){
                Sugerencia sugerencia = new Sugerencia();
                sugerencia.setSugerencia_id(result.getInt("sg_id"));
                sugerencia.setSugerencia(result.getString("sugerencia"));
                sugerencia.setS_titulo(result.getString("titulo"));
                sugerencia.setS_categoria(result.getString("categoria"));
                sugerencia.setS_aprobacion(result.getInt("aprobacion"));
                sugerencia.setAbogado_id(result.getInt("abogado"));
                sugerencias.add(sugerencia);
            }
        } catch (SQLException e){
            System.out.println("Error: " + e.getMessage());
        } finally{
            if(call!=null){
                try{
                    call.close();
                } catch(SQLException e){
                    System.out.println("Error: "+e.getMessage());
                } finally{}
            }
        }
        
        return sugerencias;
        
    }

    @Override
    public List<Sugerencia> readSugerenciasAbogado(int abogado_id) {
        
        List<Sugerencia> sugerencias = new ArrayList<>();
        
        ResultSet result = null;
        try{
            call = connect.prepareCall(queryreadSugerenciasAbogado);
            call.setInt(1, abogado_id);
            result = call.executeQuery();
            while (result.next()){
                Sugerencia sugerencia = new Sugerencia();
                sugerencia.setSugerencia_id(result.getInt("sg_id"));
                sugerencia.setSugerencia(result.getString("sugerencia"));
                sugerencia.setS_titulo(result.getString("titulo"));
                sugerencia.setS_categoria(result.getString("categoria"));
                sugerencia.setS_aprobacion(result.getInt("aprobacion"));
                sugerencia.setAbogado_id(result.getInt("abogado"));
                sugerencias.add(sugerencia);
            }
        } catch (SQLException e){
            System.out.println("Error: " + e.getMessage());
        } finally{
            if(call!=null){
                try{
                    call.close();
                } catch(SQLException e){
                    System.out.println("Error: "+e.getMessage());
                } finally{}
            }
        }
        
        return sugerencias;
        
    }

    @Override
    public boolean updateAprobacionSugerencia(int sg_id ,int abogado_id) {
        
        boolean update = false;
        
        try{
            call = connect.prepareCall(queryupdateAprobacionSugerencia);
            call.setInt(1, sg_id);
            call.setInt(2, abogado_id);
            call.executeUpdate();
        } catch (SQLException e){
            System.out.println("Error: " + e.getMessage());
        } finally{
            if(call!=null){
                try{
                    update = true;
                    call.close();
                } catch(SQLException e){
                    System.out.println("Error: "+e.getMessage());
                } finally{}
            }
        }
        
        return update;
        
    }

    @Override
    public List<Sugerencia> readSugerenciasAbogados() {
        List<Sugerencia> sugerencias = new ArrayList<>();
        
        ResultSet result = null;
        try{
            call = connect.prepareCall(queryreadSugerenciasAbogados);
            result = call.executeQuery();
            while (result.next()){
                Sugerencia sugerencia = new Sugerencia();
                sugerencia.setSugerencia_id(result.getInt("sg_id"));
                sugerencia.setSugerencia(result.getString("sugerencia"));
                sugerencia.setS_titulo(result.getString("titulo"));
                sugerencia.setS_categoria(result.getString("categoria"));
                sugerencia.setS_aprobacion(result.getInt("aprobacion"));
                sugerencia.setAbogado_id(result.getInt("abogado"));
                sugerencias.add(sugerencia);
            }
        } catch (SQLException e){
            System.out.println("Error: " + e.getMessage());
        } finally{
            if(call!=null){
                try{
                    call.close();
                } catch(SQLException e){
                    System.out.println("Error: "+e.getMessage());
                } finally{}
            }
        }
        
        return sugerencias;
        
    }
    
}