<%@ page import="com.example.demo1.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/add.css">
</head>
<body>
<script id="replace_with_navbar" src="partials/Navbar.js"></script>
<div class="row" style="text-align: center">
    <div class="col-md-4"></div>
    <div class="col-md-4">
    <%
                Users user = (Users) request.getAttribute("user");
                out.println("<br/><br/><Span><H2>Jméno: </H2>"+user.getFirstname()+"</Span><br/><br/>");
                out.println("<Span><H2>Příjmení: </H2>"+user.getLastname()+"</Span><br/><br/>");
                out.println("<Span><H2>Email: </H2>"+user.getEmail()+"</Span><br/><br/>");
                out.println("<Span><H2>Telefonní číslo: </H2>"+user.getPhoneNumber()+"</Span><br/><br/>");
    %>
    </div>
    <div class="col-md-4"></div>
</div>
</body>
</html>
