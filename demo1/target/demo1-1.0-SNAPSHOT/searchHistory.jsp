<%@ page import="java.util.List" %>
<%@ page import="com.example.demo1.Items" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/add.css">
</head>
<body>
    <%
        List<Items> items= (List<Items>) request.getAttribute("items");
        if (items==null || items.size()==0){
            out.println("<span>Nemáte žádnou historii vyhledávání.</span>");
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
</body>
</html>
