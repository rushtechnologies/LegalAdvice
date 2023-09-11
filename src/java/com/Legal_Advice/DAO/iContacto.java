package com.Legal_Advice.DAO;

import com.Legal_Advice.Models.Contacto;
import java.util.List;

/**
 *
 * @author CARLOSHG
 */
public interface iContacto {
    
    public List<Contacto> readContactAbogado(int abogado);
    public List<Contacto> readContactUsuario(int usuario);
    public boolean createContact(int usuario, int abogado);
    public boolean updateContact(int usuario, int abogado, String estado);
    
}