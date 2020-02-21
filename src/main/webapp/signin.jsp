<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    
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
            <fmt:message key="home"/>
            <c:out value="${param.username}"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="icon" type="image/png" href="images/icon.png">
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
        <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
    </head>
    <body>
        
        <c:choose>
            <c:when test="${sessionScope.user ne null}">
                <c:set var="user" value="${user}" scope="session"/>
                <c:set var="pass" value="${pass}" scope="session"/>
            </c:when>
            <c:otherwise>
                <c:set var="user" value="${param.username}" scope="session"/>
                <c:set var="pass" value="${param.password}" scope="session"/>
            </c:otherwise>
        </c:choose>
        
                 <%--Database Code--%>
        <sql:setDataSource var="reg" 
                           driver="com.mysql.jdbc.Driver" 
                           user="root" password="girish" 
                           url="jdbc:mysql://localhost:3306/jstlforfun"/>

        <sql:query dataSource="${reg}" var="result">
            select username,password from registration where username='${user}' 
            and password='${pass}';
        </sql:query>
        <c:set var="rowCount" value="${result.rowCount}"/>
            
        <c:choose>
            <c:when test="${rowCount eq 0}">
             <c:remove var="user"/>   
             <c:remove var="pass"/>
              <c:redirect url="index.jsp">
                  <c:param name="wrongUser" value="Wrong Username or Password"/>
              </c:redirect>    
            </c:when>
            
        </c:choose> 
                
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
		    <a href="<c:url value="signin.jsp"/>"  class="current-demo">
                        <fmt:message key="home"/>  
                    </a>
		    <a href="<c:url value="files.jsp"/>">
                        <fmt:message key="files"/>
                    </a>
                    <a href="<c:url value="logout.jsp"/>">
                        <fmt:message key="logout"/>
                    </a>
                    
		</nav>
                <h1><fmt:message key="dashboard"/> <span>with JSTL and JSP</span></h1>
            </header>
            <section>
                <table border="1" align="center">
                <tr>
                    <td>
                     <input type="email" name="to"  required="true" size="10" id="to" placeholder="TO:"/>
                    </td>
                    <td><input type="text" name="subject"   required="true" size="10" id="subject" placeholder="SUB:"/></td>
                    <td><input type="text" name="message"   required="true" id="message" placeholder="MSG:"/></td>
                    <td>
                        <input type="submit" value="<fmt:message key="send"/>" id="sendButton"/>
                    </td>
                </tr>
                </table>
                <div id="ajaxResponse"></div>
                <script type="text/javascript">
                        $(document).ready(function() {
                            $('#sendButton').click(function(event) {
                            var mailTo = $('#to').val();
                            var mailSub = $('#subject').val();
                            var mailMsg = $('#message').val();
                            $('#ajaxResponse').text("Sending message...");
                            $.post('MailServlet', {
                                to : mailTo,
                                sub : mailSub,
                                msg : mailMsg
                            }, function(responseText) {
                                //alert('Click OK to Send...');
                                $('#ajaxResponse').text(responseText);
                            });
                            });
                        });
            </script>
            </section>    
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <center><c:out value="${requestScope.isUpload}"/></center> 
                                <form method="post" action="UploadFileServlet" enctype="multipart/form-data">
                                <p> 
                                    <label for="title" class="uname" data-icon="T" > 
                                        <fmt:message key="title"/>
                                    </label>
                                    <input id="title" type="text" name="title" size="30" placeholder="filename.xxx"/>
                                </p>
                                <p> 
                                    <label for="file_uploaded" class="uname" data-icon="U" > 
                                        <fmt:message key="choose_file"/>
                                    </label>
                                    <input id="file_uploaded" type="file" name="file_uploaded" placeholder="CLICK TO UPLOAD"/>
                                </p>
                                <p class="login button">
                                <input type="submit" value="<fmt:message key="upload"/>">
                                </p>
                                </form>
                        </div>
                    </div>
                </div>  
            </section>

        </div>        
                
                
      </fmt:bundle>                                
    </body>
    
</html>
