package com.macortez.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@SuppressWarnings("unused")
public class UploadFileServlet {


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            InputStream inputStream = null;

                String title=(request.getParameter("title"));
                Part filePart = request.getPart("file_uploaded");
                String filename=getFileName(filePart);
                String user=request.getSession().getAttribute("user").toString();
                if (filePart != null) 
                {
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    inputStream = filePart.getInputStream();
                }
        
                try 
                {
                    Db_Connection dbconn=new Db_Connection();
                    Connection conn= dbconn.Connection();
                    
                    String sql = "INSERT INTO files (username,title,filename,file) values (?,?,?,?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, user);
                    statement.setString(2, title);
                    statement.setString(3, filename);
             
                    if (inputStream != null) 
                    {
                        statement.setBinaryStream(4, inputStream, (int) filePart.getSize());
                    }
                    
                    int row = statement.executeUpdate();
                    if (row > 0) 
                    {
                        //out.println("File uploaded!!!");
                        request.setAttribute("isUpload", "File uploaded!!");
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("signin.jsp");
                        
                        rs.include(request, response);
                    }
                    else
                    {
                        //out.println("Couldn't upload your file!!!");
                        request.setAttribute("isUpload", "Couldn't upload your file!!!");
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("signin.jsp");
                        rs.include(request, response);
                    }    

                }catch(Exception e){e.printStackTrace();}     
        }
    }
    
    private String getFileName(Part part) {
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}
		return null;
	}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
