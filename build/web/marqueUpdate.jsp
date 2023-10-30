<%-- 
    Document   : machineUpdate
    Created on : Oct 30, 2023, 6:16:44 PM
    Author     : DELL
--%>

<%@page import="ma.school.beans.Reference"%>
<%@page import="ma.school.service.ReferenceService"%>
<%@page import="ma.school.beans.Marque"%>
<%@page import="ma.school.service.MarqueService"%>
<%@page import="ma.school.beans.Machine"%>
<%@page import="ma.school.service.MachineService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/newcsslocal.css" rel="stylesheet" type="text/css"/>
        <link href="style/css.css" rel="stylesheet" type="text/css"/>
        <link href="style/newcss.css" rel="stylesheet" type="text/css"/>
        <link href="style/newcss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        MachineService es = new MachineService();
         int id = Integer.parseInt(request.getParameter("id"));
        Machine e1 =es.findById(id);
        %> 
        <%@include file="template/header.jsp" %>
        <%@include file="template/menu.jsp" %>
        <div class="content">
             <form method="get" action="MachineController?op=updateOK&idOK=<%=e1.getId()%>">
                <fieldset>
                    <legend>Informations Machine</legend>
                    <table border="0">
                        
                       <tr>
                            <td>Code</td>
                            <td><input  type="text" name="codeOK" value=""  required=""/></td>
                        </tr>
                        <tr>
                            <td>Libelle</td>
                            <td><input  type="text" name="libelleOK" value="" required="" /></td>
                        </tr>
                        
                        <tr>
                            <td><input type="submit" class="bnupdate"></input></td>
                        </tr>
                    </table>
                         
            </form >
                </div>
    </body>
</html>
