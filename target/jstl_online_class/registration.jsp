<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <fmt:setLocale value="${lang}"/>
        <fmt:bundle basename="jstl.international.message">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <link rel="icon" type="image/png" href="images/icon.png">
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
        <title>
            <fmt:message key="registration"/>
        </title>
    </head>
    <body>
        <jsp:useBean id="country" class="com.macortez.beans.Countries"/>
        <div class="container">
            <!-- Codrops top bar -->
            <div class="codrops-top">
                <a href="">
                    <strong>JSTL : </strong> RESPONSIVE CONTENT NAVIGATOR
                </a>
                <span class="right">
                    <a href="">
                        <strong>GIRISH KUMAR SHAKYA</strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
            <header>
                <h1><fmt:message key="registration_form"/> <span>with JSTL and JSP</span></h1>
            </header>

            
            <section>
            <div id="container_demo" >
            <a class="hiddenanchor" id="toregister"></a>
            <a class="hiddenanchor" id="tologin"></a>
            <div id="wrapper">
                <div id="login" class="animate form">
                    <form action="signup.jsp" method="post" autocomplete="on">
                        <h1><fmt:message key="sign_up"/></h1>
                        <p>
                            <font color="red">
                            <c:if test="${param.invaliduser ne null}">
                                ${param.invaliduser}
                            </c:if>
                            </font>
                            <label for="username" class="uname" data-icon="u">
                                <fmt:message key="your_username"/>
                            </label>
                            <input required="required" type="text" name="username" 
                                   value="${username}" placeholder="your username"/>
                        </p>
                        
                        <p>
                            <font color="red">
                            <c:if test="${param.invalidpassword ne null}">
                                ${param.invalidpassword}
                            </c:if>
                            </font>
                            <label for="password" class="youpasswd" data-icon="p"> 
                                <fmt:message key="your_password"/> 
                            </label>
                            <input id="password" type="password" required="required" name="password"
                                   placeholder="eg. X8df!90EO"/>
                        </p>
                        
                        <p>
                            <font color="red">
                            <c:if test="${param.invalidretype ne null}">
                                ${param.invalidretype}
                            </c:if>
                            </font>
                            <label for="retype_password" class="youpasswd" data-icon="p"> 
                                <fmt:message key="retype_password"/>
                            </label>
                            <input id="password" type="password" required="true" name="retype_password" 
                                   placeholder="eg. X8df!90EO"/>
                        </p>
                        
                        <p>
                            <font color="red">
                            <c:if test="${param.mob_no ne null}">
                                ${param.invalidmob_no}
                            </c:if>
                            </font>
                            <label for="mob_no" class="youmail" data-icon="m" > 
                                <fmt:message key="your_mob_no"/>
                            </label>
                            <input type="tel" name="mob_no" value="${mob_no}" placeholder="MOBILE NO."/>
                       </p>
                       
                       <p>
                            <font color="red">
                            <c:if test="${param.email ne null}">
                                ${param.invalidemail}
                            </c:if>
                            </font>
                            <label for="email" class="youmail" data-icon="e" >
                                <fmt:message key="your_email"/>
                            </label>
                            <input type="email" name="email" value="${email}" placeholder="EMAIL"/>
                      </p>
                      
                      <p>
                            <select name="gender">
                                <option value="MALE">MALE</option>
                                <option value="FEMALE">FEMALE</option>
                            </select>
                      </p>
                      
                      <p>
                          <input type="text" name="address"  placeholder="ADDRESS">
                      </p>
                      
                      <p>
                          <select name="country">
                                <c:forEach items="${country.country_value}" var="element" varStatus="loop">    
                                       <option value="${element}">${country.country_name[loop.index]}</option>
                                </c:forEach>
                            </select>
                       </p>
                       
                       <p class="signin button">
                            <input type="submit" value="<fmt:message key="sign_up"/>"/>
                       </p>         
                       <p class="change_link"> 
                           <fmt:message key="already_a_member"/>
                           <a href="<c:url value="index.jsp"/>" class="to_register"> 
                               <fmt:message key="go_and_login"/>
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
