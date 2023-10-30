<%-- 
    Document   : filtrage.jsp
    Created on : Oct 29, 2023, 4:19:21 PM
    Author     : DELL
--%>

<%@page import="ma.school.service.MarqueService"%>
<%@page import="ma.school.beans.Marque"%>
<%@page import="java.util.List"%>
<%@page import="ma.school.beans.Machine"%>
<%@page import="ma.school.service.MachineService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/newcsslocal.css" rel="stylesheet" type="text/css"/>
        <link href="style/css.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>

        <form method="post" action="">
            <label for="marqueId">Sélectionnez l'ID de la marque</label>

            <select name="marqueId">
                <%
                    MachineService ms = new MachineService();
                    for (Machine m : ms.findAll()) {
                %>


                <option name ="marqueId" value="<%=m.getId()%>"><%=m.getId()%> </option>

                <%}%>
            </select>
            <p style="text-align: center;"><input type="submit" class="btn btn-dark btn-outline-secondary" value="Afficher la commande" name="valider" /></p>

        </form>

        <%
            String marque = request.getParameter("marqueId");

            int marqueId = 0;

            if (marque != null && !marque.isEmpty()) {
                try {
                    marqueId = Integer.parseInt(marque);

                } catch (NumberFormatException e) {

                }

            }

            MarqueService mms = new MarqueService();
            Marque mar = mms.findById(marqueId);
            List<Machine> tous_machine = ms.findByMarque(mar);
        %>


        <table border="0">
            <thead>
                <tr>
                    <th>Reference:</th>
                    <th>Prix</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Machine m : tous_machine) {
                %>
                <tr>
                    <td><%= m.getReference()%></td>
                    <td><%= m.getPrix()%></td>
                    <td></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
