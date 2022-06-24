<%@ page import="java.sql.ResultSet" %>
<%@ page import="static java.util.Objects.isNull" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<script id="replace_with_navbar" src="partials/Navbar.js"></script>

<div class="row" style="text-align: center">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <h1>${hlaseni}</h1>
        <br/>
<form method="POST" action="/logReg?logReg=login">

    <label for="mail">E-mail: </label>
    <input type="text" name="mail" id="mail" required minlength="5" autofocus
           maxlength="30" placeholder="mail" title="Vyplntě prosím E-mail."/><br/><br/>

    <label for="password">Heslo: </label>
    <input type="password" name="password" id="password" required minlength="5"
           maxlength="30" />

    <br/><br/><br/>
    <input type="submit" value="Odeslat formulář" />

    <input type="reset" value="Vyprázdnit formulář" />
</form>
    </div>
    <div class="col-md-4"></div>
</div>

</body>
</html>