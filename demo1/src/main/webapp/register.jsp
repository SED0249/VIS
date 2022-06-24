<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Title</title>
</head>
<body>
<script id="replace_with_navbar" src="partials/Navbar.js"></script>
<div class="row" style="text-align: center">
    <div class="col-md-4"></div>
    <div class="col-md-4">


<h1>${reg}</h1>
<form method="POST" action="/logReg?logReg=register">
    <br/>
    <label for="mail">E-mail: </label>
    <input type="text" name="mail" id="mail" required autofocus
           maxlength="65" placeholder="mail" title="Vyplntě prosím E-mail."/><br/><br/>

    <label for="firstName">Jméno: </label>
    <input type="text" name="firstName" id="firstName" autofocus
           maxlength="30" placeholder="jmeno" title="Vyplntě prosím své jméno."/><br/><br/>

    <label for="lastName">Přijmení: </label>
    <input type="text" name="lastName" id="lastName" autofocus
           maxlength="30" placeholder="prijmeni" title="Vyplntě prosím své příjmení."/><br/><br/>

    <label for="password">Heslo: </label>
    <input type="password" name="password" id="password" required minlength="8"
           maxlength="30" title="Heslo musi obsahovat velke, male pismeno cislo a specialni znak." /><br/><br/>

    <label for="phoneNumber">Telefonní číslo: </label>
    <input type="text" name="phoneNumber" title="Zadejte telefonni cislo." id="phoneNumber" minlength="9"/>

    <br/><br/><br/>
    <input type="submit" value="Odeslat formulář" />

    <input type="reset" value="Vyprázdnit formulář" />
</form>


    </div>
    <div class="col-md-4"></div>
</div>

</body>
</html>