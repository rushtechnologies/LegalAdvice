package com.Legal_Advice.Models;

/**
 *
 * @author CARLOSHG
 */
public class Contacto {
    private int contacto_id;
    private int usuario;
    private int abogado;
    private String estado;

    public Contacto() {
    }
    
    public Contacto(int contacto_id, int usuario, int abogado, String estado) {
        this.contacto_id = contacto_id;
        this.usuario = usuario;
        this.abogado = abogado;
        this.estado = estado;
    }

    public int getContacto_id() {
        return contacto_id;
    }

    public void setContacto_id(int contacto_id) {
        this.contacto_id = contacto_id;
    }

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public int getAbogado() {
        return abogado;
    }

    public void setAbogado(int abogado) {
        this.abogado = abogado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Contacto{" + "contacto_id=" + contacto_id + ", usuario=" + usuario + ", abogado=" + abogado + ", estado=" + estado + '}';
    }
    
}