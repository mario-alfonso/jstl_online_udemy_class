<%-- 
    Document   : logout
    Created on : Jul 18, 2015, 5:01:15 AM
    Author     : girish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:remove var="user"/>
        <c:remove var="password"/>
        <c:redirect url="index.jsp">
            <c:param name="visit" value="Hope you enjoyed it visit again!!"/>
        </c:redirect>
        
    </body>
</html>
