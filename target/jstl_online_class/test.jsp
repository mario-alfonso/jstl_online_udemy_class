<%-- 
    Document   : test
    Created on : Jul 24, 2015, 9:55:16 PM
    Author     : girish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <jsp:useBean id="country" class="com.macortez.beans.Countries">
            <c:set target="${country}" property="name" value="India"/> 
        </jsp:useBean>

        <c:out value="${country.name}"/>
            
    </body>
</html>
