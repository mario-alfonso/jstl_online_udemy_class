package com.macortez.servlets;

import java.sql.*;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Db_Connection {

	public Connection Connection()
	{
		try 
		{
			/*
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection myConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jstlforfun", "root", "girish");
	            return myConnection;
			 */
			String url = "jdbc:postgresql://localhost/johndb";
			Properties props = new Properties();
			props.setProperty("user","john");
			props.setProperty("password","mikilo99");
			props.setProperty("ssl","true");
			Connection conn = DriverManager.getConnection(url, props);
			return conn;
		} catch ( SQLException ex ) {
			Logger.getLogger(Db_Connection.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}
}
