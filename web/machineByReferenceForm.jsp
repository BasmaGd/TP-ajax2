<%@page import="java.util.List"%>
<%@page import="ma.school.beans.Machine"%>
<%@page import="ma.school.service.MachineService"%>
<%@page import="ma.school.beans.Reference"%>
<%@page import="ma.school.service.ReferenceService"%>
<%@page import="java.util.Date"%>
<%@page import="ma.school.beans.Etudiant"%>
<%@page import="ma.school.service.EtudiantService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
           <script src="script/script.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="script/jsonExemple.js" type="text/javascript"></script>
        <link href="style/newcsslocal.css" rel="stylesheet" type="text/css"/>
        <link href="style/css.css" rel="stylesheet" type="text/css"/>
        <link href="style/newcss.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <%@include file="template/header.jsp" %>
        <%@include file="template/menu.jsp" %>
        
        
        
        
             <div class="content">
         <form method="post" action="">
             
          
             
                <fieldset>
             
            <label for="referenceId">Sélectionnez l'ID de la reference</label>

            <select name="referenceId">
                <%
                    MachineService ms = new MachineService();
                    for (Machine m : ms.findAll()) {
                %>


                <option name ="referenceId" value="<%=m.getId()%>"><%=m.getId()%> </option>

                <%}%>
            </select>
            <p style="text-align: center;"><input type="submit" class="btn btn-dark btn-outline-secondary" value="Afficher les machines" name="valider" /></p>

        </form>

        <%
            String reference = request.getParameter("referenceId");

            int referenceId = 0;

            if (reference != null && !reference.isEmpty()) {
                try {
                    referenceId = Integer.parseInt(reference);

                } catch (NumberFormatException e) {

                }

            }

            ReferenceService rfs = new ReferenceService();
            Reference ref = rfs.findById(referenceId);
            List<Machine> tous_machine = ms.findByReference(ref);
        %>
 
  <fieldset>
                <legend>Liste des Machines</legend>

                <table border="1" class="tab">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Reference </th>
                            <th>Prix</th>
                            <th>Marque</th>
                            
                        </tr>
                    </thead>
                    <tbody  >
                           <%
                    for (Machine m : tous_machine) {
                %>
                <tr>
                    <td><%= m.getId()%></td>
                    <td><%= m.getReference().getLibelle() %></td>
                    <td><%= m.getPrix()%></td>
                    <td><%= m.getMarque().getLibelle()%></td>
                </tr>
                <%
                    }
                %>
                       
                    </tbody>
                </table>

            </fieldset>
         </fieldset>
        
        
            </div>
        
        
        
            <form method="GET" action="MachineController">
               
            </form>
          
          
        </form>            
</body>
</html>
