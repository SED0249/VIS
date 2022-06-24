<%@ page import="com.gargoylesoftware.htmlunit.html.HtmlImage" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gargoylesoftware.htmlunit.html.HtmlElement" %>
<%@ page import="com.example.demo1.Items" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/add.css">

<html>
<head>
    <meta charset="UTF-8">
    <title>Výsledek</title>
</head>
<body>
<%
    List<Items> items = (ArrayList<Items>)request.getAttribute("items");
    for (Items item:items) {%>
        <h1 class="textCenter"><%=item.getName()%></h1>
        <h3 class="textCenter"><%=item.getPrice()%></h3>
        <a href="<%=item.getUrl()%>"><img class="img detail-photo-container imageCont" src="<%=item.getImg()%>" alt="Obrázek"></a>
    <%}%>


</body>
</html>
