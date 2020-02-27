<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Gestion du supermarché</title>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"--%>
    <%--          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div>
                <h1>Liste des articles disponibles</h1>
            </div>

            <div>
                <c:if test="${sessionScope.admin.admin}">
                    <c:url value="GestionServlet" var="url">
                        <c:param name="btn" value="Ajouter"/>
                    </c:url>
                    <a href="${url}" class="btn btn-success" role="button">Ajouter un article</a>
                    <a style="float:right" href="<c:url value="/LoginServlet"/>" class="btn btn-danger" role="button">Se
                        déconnecter</a>
                </c:if>
                <c:if test="${!sessionScope.admin.admin}">
                    <a style="float:right" href="<c:url value="/LoginServlet"/>" class="btn btn-info" role="button">Gestion
                        des articles</a>
                </c:if>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <c:if test="${!sessionScope.admin.admin}">
                <div>
                    <form  class="form-inline" method="POST" action="AccueilServlet">
                        <label for="addArticlePanier">Code barre : </label>
                        <input required class="form-control mb-2 mr-sm-2" type="number" id="addArticlePanier"
                               name="addArticlePanier">

                        <input class="btn btn-primary mb-2" type="submit" name="btn" value="Ajouter au panier">
                    </form>
                </div>
            </c:if>

            <table class="table table-striped">
                <thead class="thead-light">
                <tr>
                    <th scope="col">Code barre</th>
                    <th scope="col">Libellé</th>
                    <th scope="col">Prix HT</th>
                    <th scope="col">Taux TVA</th>
                    <th scope="col">Référence</th>
                    <c:if test="${sessionScope.admin.admin}">
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </c:if>
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

                        <c:if test="${sessionScope.admin.admin}">
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
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <c:if test="${!sessionScope.admin.admin}">
        <div class="row">
            <div class="col-md-12">
                <h1>Votre ticket de caisse</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-striped">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">Code barre</th>
                        <th scope="col">Libellé</th>
                        <th scope="col">Prix TTC</th>
                        <th scope="col">Montant TVA</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${applicationScope['panier']}" var="article">
                        <c:set var="prixTTC"
                               value="${(article.prixHT / 100) + ((article.prixHT / 100) * (article.tauxTVA / 100))}"/>
                        <c:set var="montantTVA" value="${(article.prixHT / 100) * (article.tauxTVA / 100)}"/>
                        <tr>
                            <th scope="row"><c:out value="${article.codeBarre}"/></th>
                            <td><c:out value="${article.libelle}"/></td>
                            <td><f:formatNumber value="${prixTTC}" type="currency" currencySymbol="€"/></td>
                            <td><f:formatNumber value="${montantTVA}" type="currency" currencySymbol="€"/></td>
                        </tr>
                    </c:forEach>
                    <tr class="table-info">
                        <td></td>
                        <th scope="row">Total TTC</th>
                        <td colspan="2"><f:formatNumber value="${applicationScope['totalTTC']}" type="currency"
                                                        currencySymbol="€"/></td>
                    </tr>
                    <tr class="table-warning">
                        <td></td>
                        <th scope="row">Total TVA</th>
                        <td colspan="2"><f:formatNumber value="${applicationScope['totalTVA']}" type="currency"
                                                        currencySymbol="€"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>
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
