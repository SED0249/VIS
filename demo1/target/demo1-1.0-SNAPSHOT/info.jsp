<%@ page import="com.example.demo1.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/add.css">
</head>
<body>
    <%
                Users user = (Users) request.getAttribute("user");
                out.println("<Span>Jméno: "+user.getFirstname()+"</Span>");
                out.println("<Span>Příjmení: "+user.getLastname()+"</Span>");
                out.println("<Span>Email:"+user.getEmail()+"</Span>");
                out.println("<Span>Telefonní číslo: "+user.getPhoneNumber()+"</Span>");
                out.println("<br/><br/>");
    %>
</body>
</html>
