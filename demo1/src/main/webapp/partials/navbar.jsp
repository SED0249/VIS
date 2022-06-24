<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<nav id="navbar-example2" class="navbar navbar-light bg-light px-3">
    <a class="navbar-brand" href="../index.jsp">Domů</a>
    <ul class="nav nav-pills">

        <%
            if (!session.isNew() & session.getAttribute("name") != null) {
                out.print("<li class=\"nav-item\">\n" +
                        "<div class=\"dropdown\">" +
                        "<h3 class=\"dropbtn\">" + session.getAttribute("name") + "</h3>" +
                        "<div class=\"dropdown-content\" >" +
                        "<a href = \"/Informations?info=getHistory\" > Historie hledání </a >" +
                        "<a href = \"/Informations?info=getInfo\" > Osobní údaje </a >" +
                        "</div >" +
                        "</div >" +
                        "</li>\n" +
                        "<li class=\"nav-item\">\n" +
                        "<a class=\"nav-link\" href=\"/logReg?direction=logout\">Odhlasit</a>\n" +
                        "</li>");
            } else {
                out.print("<li class=\"nav-item\">\n" +
                        "            <a class=\"nav-link\" href=\"register.jsp\">Registrovat</a>\n" +
                        "        </li>\n" +
                        "        <li class=\"nav-item\">\n" +
                        "            <a class=\"nav-link\" href=\"login.jsp\">Prihlasit se</a>\n" +
                        "        </li>");
            }
        %>
    </ul>
</nav>