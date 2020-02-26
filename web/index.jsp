<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<a href="<c:url value="/GestionServlet"/>" class="btn btn-success" role="button">Ajouter un article</a>
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Code barre</th>
        <th scope="col">Libellé</th>
        <th scope="col">Prix HT</th>
        <th scope="col"></th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${applicationScope['articles'].values()}" var="article">
        <tr>
            <td><c:out value="${article.codeBarre}"/></td>
            <td><c:out value="${article.libelle}"/></td>
            <td><c:out value="${article.prixHT}"/></td>
            <td>
                <div class="btn btn-info">
                    <c:url value="GestionServlet" var="url">
                        <c:param name="codeBarre" value="${article.codeBarre}"/>
                        <c:param name="btn" value="Modifier"/>
                    </c:url>
                    <a href="${url}">Modifier</a>
                </div>
            </td>
            <td>
                <div class="btn btn-danger">
                    <c:url value="GestionServlet" var="url">
                        <c:param name="codeBarre" value="${article.codeBarre}"/>
                        <c:param name="btn" value="Supprimer"/>
                    </c:url>
                    <a href="${url}">Supprimer</a>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>
