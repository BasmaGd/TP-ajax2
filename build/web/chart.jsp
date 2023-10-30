<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="ma.school.beans.Machine" %>
<%@ page import="ma.school.beans.Marque" %>
<%@ page import="ma.school.service.MachineService" %>
<%@ page import="ma.school.service.MarqueService" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="ma.school.util.HibernateUtil" %>

<%
MachineService machineService = new MachineService();
MarqueService marqueService = new MarqueService();

List<Marque> marques = marqueService.findAll();
Gson gson = new Gson();
JsonArray dataArray = new JsonArray();

for (Marque marque : marques) {
    JsonObject brandObject = new JsonObject();
    brandObject.addProperty("label", marque.getLibelle()); // Use the appropriate attribute or method
    int machineCount = marqueService.getCountByMarque(marque); // Implement this method in your service
    brandObject.addProperty("data", machineCount);
    dataArray.add(brandObject);
}

String jsonData = gson.toJson(dataArray);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Graphique avec Chart.js</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div style="width: 40%; margin: 0 auto;">
        <canvas id="machineChart" width="400" height="400"></canvas>
    </div>
    <script>
    var jsonData = <%= jsonData %>;

    var labels = [];
    var data = [];

    jsonData.forEach(function(item) {
        labels.push(item.label); // Brand names
        data.push(item.data); // Machine counts
    });

    var ctx = document.getElementById("machineChart").getContext("2d");
    var machineChart = new Chart(ctx, {
        type: "bar",
        data: {
            labels: labels,
            datasets: [
                {
                    label: "Number of Machines",
                    data: data,
                    backgroundColor: "rgba(75, 192, 192, 0.2)",
                    borderColor: "rgba(75, 192, 192, 1)",
                    borderWidth: 1
                }
            ]
        },
        options: {
            scales: {
                x: {
                    beginAtZero: true,
                },
                y: {
                    beginAtZero: true,
                }
            }
        }
    });
    </script>
</body>
</html>
