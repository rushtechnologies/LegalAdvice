package com.Legal_Advice.DAO;

import com.Legal_Advice.Models.Abogado;
import java.util.List;

/**
 *
 * @author CARLOSHG
 */
public interface iAbogado {
    
    public boolean signin(Abogado abogado);
    public boolean updateAbogado(Abogado abogado);
    public boolean updateAbogadoPass(int abogado_id, String a_contra);
    public int login(String a_nombre, String a_contra);
    public int existanceAbogado(String a_nombre);
    public Abogado readAbogado(int abogado_id);
    public List<Abogado> readAllAbogado();
    
}