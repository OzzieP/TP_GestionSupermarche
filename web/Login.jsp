<%--
  Created by IntelliJ IDEA.
  User: matth
  Date: 26/02/2020
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Connexion</title>
</head>
<body>
<form action="LoginServlet" method="POST">
    <h1>Connexion</h1>

<div>
    <label><b>Nom d'utilisateur</b></label>
    <input type="text" placeholder="Entrer le nom d'utilisateur" name="username" required>
</div>

    <a href="<%=request.getContextPath()+response.encodeURL("/AccueilServlet")%>"> <input type="submit" id='' value='Liste des articles ' ></a>
</form>

<a href="<%=request.getContextPath()+response.encodeURL("/AccueilServlet")%>">Lien vers Ticket de caisse </a>

</body>
</html>
