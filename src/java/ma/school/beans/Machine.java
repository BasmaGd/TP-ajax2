/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.school.beans;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;

/**
 *
 * @author a
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "findByMarque", query = "From Machine where marque=:marque"),
    @NamedQuery(name = "findByReference", query = "From Machine where reference=:reference"),
    @NamedQuery(name = "findBetweenDate", query = "From Machine where dateAchat between :d1 and :d2")   
})
public class Machine implements Serializable{
    @Id
    @GeneratedValue
    private int id;
   
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dateAchat;
    private double prix;
    @ManyToOne
    private Marque marque;
 @ManyToOne
    private Reference reference;

    public Machine() {
    }

    public Machine(Date dateAchat, double prix, Marque marque, Reference reference) {
        this.dateAchat = dateAchat;
        this.prix = prix;
        this.marque = marque;
        this.reference = reference;
    }

  
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Reference getReference() {
        return reference;
    }

    public void setReference(Reference reference) {
        this.reference = reference;
    }

   

    public Date getDateAchat() {
        return dateAchat;
    }

    public void setDateAchat(Date dateAchat) {
        this.dateAchat = dateAchat;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public Marque getMarque() {
        return marque;
    }
    
    public void setMarque(Marque marque) {
        this.marque = marque;
    }

  
    
}
