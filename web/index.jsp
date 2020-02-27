<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix= "f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Gestion du supermarché</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>Liste des articles disponibles</h1>

            <a href="<c:url value="/GestionServlet"/>" class="btn btn-success" role="button">Ajouter un article</a>
            <a style="float:right" href="<c:url value="/LoginServlet"/>" class="btn btn-info" role="button">Gestion des articles</a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div>
                <form method="POST" action="AccueilServlet">
                    <label for="addArticlePanier">Code barre : </label>
                    <input type="number" id="addArticlePanier" name="addArticlePanier">

                    <input type="submit" name="btn" value="Ajouter au panier">
                </form>
            </div>

            <table class="table table-striped">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Code barre</th>
                        <th scope="col">Libellé</th>
                        <th scope="col">Prix HT</th>
                        <th scope="col">Taux TVA</th>
                        <th scope="col">Référence</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${applicationScope['articles'].values()}" var="article">
                        <tr>
                            <td><c:out value="${article.codeBarre}"/></td>
                            <td><c:out value="${article.libelle}"/></td>
                            <td><c:out value="${article.prixHT / 100} €"/></td>
                            <td><c:out value="${article.tauxTVA} %"/></td>
                            <td><c:out value="${article.reference}"/></td>
                            <td>
                                <c:url value="GestionServlet" var="url">
                                    <c:param name="codeBarre" value="${article.codeBarre}"/>
                                    <c:param name="btn" value="Modifier"/>
                                </c:url>
                                <a href="${url}" class="btn btn-primary" role="button">Modifier</a>
                            </td>
                            <td>
                                <c:url value="GestionServlet" var="url">
                                    <c:param name="codeBarre" value="${article.codeBarre}"/>
                                    <c:param name="btn" value="Supprimer"/>
                                </c:url>
                                <a href="${url}" class="btn btn-danger" role="button">Supprimer</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h1>Votre ticket de caisse</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <thead class="thead-light">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Libellé</th>
                    <th scope="col">Prix TTC</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${applicationScope['panier']}" var="article">
                    <c:set var="prixTTC" value="${(article.prixHT / 100) + ((article.prixHT / 100) * (article.tauxTVA / 100))}"/>
                    <tr>
                        <th scope="row"><c:out value="${article.codeBarre}"/></th>
                        <td><c:out value="${article.libelle}"/></td>
                        <td><f:formatNumber value="${prixTTC}" type="currency" currencySymbol="€"/></td>
                    </tr>
                </c:forEach>
                <tr>
                    <th scope="row">Total TTC</th>
                    <td colspan="2"><f:formatNumber value="${totalTTC}" type="currency" currencySymbol="€"/></td>
                </tr>
                <tr>
                    <th scope="row">Total TVA</th>
                    <td colspan="2"><f:formatNumber value="${totalTVA}" type="currency" currencySymbol="€"/></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>
