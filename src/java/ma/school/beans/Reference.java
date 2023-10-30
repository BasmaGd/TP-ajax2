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
 * @author DELL
 */
@Entity
public class Reference  implements Serializable{
    @Id
    @GeneratedValue
    private int id;
    private String libelle;
   @OneToMany(mappedBy = "reference", fetch = FetchType.EAGER)
    private List<Machine> machines;

    public Reference() {
    }

    public Reference(int id,String libelle, List<Machine> machines) {
        this.id = id;
        this.libelle = libelle;
        this.machines = machines;
    }

    public Reference(int id, String libelle) {
        this.id = id;
        this.libelle = libelle;
    }

    public Reference(String libelle) {
        this.libelle = libelle;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    @Override
    public String toString() {
        return  libelle;
    }
}

