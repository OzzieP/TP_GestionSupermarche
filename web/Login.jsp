<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Connexion</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
    <h1>Connexion</h1>

    <form action="LoginServlet" method="POST">

        <div class="form-group w-25">
            <label for="pseudo">Pseudo : </label>
            <input   class="form-control" id="pseudo" type="text" placeholder="Pseudo" name="pseudo" required>

        </div>

        <div  p-4 class="form-group w-25">
            <label for="password">Mot de passe : </label>
            <input  class="form-control"  id="password" type="password" placeholder="Mot de passe" name="password" required>

        </div>

        <div>
            <input  class="btn btn-success" class="form-control" type="submit" name="btn" value="Se connecter">
        </div>

        <div>
            <a href="<c:url value="/AccueilServlet"/>" class="btn btn-primary" role="button">Retour vers ticket de caisse</a>
        </div>

    </form>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

</body>
</html>