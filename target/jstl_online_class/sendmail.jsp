<%-- 
    Document   : sendmail
    Created on : Jul 19, 2015, 4:43:11 AM
    Author     : girish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
        <title>Compose Mail</title>
    </head>
    <body>
        <h1>Compose</h1>
        <table border="1">
                <tr>
                    <td>
                        <input type="email" name="to" id="to" placeholder="TO:"/>
                    </td>
                    <td><input type="text" name="subject" id="subject" placeholder="SUB:"/></td>
                    <td><input type="text" name="message" id="message" placeholder="MSG:"/></td>
                    <td><input type="submit" value="Send Message" id="sendButton"/></td>
                </tr>
        </table>

        <div id="ajaxResponse"></div>
        <script type="text/javascript">
            $(document).ready(function() {
             $('#sendButton').click(function(event) {
                var mailTo = $('#to').val();
                var mailSub = $('#subject').val();
                var mailMsg = $('#message').val();
                $.post('MailServlet', {
                        to : mailTo,
                        sub : mailSub,
                        msg : mailMsg,
                }, function(responseText) {
                        $('#ajaxResponse').text(responseText);
                });
        });
        });
 
        </script>
    </body>
</html>
