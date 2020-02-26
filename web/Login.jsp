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

    <input type="submit" name="btn" value="Se connecter">
</form>

<a href="<%=request.getContextPath()+response.encodeURL("/AccueilServlet")%>">Lien vers Ticket de caisse </a>

</body>
</html>
