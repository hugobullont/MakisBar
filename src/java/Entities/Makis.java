package Entities;
// Generated 12-nov-2016 9:38:35 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Makis generated by hbm2java
 */
public class Makis  implements java.io.Serializable {


     private Integer idMaki;
     private String name;
     private Set relRestMaks = new HashSet(0);

    public Makis() {
    }

	
    public Makis(String name) {
        this.name = name;
    }
    public Makis(String name, Set relRestMaks) {
       this.name = name;
       this.relRestMaks = relRestMaks;
    }
   
    public Integer getIdMaki() {
        return this.idMaki;
    }
    
    public void setIdMaki(Integer idMaki) {
        this.idMaki = idMaki;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Set getRelRestMaks() {
        return this.relRestMaks;
    }
    
    public void setRelRestMaks(Set relRestMaks) {
        this.relRestMaks = relRestMaks;
    }




}


