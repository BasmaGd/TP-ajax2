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
    <link href="style/csslocal.css" rel="stylesheet" type="text/css"/>
    <link href="style/newcss.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@include file="template/header.jsp" %>
<%@include file="template/menu.jsp" %>
<div class="content">
    <form method="get" action="EtudiantController">
        <fieldset>
            <legend>Informations Etudiant</legend>
            <table border="0">
                <tr>
                    <td>Nom</td>
                    <td><input id="nom" type="text" name="nom" value="" required=""/></td>
                </tr>
                <tr>
                    <td>Prenom</td>
                    <td><input id="prenom" type="text" name="prenom" value="" required="" /></td>
                </tr>
                <tr>
                    <td>Ville</td>
                    <td>
                        <select id="ville" name="ville">
                            <option value="Rabat">Rabat</option>
                            <option value="Fes">Fes</option>
                            <option value="Marrakech">Marrakech</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Date de naissance</td>
                    <td><input id="date" type="date" name="dateNaissance" value="" required="" /></td>
                </tr>
                <tr>
                    <td>Sexe</td>
                    <td>M<input id="m" type="radio" name="sexe" value="homme" />
                        F<input id="f" type="radio" name="sexe" value="femme" checked="checked" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input name="op" type="submit" value="Envoyer" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
    <%
        EtudiantService es = new EtudiantService();
    %>
    <fieldset>
        <legend>Liste des étudiants</legend>
        <table border="1" class="tab">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Prenom</th>
                    <th>Ville</th>
                    <th>Date de naissance</th>
                    <th>Sexe</th>
                    <th>Supprimer</th>
                    <th>Modifier</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Etudiant e : es.findAll()) {
                %>
                <tr>
                    <td><%=e.getId()%></td>
                    <td><%=e.getNom()%></td>
                    <td><%=e.getPrenom()%></td>
                    <td><%=e.getVille()%></td>
                    <td><%=e.getDateNaissance()%></td>
                    <td><%=e.getSexe()%></td>
                    <td><a class="bndelete" href="EtudiantController?op=delete&id=<%=e.getId()%>" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet élément ?')">Supprimer</a></td>
                    <td><a class="bnupdate" href="EtudiantController?op=update&id=<%=e.getId()%>">Modifier</a></td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </fieldset>
</div>
</body>
</html>
