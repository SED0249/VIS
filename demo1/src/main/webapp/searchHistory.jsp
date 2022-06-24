<%@ page import="java.util.List" %>
<%@ page import="com.example.demo1.Items" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/add.css">
</head>
<body>
<script id="replace_with_navbar" src="partials/Navbar.js"></script>
<div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4" style="text-align: center">
        <br/><br/>
    <%
        List<Items> items= (List<Items>) request.getAttribute("items");
        if (items==null || items.size()==0){
            out.println("<H2>Nemáte žádnou historii vyhledávání.</H2>");
        }else{
            for (int i=0;i<= items.size()-1;i++){
                Items item = items.get(i);
                int number = i+1;
                out.println("<H3>Item: "+number+"</H3>");
                out.println("<Span>Jméno: "+item.getName()+"</Span>");
                out.println("<Span>Cena:"+item.getPrice()+"</Span>");
                out.println("<Span><img class=\"img detail-photo-container imageCont\"src=\""+item.getImg()+"\" alt=\"Obrázek\"></Span>");
                out.println("<br/><br/>");
                            }
        }
    %>
    </div>
    <div class="col-md-4"></div>
</div>
</body>
</html>
