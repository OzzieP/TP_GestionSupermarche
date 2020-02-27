<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Gestion des articles</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<h1>Gérer les articles</h1>

<div>
    <h2>Ajouter un article</h2>
    <form method="POST" action="GestionServlet">
        <label for="addCodeBarre">Code barre : </label>
        <input class="form-control"  id="addCodeBarre" type="number" name="addCodeBarre">

        <label for="addReference">Référence : </label>
        <input  class="form-control" id="addReference" type="text" name="addReference">

        <label for="addLibelle">Libellé : </label>
        <input  class="form-control" id="addLibelle" type="text" name="addLibelle">

        <label for="addPrixHT">Prix HT (en centimes) : </label>
        <input class="form-control"  id="addPrixHT" type="number" name="addPrixHT">

        <label for="addTauxTVA">Taux TVA : </label>
        <select id="addTauxTVA" name="addTauxTVA">
            <option value="0">5,5 %</option>
            <option value="1">20 %</option>
        </select>

        <input  class="btn btn-success" type="submit" name="btn" value="Ajouter">
    </form>
</div>

<div>
    <h2>Modifier un article</h2>
    <form method="POST" action="GestionServlet">
        <label for="updateCodeBarre">Code barre : </label>
        <input  class="form-control" disabled id="updateCodeBarre" type="text" name="updateCodeBarre" value="${applicationScope['selectedArticle'].codeBarre}">

        <label for="updateReference">Référence : </label>
        <input class="form-control"  id="updateReference" type="text" name="updateReference" value="${applicationScope['selectedArticle'].reference}">

        <label for="updateLibelle">Libellé : </label>
        <input class="form-control"  id="updateLibelle" type="text" name="updateLibelle" value="${applicationScope['selectedArticle'].libelle}">

        <label for="updatePrixHT">Prix HT (en centimes) : </label>
        <input  class="form-control" id="updatePrixHT" type="number" name="updatePrixHT" value="${applicationScope['selectedArticle'].prixHT}">

        <label for="updateTauxTVA">Taux TVA : </label>
        <select id="updateTauxTVA" name="updateTauxTVA">
            <option value="0">5,5 %</option>
            <option value="1">20 %</option>
        </select>

        <input  class="btn btn-success" type="submit" name="btn" value="Modifier">
    </form>
</div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>
