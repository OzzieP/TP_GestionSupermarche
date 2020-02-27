<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Connexion</title>
</head>
<body>
    <h1>Connexion</h1>
    <form action="LoginServlet" method="POST">
        <label for="pseudo">Pseudo : </label>
        <input id="pseudo" type="text" placeholder="Pseudo" name="pseudo" required>

        <label for="password">Mot de passe : </label>
        <input id="password" type="password" placeholder="Mot de passe" name="password" required>

        <input type="submit" name="btn" value="Se connecter">
    </form>

    <div>
        <a href="<c:url value="/GestionServlet"/>" class="btn btn-primary" role="button">Retour vers ticket de caisse</a>
    </div>

</body>
</html>