<%-- 
    Document   : etudiantUpdate
    Created on : Oct 29, 2023, 2:21:10 PM
    Author     : DELL
--%>

<%@page import="ma.school.beans.Etudiant"%>
<%@page import="ma.school.service.EtudiantService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/newcsslocal.css" rel="stylesheet" type="text/css"/>
        <link href="style/css.css" rel="stylesheet" type="text/css"/>
        <link href="style/newcss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        EtudiantService es = new EtudiantService();
         int id = Integer.parseInt(request.getParameter("id"));
        Etudiant e1 =es.findById(id);
        %> 

        <%@include file="template/header.jsp" %>
        <%@include file="template/menu.jsp" %>
        <div class="content">
             <form method="post" action="EtudiantController?op=updateOK&idOK=<%=e1.getId()%>">
                <fieldset>
                    <legend>Informations Etudiant</legend>
                    <table border="0">
                        
                        <tr>
                            <td>Nom</td>
                            <td><input  type="text" name="nomOK" value="<%= e1.getNom()%>"/></td>
                        </tr>
                        <tr>
                            <td>Prenom</td>
                            <td><input type="text" name="prenomOK" value="<%= e1.getPrenom() %>" /></td>
                        </tr>
                        <tr>
                            <td>Ville</td>
                            <td>
                                <select id="ville" name="villeOK">
                                    <option >Rabat</option>
                                    <option >Fes</option>
                                    <option >Marrakech</option>

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Date de naissance</td>
                            <td><input id="date" type="date" name="dateNaissanceOK" value="<%= e1.getDateNaissance() %>" /></td>
                        </tr>
                        <tr>
                            <td>Sexe</td>
                            <td>M<input id="m" type="radio" name="sexeOK" value="homme" />
                                F<input id="f" type="radio" name="sexeOK" value="femme" checked="checked" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            
                            <td><input type="submit" class="bnupdate">Modifier</input></td>
                        </tr>
                    </table>
                         
            </form >
                </div>
    </body>
</html>