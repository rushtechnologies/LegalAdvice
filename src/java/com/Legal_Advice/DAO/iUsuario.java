package com.Legal_Advice.DAO;

import com.Legal_Advice.Models.Usuario;

/**
 *
 * @author CARLOSHG
 */
public interface iUsuario {
    
    public boolean signin(Usuario usuario);
    public boolean updateUsuario(Usuario usuario);
    public boolean updateUsuarioPass(int usuario_id, String u_contra);
    public int login(String u_nombre, String u_contra);
    public int existanceUsuario(String u_nombre);
    public Usuario readUsuario(int usuario_id);
    
}