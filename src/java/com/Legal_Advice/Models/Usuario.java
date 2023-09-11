package com.Legal_Advice.Models;

/**
 *
 * @author CARLOSHG
 */
public class Usuario {
    private int usuario_id;
    private String u_nombre;
    private String u_contra;
    private String u_correo;
    private String u_pregunta;
    private String u_respuesta;
    private boolean u_activacion;

    public Usuario(){
    }
    
    public Usuario(int usuario_id, String u_nombre, String u_contra, String u_correo, String u_pregunta, String u_respuesta, boolean u_activacion) {
        this.usuario_id = usuario_id;
        this.u_nombre = u_nombre;
        this.u_contra = u_contra;
        this.u_correo = u_correo;
        this.u_pregunta = u_pregunta;
        this.u_respuesta = u_respuesta;
        this.u_activacion = u_activacion;
    }

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getU_nombre() {
        return u_nombre;
    }

    public void setU_nombre(String u_nombre) {
        this.u_nombre = u_nombre;
    }

    public String getU_contra() {
        return u_contra;
    }

    public void setU_contra(String u_contra) {
        this.u_contra = u_contra;
    }

    public String getU_correo() {
        return u_correo;
    }

    public void setU_correo(String u_correo) {
        this.u_correo = u_correo;
    }

    public String getU_pregunta() {
        return u_pregunta;
    }

    public void setU_pregunta(String u_pregunta) {
        this.u_pregunta = u_pregunta;
    }

    public String getU_respuesta() {
        return u_respuesta;
    }

    public void setU_respuesta(String u_respuesta) {
        this.u_respuesta = u_respuesta;
    }

    public boolean isU_activacion() {
        return u_activacion;
    }

    public void setU_activacion(boolean u_activacion) {
        this.u_activacion = u_activacion;
    }

    @Override
    public String toString() {
        return "Usuarios{" + "usuario_id=" + usuario_id + ", u_nombre=" + u_nombre + ", u_contra=" + u_contra + ", u_correo=" + u_correo + ", u_pregunta=" + u_pregunta + ", u_respuesta=" + u_respuesta + ", u_aactivacion=" + u_activacion + '}';
    }
    
}