<%@page import="ma.school.beans.Reference"%>
<%@page import="ma.school.service.ReferenceService"%>
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
        <link href="style/newcss1.css" rel="stylesheet" type="text/css"/>
        <link href="style/css.css" rel="stylesheet" type="text/css"/>
        <link href="style/newcsslocal.css" rel="stylesheet" type="text/css"/>
        <link href="style/newcss.css" rel="stylesheet" type="text/css"/>
        <link href="style/newcss2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="template/header.jsp" %>
        <%@include file="template/menu.jsp" %>
        <div class="content">
            <form method="post" action="MachineController">
                <fieldset>
                    <legend>Informations Machine</legend>
                    <table border="0">
                        <tr>
                            <td>Reference</td>
                            <td><select id="reference" name="reference">
                                    <%
                                        ReferenceService rs = new ReferenceService();
                                        System.out.println(rs.findAll()) ;
                                        for (Reference r : rs.findAll()) {
                                    %>
                                    <option value="<%=r.getId()%>"><%=r.getLibelle()%></option>
                                    <%}%>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Prix</td>
                            <td><input id="prix" type="text" name="prix" value="" required="" /></td>
                        </tr>
                        <tr>
                            <td>Marque</td>
                            <td>
                                <select id="marque" name="marque">
                                    <%
                                        MarqueService ms = new MarqueService();
                                        for (Marque m : ms.findAll()) {
                                    %>
                                    <option value="<%=m.getId()%>"><%=m.getLibelle()%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Date Achat</td>
                            <td><input id="date" type="date" name="dateAchat" value="" required="" /></td>
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
                MachineService mms = new MachineService();
            %>
            <fieldset>
                <legend>Liste des Machines</legend>

<!--                <form method="GET" action="MachineController">
                    <select name="marqueFilter">
                        <option value="">Toutes les marques</option>
                        <%
                            for (Marque m : ms.findAll()) {
                        %>
                        <option value="<%=m.getId()%>"><%=m.getLibelle()%></option>
                        <%}%>
                    </select>
                    <input type="submit" value="Filtrer par Marque" />
                </form>-->
                <table border="1" class="tab">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Reference </th>
                            <th>Prix</th>
                            <th>Marque</th>
                            <th>Date d'achat</th>
                            <th>Supprimer</th>
                            <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Machine mm : mms.findAll()) {
                        %>
                        <tr>
                            <td><%=mm.getId()%></td>
                            <td><%=mm.getReference() %></td>
                            <td><%=mm.getPrix()%></td>
                            <td><%=mm.getMarque().getLibelle()%></td>
                            <td><%=mm.getDateAchat()%></td>
                            <td><a class="bndelete" href="MachineController?op=delete&id=<%=mm.getId()%>" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet élément ?')">Supprimer</a></td>
                            <td><a class="bnupdate" href="MachineController?op=update&id=<%=mm.getId()%>" onclick="return confirm('Êtes-vous sûr de vouloir modifier cet élément ?')">Modifier</a></td>
                        </tr>
                        <%}%>
                    </tbody>

                </table>
            </fieldset>
        </form>            
</body>
</html>
