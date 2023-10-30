<%-- 
    Document   : referenceForm
    Created on : Oct 29, 2023, 7:52:28 PM
    Author     : DELL
--%>

<%@page import="ma.school.beans.Reference"%>
<%@page import="ma.school.service.ReferenceService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="style/css.css" rel="stylesheet" type="text/css"/>
    <link href="style/newcsslocal.css" rel="stylesheet" type="text/css"/>
    <link href="style/newcss.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <%@include file="template/header.jsp" %>
    <%@include file="template/menu.jsp" %>
    <div class="content">
        <form method="GET" action="ReferenceController">
            <fieldset>
                <legend>Informations Reference</legend>
                <table border="0">
                    <tr>
                        <td>Libelle</td>
                        <td><input id="libelle" type="text" name="libelle" value="" required /></td>
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
        
        <fieldset>
            <legend>Liste des marques</legend>
            <table border="1" class="tab">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Libelle</th>
                        <th>Supprimer</th>
                        <th>Modifier</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ReferenceService rs = new ReferenceService();
                        for (Reference r : rs.findAll()) {
                    %>
                    <tr>
                        <td><%= r.getId() %></td>
                        <td><%= r.getLibelle() %></td>
                        <td>
                            <a class="bndelete" href="ReferenceController?op=delete&id=<%= r.getId() %>"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet élément ?')">Supprimer</a>
                        </td>
                        <td>
                            <a class="bnupdate" href="ReferenceController?op=update&id=<%= r.getId() %>">Modifier</a>
                        </td>
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
