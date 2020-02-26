<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Classes.Article" %>
<%@ page import="java.util.HashMap" %>
<%--
  Created by IntelliJ IDEA.
  User: legen
  Date: 26/02/2020
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gestion des articles</title>
</head>
<body>
<h1>Gérer les articles</h1>

<div>
    <h2>Ajouter un article</h2>
    <form method="POST" action="GestionServlet">
        <label for="addCodeBarre">Code barre : </label>
        <input id="addCodeBarre" type="text">

        <label for="addReference">Référence : </label>
        <input id="addReference" type="text">

        <label for="addLibelle">Libellé : </label>
        <input id="addLibelle" type="text">

        <label for="addPrixHT">Prix HT : </label>
        <input id="addPrixHT" type="number">

        <label for="addTauxTVA">Taux TVA : </label>
        <select id="addTauxTVA">
            <option value="0">5,5 %</option>
            <option value="1">20 %</option>
        </select>

        <input type="submit" name="btn" value="add">
    </form>
</div>

<% Article article = (Article) application.getAttribute("selectedArticle"); %>
<div>
    <h2>Modifier un article</h2>
    <form method="POST" action="GestionServlet">
        <label for="updateCodeBarre">Référence : </label>
        <input disabled id="updateCodeBarre" type="text" value="<% article.getCodeBarre(); %>">

        <label for="updateReference">Référence : </label>
        <input id="updateReference" type="text" value="<% article.getReference(); %>">

        <label for="updateLibelle">Libellé : </label>
        <input id="updateLibelle" type="text" value="<% article.getLibelle(); %>">

        <label for="updatePrixHT">Prix HT : </label>
        <input id="updatePrixHT" type="number" value="<% article.getPrixHT(); %>">

        <label for="updateTauxTVA">Taux TVA : </label>
        <select id="updateTauxTVA">
            <option value="0">5,5 %</option>
            <option value="1">20 %</option>
        </select>

        <input type="submit" name="btn" value="update">
    </form>
</div>
</body>
</html>
