<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <html>
    <head>
        
        <fmt:setLocale value="${lang}"/>
        <fmt:bundle basename="jstl.international.message">
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>
            <fmt:message key="login"/>
        </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="icon" type="image/png" href="images/icon.png">
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
    </head>
    <body>
        <c:if test="${sessionScope.user ne null}">
            <jsp:forward page="signin.jsp">
                <jsp:param name="username" value="${sessionScope.user}"/>
                <jsp:param name="password" value="${sessionScope.pass}"/>
            </jsp:forward>
        </c:if>
        <div class="container">
             <!-- Codrops top bar -->
            <div class="codrops-top">
                <a href="">
                    <strong>JSTL : </strong> RESPONSIVE CONTENT NAVIGATOR
                </a>
                <span class="right">
                    <a href="">
                        <strong>
                                <fmt:message key="author"/>  
                        </strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
            <header>
                <h1><fmt:message key="login"/> <span>with JSTL and JSP</span></h1>
                   <form action="language.jsp" method="POST">
                        <select name="country">
                            <c:choose>
                                <c:when test="${lang eq 'ar_SA'}">
                                    <option value="ar_SA" selected="true">Arabic</option>
                                    <option value="en_US">US</option>        
                                </c:when>
                                <c:when test="${lang eq 'en_US'}">
                                    <option value="ar_SA">Arabic</option>
                                    <option value="en_US" selected="true">US</option>                                            
                                </c:when>
                                <c:otherwise>
                                    <option value="ar_SA">Arabic</option>
                                    <option value="en_US">US</option>        
                                </c:otherwise>    
                            </c:choose>    
                        </select>
                                <input type="Submit" value="<fmt:message key="change_lang"/>"/>    
                        </form>
                    <nav class="codrops-demos">
                    </nav>
            </header>
            <section>
                <font color="red">
                    <c:if test="${param.wrongUser ne null}">
                    ${param.wrongUser}
                    </c:if>
                </font>
            </section>
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="signin.jsp" autocomplete="on" 
                                   method="post"> 
                                <h1>
                                        <fmt:message key="login"/>  
                                </h1> 
                                <p> 
                                    <label for="username" class="uname" 
                                           data-icon="u" > 
                                                <fmt:message key="username"/>  
                                    </label>
                                    <input id="username" name="username" 
                                           required="required" type="text" 
                                           placeholder="myusername"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" 
                                           data-icon="p"> 
                                                <fmt:message key="password"/>  
                                    </label>
                                    <input id="password" name="password" 
                                           required="required" type="password" 
                                           placeholder="eg. X8df!90EO" /> 
                                </p>
     
                                <p class="login button"> 
                                        <input type="submit" 
                                               value="<fmt:message key="login"/>" />
                                    
				</p>
                                <p class="change_link">
                                        <fmt:message key="not_a_member"/>  
                                    <a href="registration.jsp" class="to_register">
                                         <fmt:message key="joinus"/>  
                                        
                                    </a>
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