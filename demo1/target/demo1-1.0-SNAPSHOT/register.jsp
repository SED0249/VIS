<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html" charset=UTF-8" />
    <title>Title</title>
</head>
<body>

<h1>${reg}</h1>
<form method="POST" action="/logReg?logReg=register">

    <label for="mail">E-mail: </label>
    <input type="text" name="mail" id="mail" required minlength="5" autofocus
           maxlength="30" placeholder="mail" title="Vyplntě prosím E-mail."/><br/><br/>

    <label for="firstName">Jméno: </label>
    <input type="text" name="firstName" id="firstName" required minlength="5" autofocus
           maxlength="30" placeholder="jmeno" title="Vyplntě prosím své jméno."/><br/><br/>

    <label for="lastName">Přijmení: </label>
    <input type="text" name="lastName" id="lastName" required minlength="5" autofocus
           maxlength="30" placeholder="prijmeni" title="Vyplntě prosím své příjmení."/><br/><br/>

    <label for="password">Heslo: </label>
    <input type="password" name="password" id="password" required minlength="5"
           maxlength="30" /><br/><br>

    <label for="phoneNumber">Telefonní číslo: </label>
    <input type="text" name="phoneNumber" id="phoneNumber" required minlength="5"
           maxlength="15" /><br/><br>

    <br><br><br>
    <input type="submit" value="Odeslat formulář" />

    <input type="reset" value="Vyprázdnit formulář" />
</form>


</body>
</html>