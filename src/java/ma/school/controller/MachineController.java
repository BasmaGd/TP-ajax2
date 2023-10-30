/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.school.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ma.school.beans.Etudiant;
import ma.school.beans.Machine;
import ma.school.beans.Marque;
import ma.school.beans.Reference;
import ma.school.service.EtudiantService;
import ma.school.service.MachineService;
import ma.school.service.MarqueService;
import ma.school.service.ReferenceService;

/**
 *
 * @author a
 */
@WebServlet(name = "MachineController", urlPatterns = {"/MachineController"})
public class MachineController extends HttpServlet {

    MarqueService ms = new MarqueService();
    ReferenceService rs = new ReferenceService();
    MachineService mms = new MachineService();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");

        if (op.equals("Envoyer")) {
            // Code pour l'ajout d'une machine
            Reference reference = rs.findById(Integer.parseInt(request.getParameter("reference")));
            double prix = Double.parseDouble(request.getParameter("prix"));
            Date dateAchat = new Date(request.getParameter("dateAchat").replace("-", "/"));
            Marque marque = ms.findById(Integer.parseInt(request.getParameter("marque")));
            mms.create(new Machine(dateAchat, prix, marque, reference));
            response.sendRedirect("machineForm.jsp");
        } else if (op.equals("delete")) {
            // Code pour la suppression d'une machine
            int id = Integer.parseInt(request.getParameter("id"));
            mms.delete(mms.findById(id));
            response.sendRedirect("machineForm.jsp");
        } else if (op.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            RequestDispatcher rd = request.getRequestDispatcher("machineUpdate.jsp");
            rd.forward(request, response);
        } else if (op.equals("updateOK")) {

            doUpdate(request, response);
            //response.sendRedirect("machineForm.jsp");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println("get");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println("post");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    protected void doUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idOK"));
        Reference reference = rs.findById(Integer.parseInt(request.getParameter("referenceOK")));
        double prix = Double.parseDouble(request.getParameter("prixOK"));
        Date dateAchat = new Date(request.getParameter("dateAchatOK").replace("-", "/"));
        Marque marque = ms.findById(Integer.parseInt(request.getParameter("marqueOK")));
//        System.out.println("---------------------------------------------------");
//        System.out.println("---------------------------------------------------");
//        System.out.println(prix);
//        System.out.println(dateAchat);
        MachineService es = new MachineService();
        Machine machine = es.findById(id);
        machine.setDateAchat(dateAchat);;
        machine.setPrix(prix);
        machine.setMarque(marque);
        machine.setReference(reference);
        System.out.println("---------------------------------------------------");
        System.out.println("---------------------------------------------------");

        System.out.println(reference);
        System.out.println("---------------------------------------------------");
        System.out.println("---------------------------------------------------");
        System.out.println(machine);

        es.update(machine);

        response.sendRedirect("machineForm.jsp");
    }

}
