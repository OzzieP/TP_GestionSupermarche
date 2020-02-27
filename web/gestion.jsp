<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Gestion des articles</title>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"--%>
    <%--          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>Gérer les articles</h1>

            <c:if test="${btn == 'Ajouter'}">
                <div>
                    <h2>Ajouter un article</h2>
                    <form method="POST" action="GestionServlet">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="addCodeBarre">Code barre : </label>
                                <input class="form-control" id="addCodeBarre" type="number" name="addCodeBarre">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="addReference">Référence : </label>
                                <input class="form-control" id="addReference" type="text" name="addReference">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="addLibelle">Libellé : </label>
                            <input class="form-control" id="addLibelle" type="text" name="addLibelle">
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="addPrixHT">Prix HT (en centimes) : </label>
                                <input class="form-control" id="addPrixHT" type="number" name="addPrixHT">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="addTauxTVA">Taux TVA : </label>
                                <select class="custom-select" id="addTauxTVA" name="addTauxTVA">
                                    <option value="0">5,5 %</option>
                                    <option value="1">20 %</option>
                                </select>
                            </div>
                        </div>

                        <input class="btn btn-success" type="submit" name="btn" value="Ajouter">
                    </form>
                </div>
            </c:if>

            <c:if test="${btn == 'Modifier'}">
                <div>
                    <h2>Modifier un article</h2>
                    <form method="POST" action="GestionServlet">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="updateCodeBarre">Code barre : </label>
                                <input class="form-control" readonly id="updateCodeBarre" type="text"
                                       name="updateCodeBarre" value="${selectedArticle.codeBarre}">
                            </div>

                            <div class="form-group col-md-6">
                                <label for="updateReference">Référence : </label>
                                <input class="form-control" id="updateReference" type="text" name="updateReference"
                                       value="${selectedArticle.reference}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="updateLibelle">Libellé : </label>
                            <input class="form-control" id="updateLibelle" type="text" name="updateLibelle"
                                   value="${selectedArticle.libelle}">
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="updatePrixHT">Prix HT (en centimes) : </label>
                                <input class="form-control" id="updatePrixHT" type="number" name="updatePrixHT"
                                       value="${selectedArticle.prixHT}">
                            </div>

                            <div class="form-group col-md-6">
                                <label for="updateTauxTVA">Taux TVA : </label>
                                <select class="custom-select" id="updateTauxTVA" name="updateTauxTVA">
                                    <c:if test="${selectedArticle.tauxTVA == 5}">
                                        <option value="0" selected>5,5 %</option>
                                        <option value="1">20 %</option>
                                    </c:if>
                                    <c:if test="${selectedArticle.tauxTVA == 20}">
                                        <option value="0">5,5 %</option>
                                        <option value="1" selected>20 %</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>

                        <input class="btn btn-primary" type="submit" name="btn" value="Modifier">
                    </form>
                </div>
            </c:if>
        </div>
    </div>
</div>

<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"--%>
<%--        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"--%>
<%--        crossorigin="anonymous"></script>--%>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>
</html>
