package POJOS;
// Generated 23-abr-2020 19:09:23 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Departamento generated by hbm2java
 */
public class Departamento  implements java.io.Serializable {


     private Integer id;
     private String codigo;
     private String descripcion;
     private String localizacion;
     private Set empleados = new HashSet(0);

    public Departamento() {
    }

    public Departamento(Integer id) {
        this.id = id;
    }
    
    public Departamento(String codigo, String descripcion, String localizacion) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.localizacion = localizacion;
    }
    public Departamento(String codigo, String descripcion, String localizacion, Set empleados) {
       this.codigo = codigo;
       this.descripcion = descripcion;
       this.localizacion = localizacion;
       this.empleados = empleados;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public String getLocalizacion() {
        return this.localizacion;
    }
    
    public void setLocalizacion(String localizacion) {
        this.localizacion = localizacion;
    }
    public Set getEmpleados() {
        return this.empleados;
    }
    
    public void setEmpleados(Set empleados) {
        this.empleados = empleados;
    }
    
    public void setEmpleados(Empleado _empleado) {
        this.empleados.add(_empleado);
    }




}


