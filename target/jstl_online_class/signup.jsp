<%-- 
    Document   : signup
    Created on : Jul 18, 2015, 12:45:50 AM
    Author     : girish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%> 
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>

<!-- Read more: http://mrbool.com/how-to-send-email-in-jsp/29157#ixzz3gFF3jfs5 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <c:set var="username" value="${param.username}" scope="request"/>
        <c:set var="password" value="${param.password}"/>
        <c:set var="retype_password" value="${param.retype_password}"/>
        <c:set var="mob_no" value="${param.mob_no}" scope="request"/>
        <c:set var="email" value="${param.email}" scope="request"/>
        <c:set var="gender" value="${param.gender}"/>
        <c:set var="address" value="${param.address}"/>
        <c:set var="country" value="${param.country}"/>
        
        <%--Validating Users--%>
        <c:if test="${empty username}">
            <jsp:forward page="registration.jsp">
                <jsp:param name="invaliduser" value="*"/>
            </jsp:forward>
        </c:if>
        <c:if test="${empty password}">
            <jsp:forward page="registration.jsp">
                <jsp:param name="invalidpassword" value="*"/>
            </jsp:forward>
        </c:if>
        <c:if test="${empty retype_password}">
            <jsp:forward page="registration.jsp">
                <jsp:param name="invalidretype" value="*"/>
            </jsp:forward>
        </c:if>
        <c:if test="${password ne retype_password}">
            <jsp:forward page="registration.jsp">
                <jsp:param name="invalidpassword" value="password not equals"/>
            </jsp:forward>
        </c:if>
        <c:if test="${empty email}">
            <jsp:forward page="registration.jsp">
                <jsp:param name="invalidemail" value="*"/>
            </jsp:forward>
        </c:if>
        <c:if test="${empty mob_no}">
            <jsp:forward page="registration.jsp">
                <jsp:param name="invalidmob_no" value="*"/>
            </jsp:forward>
        </c:if>
        <c:if test="${empty email}">
            <jsp:forward page="registration.jsp">
                <jsp:param name="invalidemail" value="*"/>
            </jsp:forward>
        </c:if>
        <%--=======================================--%>
        
        <%--Database Code--%>
        <sql:setDataSource var="reg" 
                           driver="com.mysql.jdbc.Driver" 
                           user="root" password="girish" 
                           url="jdbc:mysql://localhost:3306/jstlforfun"/>

        <sql:query dataSource="${reg}" var="result">
            select username from registration where username='${username}' 
            or email='${email}';
        </sql:query>
        <c:set var="rowCount" value="${result.rowCount}"/>  
        <c:if test="${rowCount ne 0}">
            <jsp:forward page="registration.jsp">
                <jsp:param name="invaliduser" value="Username/email already taken"/>
            </jsp:forward>
            --%>
            <%--
            <c:redirect url="registration.jsp">
                <c:param name="username" value="Username already taken"/>
            </c:redirect>
            --%>
        </c:if>
        
        
        <sql:update dataSource="${reg}" var="count">
            insert into registration values('${username}','${password}',
            '${mobile_no}','${email}','${gender}','${address}','${country}');
        </sql:update>
        
            <%--Send Mail --%>
            <c:set var="to" value="${email}"/>
            <c:set var="from" value="clairvoyant.1947@gmail.com"/>
            <c:set var="host" value="localhost"/>
            
            
            <%--Everything ok forward to signin page --%>
            <jsp:forward page="signin.jsp">
                <jsp:param name="username" value="${username}"/>
                <jsp:param name="password" value="${password}"/>
            </jsp:forward>    
    </body>
</html>
