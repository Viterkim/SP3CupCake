<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="1;url=index.jsp">
        <title>Logging Out</title>
    </head>
    <body>
        <h1>Logging Out</h1>
        <%
            session.setAttribute("sessionbalance", "0");
            session.setAttribute("sessionusername", "Unknown");
        %>
    </body>
</html>
