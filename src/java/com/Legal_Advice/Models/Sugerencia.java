package com.Legal_Advice.Models;

/**
 *
 * @author CARLOSHG
 */
public class Sugerencia {
    private int sugerencia_id;
    private String sugerencia;
    private String s_categoria;
    private String s_titulo;
    private int s_aprobacion;
    private int abogado_id;

    public Sugerencia(){}
    
    public Sugerencia(int sugerencia_id, String sugerencia, String s_titulo, String s_categoria, int s_aprobacion, int abogado_id) {
        this.sugerencia_id = sugerencia_id;
        this.sugerencia = sugerencia;
        this.s_titulo = s_titulo;
        this.s_categoria = s_categoria;
        this.s_aprobacion = s_aprobacion;
        this.abogado_id = abogado_id;
    }

    public int getSugerencia_id() {
        return sugerencia_id;
    }

    public void setSugerencia_id(int sugerencia_id) {
        this.sugerencia_id = sugerencia_id;
    }

    public String getSugerencia() {
        return sugerencia;
    }

    public void setSugerencia(String sugerencia) {
        this.sugerencia = sugerencia;
    }

    public String getS_titulo() {
        return s_titulo;
    }

    public void setS_titulo(String s_titulo) {
        this.s_titulo = s_titulo;
    }

    public String getS_categoria() {
        return s_categoria;
    }

    public void setS_categoria(String s_categoria) {
        this.s_categoria = s_categoria;
    }

    public int getAbogado_id() {
        return abogado_id;
    }

    public void setAbogado_id(int abogado_id) {
        this.abogado_id = abogado_id;
    }

    public int getS_aprobacion() {
        return s_aprobacion;
    }

    public void setS_aprobacion(int s_aprobacion) {
        this.s_aprobacion = s_aprobacion;
    }

    @Override
    public String toString() {
        return "Sugerencia{" + "sugerencia_id=" + sugerencia_id + ", sugerencia=" + sugerencia + ", s_titulo=" + s_titulo + ", s_categoria=" + s_categoria + ", s_aprobacion=" + s_aprobacion + ", abogado_id=" + abogado_id + '}';
    }
    
}