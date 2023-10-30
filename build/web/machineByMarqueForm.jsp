<%@page import="java.util.List"%>
<%@page import="ma.school.beans.Machine"%>
<%@page import="ma.school.service.MachineService"%>
<%@page import="ma.school.beans.Marque"%>
<%@page import="ma.school.service.MarqueService"%>
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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        

    </head>
    <body>
        <%@include file="template/header.jsp" %>
        <%@include file="template/menu.jsp" %>
        
        
        
        
             <div class="content">
         <form method="post" action="">
             
          
             
                <fieldset>
             
            <label for="marqueId">Sélectionnez l'ID de la marque</label>

            <select name="marqueId">
                <%
                    MachineService ms = new MachineService();
                    for (Machine m : ms.findAll()) {
                %>


                <option name ="marqueId" value="<%=m.getId()%>"><%=m.getId()%> </option>

                <%}%>
            </select>
            <p style="text-align: center;"><input type="submit" class="btn btn-dark btn-outline-secondary" value="Afficher les machines" name="valider" /></p>

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
 
        <script type="text/javascript">
    var canvas = document.getElementById('graphiqueMachines');
    var ctx = canvas.getContext('2d');

    var labels = []; // Noms des marques
    var data = [];   // Nombre de machines par marque

    // Remplissez les données en parcourant la liste de machines
    <%
    for (Machine m : tous_machine) {
    %>
        labels.push('<%= m.getMarque().getLibelle()%>');
        data.push(<%= m.getMarque().getMachines().size()%>);
    <%
    }
    %>

    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Nombre de Machines par Marque',
                data: data,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
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
                    <td><%= m.getReference()%></td>
                    <td><%= m.getPrix()%></td>
                    <td><%= m.getMarque().getLibelle()%></td>
                </tr>
                <%
                    }
                %>
                       
                    </tbody>
                </table>
<!--             <canvas id="graphiqueMachines" width="400" height="200"></canvas>-->

            </fieldset>
         </fieldset>
        
        
            </div>
        
        
            <form method="GET" action="MachineController">
               
            </form>
          
          
        </form>            
</body>
</html>
