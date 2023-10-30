
import java.util.Date;
import java.util.List;
import ma.school.beans.Etudiant;
import ma.school.beans.Machine;
import ma.school.beans.Marque;
import ma.school.util.HibernateUtil;
import ma.school.service.EtudiantService;
import ma.school.service.MachineService;
import ma.school.service.MarqueService;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author leblond
 */
public class Test {
    public static void main(String[] args) {
//        EtudiantService es = new EtudiantService();
//        es.create(new Etudiant("EL GARDA", "Basma", "Casablanca", new Date(), "femme"));
//        for(Etudiant e : es.findAll())
//            System.out.println(e.getId()+" "+e.getNom());
       MachineService machineService = new MachineService();
MarqueService marqueService = new MarqueService();

    System.out.println("--------------------------------");
Marque mw1=marqueService.findById(2);
 System.out.println(mw1);

   
    int machineCount = marqueService.getCountByMarque(mw1); // Implement this method in your service
    
    System.out.println("--------------------------------");
    System.out.println(machineCount);
    System.out.println("--------------------------------");


    }
}
