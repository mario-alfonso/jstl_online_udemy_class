<%-- 
    Document   : files
    Created on : Jul 18, 2015, 11:42:40 PM
    Author     : girish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <fmt:setLocale value="${lang}"/>
        <fmt:bundle basename="jstl.international.message">
        <title>
            <fmt:message key="files"/>
        </title>
         <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="icon" type="image/png" href="images/icon.png">
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
    </head>
    <body>
        <%--Database Code--%>
        <c:set var="currentuser" value="${sessionScope.user}"/>
        <sql:setDataSource var="reg" 
                           driver="com.mysql.jdbc.Driver" 
                           user="root" password="girish" 
                           url="jdbc:mysql://localhost:3306/jstlforfun"/>
        <sql:query dataSource="${reg}" var="result">
         select * from files where username='${currentuser}';
        </sql:query>
        
         <div class="container">
             <!-- Codrops top bar -->
            <div class="codrops-top">
                <a href="">
                    <strong>JSTL : </strong> Welcome
                </a>
                <span class="right">
                    <a href="">
                        <strong><c:out value="${user}"/></strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
            
            <header>
                <nav class="codrops-demos">
		    <a href="<c:url value="signin.jsp"/>">
                        <fmt:message key="home"/>
                    </a>
		    <a href="<c:url value="files.jsp"/>"  class="current-demo">
                        <fmt:message key="files"/>
                    </a>
                    <a href="<c:url value="logout.jsp"/>">
                        <fmt:message key="logout"/>
                    </a>
		</nav>
                <h1><fmt:message key="files"/> <span>with JSTL and JSP</span></h1>
            </header>
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper_content">
                        <div id="login" class="animate form">
                            <table width="100%">
                            <thead>
                             <tr>
                                 <th><strong>
                                         <fmt:message key="id"/>
                                     </strong></th>
                                 <th><strong>
                                         <fmt:message key="title"/>
                                     </strong></th>
                                 <th><strong>
                                     <fmt:message key="view_files"/>
                                     </strong></th>
                            </tr>
                            </thead>
                        <c:forEach var="row" items="${result.rows}">
                            <tr>
                                <td><c:out value="${row.id}"/></td>
                                <td><c:out value="${row.title}"/></td>
                                <td>
                                    <a href="display.jsp?id=${row.id}">
                                        <fmt:message key="view"/>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                            </table>      
                            
                        </div>
                    </div>
                </div>  
            </section>
        </div> 
        </fmt:bundle>  
    </body>
</html>
