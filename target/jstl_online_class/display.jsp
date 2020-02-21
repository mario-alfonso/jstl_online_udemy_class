<%-- 
    Document   : display
    Created on : Jul 18, 2015, 11:58:30 PM
    Author     : girish
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.macortez.servlets.Db_Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display</title>
        
    </head>
    <body>
        <%  
            String id=(request.getParameter("id"));
            String f_n="";
            Blob file = null;
            byte[ ] fileData = null ;

            try
            {    
                Db_Connection dbconn=new Db_Connection();
                Connection conn= dbconn.Connection();
            
                String sqlString = "SELECT file,filename FROM files WHERE id = '"+id+"'";
                Statement myStatement = conn.createStatement();
                
                ResultSet rs=myStatement.executeQuery(sqlString);
                
                if (rs.next()) 
                {
                    f_n=rs.getString("filename");
                    file = rs.getBlob("file");
                    fileData = file.getBytes(1,(int)file.length());
                } else 
                {
                    out.println("file not found!");
                    return;
                }
                
                if(f_n.endsWith(".html"))
                response.setContentType("text/html");
                else if(f_n.endsWith(".css"))
                response.setContentType("text/css");
                else if(f_n.endsWith(".gif") || f_n.endsWith(".png") || 
                        f_n.endsWith(".jpeg")|| f_n.endsWith(".JPEG"))
                response.setContentType("image/gif");
                else if(f_n.endsWith(".zip"))
                response.setContentType("application/zip");
                else if(f_n.endsWith(".pdf"))
                response.setContentType("application/pdf");
                else
                response.setContentType("text/plain");
                response.setHeader("Content-Disposition", "inline");
                response.setContentLength(fileData.length);
                
                OutputStream output = response.getOutputStream();
                output.write(fileData);
                
                output.flush();
                
            } catch (SQLException ex) {Logger.getLogger(Logger.class.getName()).log(Level.SEVERE, null, ex);} 
        %>

        
    </body>
</html>
