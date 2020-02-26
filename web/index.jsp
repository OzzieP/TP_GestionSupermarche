<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="Classes.Article" %>

<%--
  Created by IntelliJ IDEA.
  User: legen
  Date: 26/02/2020
  Time: 09:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Gestion du supermarché </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<H1>Liste des articles</H1>

<body>
<table>
<%

   HashMap hm  = (HashMap) application.getAttribute("articles");

  for (Object value : hm.values())
  {
      Article article = (Article) value; %>
    <td>

        <tr> <br> Code Barre   : "  <%=  article.getCodeBarre() %></tr>
        <tr>  </tr>
        <tr> &nbsp;  Article  : "  <%=  article.getLibelle() %></tr>

    </td>

    <td>
        <tr>
            <div class="btn btn-info">
            <c:url value="GestionServlet" var="url">
                <c:param name="codeBarre" value="${article.getCodeBarre()}"/>
                <c:param name="btn" value="Modifier"/>
            </c:url>
            <a &nbsp; href="${url}">Modifier</a>
        </div>
        </tr>

            <tr>
            <div class="btn btn-danger">
                <c:url value="GestionServlet" var="url">
                    <c:param name="codeBarre" value="${article.getCodeBarre()}"/>
                    <c:param name="btn" value="Supprimer"/>
                </c:url>
                <a  &nbsp; href="${url}">Supprimer</a>
            </div>
            </tr>

    </td>

 <% } %>
</table>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>
