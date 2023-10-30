/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.school.beans;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author a
 */
@Entity
public class Marque implements Serializable{
    @Id
    @GeneratedValue
    private int id;
    private String code;
    private String libelle;
    @OneToMany(mappedBy = "marque", fetch = FetchType.EAGER)
    private List<Machine> machines;

    public Marque(int id, String code, String libelle, List<Machine> machines) {
        this.id = id;
        this.code = code;
        this.libelle = libelle;
        this.machines = machines;
    }
 
    
    public Marque(String code, String libelle) {
        this.code = code;
        this.libelle = libelle;
    }

    
    public Marque() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }


    public void setCode(String code) {
        this.code = code;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public List<Machine> getMachines() {
        return machines;
    }

    public void setMachines(List<Machine> machines) {
        this.machines = machines;
    }
    
    
}
