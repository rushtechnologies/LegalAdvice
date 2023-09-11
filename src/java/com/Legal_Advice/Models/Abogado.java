package com.Legal_Advice.Models;

/**
 *
 * @author CARLOSHG
 */
public class Abogado {
    private int abogado_id;
    private String a_nombre;
    private String a_contra;
    private String a_correo;
    private String a_cedula;
    private long a_telefono;
    private String a_pregunta;
    private String a_respuesta;
    private boolean a_activacion;

    public Abogado(){  
    }
    
    public Abogado(int abogado_id, String a_nombre, String a_contra, String a_correo, String a_cedula, long a_telefono, String a_pregunta, String a_respuesta, boolean a_activacion) {
        this.abogado_id = abogado_id;
        this.a_nombre = a_nombre;
        this.a_contra = a_contra;
        this.a_correo = a_correo;
        this.a_cedula = a_cedula;
        this.a_telefono = a_telefono;
        this.a_pregunta = a_pregunta;
        this.a_respuesta = a_respuesta;
        this.a_activacion = a_activacion;
    }

    public int getAbogado_id() {
        return abogado_id;
    }

    public void setAbogado_id(int abogado_id) {
        this.abogado_id = abogado_id;
    }

    public String getA_nombre() {
        return a_nombre;
    }

    public void setA_nombre(String a_nombre) {
        this.a_nombre = a_nombre;
    }

    public String getA_contra() {
        return a_contra;
    }

    public void setA_contra(String a_contra) {
        this.a_contra = a_contra;
    }

    public String getA_correo() {
        return a_correo;
    }

    public void setA_correo(String a_correo) {
        this.a_correo = a_correo;
    }

    public String getA_cedula() {
        return a_cedula;
    }

    public void setA_cedula(String a_cedula) {
        this.a_cedula = a_cedula;
    }

    public long getA_telefono() {
        return a_telefono;
    }

    public void setA_telefono(long a_telefono) {
        this.a_telefono = a_telefono;
    }

    public String getA_pregunta() {
        return a_pregunta;
    }

    public void setA_pregunta(String a_pregunta) {
        this.a_pregunta = a_pregunta;
    }

    public String getA_respuesta() {
        return a_respuesta;
    }

    public void setA_respuesta(String a_respuesta) {
        this.a_respuesta = a_respuesta;
    }

    public boolean isA_activacion() {
        return a_activacion;
    }

    public void setA_activacion(boolean a_activacion) {
        this.a_activacion = a_activacion;
    }

    @Override
    public String toString() {
        return "Abogado{" + "abogado_id=" + abogado_id + ", a_nombre=" + a_nombre + ", a_contra=" + a_contra + ", a_correo=" + a_correo + ", a_cedula=" + a_cedula + ", a_telefono=" + a_telefono + ", a_pregunta=" + a_pregunta + ", a_respuesta=" + a_respuesta + ", a_activacion=" + a_activacion + '}';
    }
    
}