<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.example.demo1.Users" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <script src="jquery-2.1.4.js"></script>
    <title>JSP - Hello World</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/add.css">
</head>
<body>
<nav id="navbar-example2" class="navbar navbar-light bg-light px-3">
    <a class="navbar-brand" href="#">Navbar</a>
    <ul class="nav nav-pills">

        <%
            if (!session.isNew()) {
                out.print("<li class=\"nav-item\">\n" +
                        "<div class=\"dropdown\">"+
                        "<h3 class=\"dropbtn\">" + session.getAttribute("name") + "</h3>" +
                        "<div class=\"dropdown-content\" >"+
                        "<a href = \"/Informations?info=getHistory\" > Historie hledání </a >"+
                        "<a href = \"/Informations?info=getInfo\" > Osobní údaje </a >"+
                        "<a href = \"#\" > Link 3 </a >"+
                        "</div >"+
                        "</div >"+
                                "</li>\n" +
                                "<li class=\"nav-item\">\n" +
                                "<a class=\"nav-link\" href=\"/logReg?direction=logout\">Logout</a>\n" +
                                "</li>");
            } else {
                out.print("<li class=\"nav-item\">\n" +
                        "            <a class=\"nav-link\" href=\"register.jsp\">Register</a>\n" +
                        "        </li>\n" +
                        "        <li class=\"nav-item\">\n" +
                        "            <a class=\"nav-link\" href=\"login.jsp\">Login</a>\n" +
                        "        </li>");
            }
        %>
    </ul>
</nav>

<div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <form action="/hello-servlet" method="post">
            <div class="input_fields_wrap">
                <label for="firsturl">Odkazy: </label>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="firsturl" name="url" placeholder="Vložte odkaz:">
                    <div class="input-group-append">
                        <button onclick="document.getElementById('firsturl').value = ''"
                                class="btn btn-outline-info reset_field">Resetovat
                        </button>
                    </div>
                </div>
            </div>
            <button class="add_field_button btn btn-primary">Přidat odkaz</button>
            <br><br>
            <input type="submit" value="Odeslat" class="btn btn-primary">
        </form>
    </div>
    <div class="col-md-4"></div>
</div>

<div class="loader-wrapper">
    <span class="loader"><span class="loader-inner"></span></span>
</div>

</body>
</html>

<script>
    $(window).on("load", function () {
        $(".loader-wrapper").fadeOut("slow");
    });
</script>

<script>
    $(document).ready(function () {
        var max_fields = 20; //maximum input boxes allowed
        var wrapper = $(".input_fields_wrap"); //Fields wrapper
        var add_button = $(".add_field_button"); //Add button ID

        var x = 1; //initlal text box count
        $(add_button).click(function (e) { //on add input button click
            e.preventDefault();
            if (x < max_fields) { //max input box allowed
                x++; //text box increment
                $(wrapper).append('<div class="input-group mb-3"><input placeholder="Vložte odkaz: " type="text" name="url" class="form-control"><div class="input-group-append"><button class="btn btn-outline-danger remove_field" type="button">Odebrat</button></div></div>'); //add input box
            }
        });

        $(wrapper).on("click", ".remove_field", function (e) { //user click on remove text
            e.preventDefault();
            $(this).parent('div').parent('div').remove();
            x--;
        })
        $(wrapper).on("click", ".reset_field", function (e) { //user click on remove text
            e.preventDefault();
            $(this).parent('div').parent('div').reset();
            x--;
        })
    });
</script>