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
        <input id="addCodeBarre" type="number" name="addCodeBarre">

        <label for="addReference">Référence : </label>
        <input id="addReference" type="text" name="addReference">

        <label for="addLibelle">Libellé : </label>
        <input id="addLibelle" type="text" name="addLibelle">

        <label for="addPrixHT">Prix HT : </label>
        <input id="addPrixHT" type="number" name="addPrixHT">

        <label for="addTauxTVA">Taux TVA : </label>
        <select id="addTauxTVA" name="addTauxTVA">
            <option value="0">5,5 %</option>
            <option value="1">20 %</option>
        </select>

        <input type="submit" name="btn" value="Ajouter">
    </form>
</div>

<div>
    <h2>Modifier un article</h2>
    <form method="POST" action="GestionServlet">
        <label for="updateCodeBarre">Code barre : </label>
        <input disabled id="updateCodeBarre" type="text" name="updateCodeBarre" value="${applicationScope['selectedArticle'].codeBarre}">

        <label for="updateReference">Référence : </label>
        <input id="updateReference" type="text" name="updateReference" value="${applicationScope['selectedArticle'].reference}">

        <label for="updateLibelle">Libellé : </label>
        <input id="updateLibelle" type="text" name="updateLibelle" value="${applicationScope['selectedArticle'].libelle}">

        <label for="updatePrixHT">Prix HT : </label>
        <input id="updatePrixHT" type="number" name="updatePrixHT" value="${applicationScope['selectedArticle'].prixHT}">

        <label for="updateTauxTVA">Taux TVA : </label>
        <select id="updateTauxTVA" name="updateTauxTVA">
            <option value="0">5,5 %</option>
            <option value="1">20 %</option>
        </select>

        <input type="submit" name="btn" value="Modifier">
    </form>
</div>
</body>
</html>
