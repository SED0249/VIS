<%@ page import="java.sql.ResultSet" %>
<%@ page import="static java.util.Objects.isNull" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html" charset=UTF-8" />
    <title>Title</title>
</head>
<body>

<form method="POST" action="/logReg?logReg=login">

    <label for="mail">E-mail: </label>
    <input type="text" name="mail" id="mail" required minlength="5" autofocus
           maxlength="30" placeholder="mail" title="Vyplntě prosím E-mail."/><br/><br/>

    <label for="password">Heslo: </label>
    <input type="password" name="password" id="password" required minlength="5"
           maxlength="30" /><br/><br>

    <br><br><br>
    <input type="submit" value="Odeslat formulář" />

    <input type="reset" value="Vyprázdnit formulář" />
</form>


</body>
</html>