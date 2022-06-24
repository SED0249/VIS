<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo1.Items" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Výsledek</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/add.css">
</head>
<body>
<script id="replace_with_navbar" src="partials/Navbar.js"></script>
<div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4">

<%
    List<Items> items = (ArrayList<Items>)request.getAttribute("items");
    for (Items item:items) {%>
        <h1 class="textCenter"><%=item.getName()%></h1>
        <h3 class="textCenter"><%=item.getPrice()%></h3>
        <a href="<%=item.getUrl()%>"><img class="img detail-photo-container imageCont" src="<%=item.getImg()%>" alt="Obrázek"></a>
    <%}%>

    </div>
    <div class="col-md-4"></div>
</div>
</body>
</html>
