package com.Legal_Advice.DAO;

import com.Legal_Advice.Models.Sugerencia;
import java.util.List;

/**
 *
 * @author CARLOSHG
 */
public interface iSugerencia {
    
    public boolean createSugerencia(Sugerencia sugerencia);
    public boolean updateAprobacionSugerencia(int sg_id ,int abogado_id);
    public List<Sugerencia> readSugerenciasUsuario(String s_categoria);
    public List<Sugerencia> readSugerenciasAbogado(int abogado_id);
    public List<Sugerencia> readSugerenciasAbogados();
    
}