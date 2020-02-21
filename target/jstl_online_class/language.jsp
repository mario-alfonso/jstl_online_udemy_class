<%-- 
    Document   : language
    Created on : Jul 20, 2015, 10:17:25 AM
    Author     : girish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="lang" value="${param.country}" scope="session"/>
        <c:out value="${lang}"/>
        <c:redirect url="index.jsp"/>
        
    </body>
</html>
