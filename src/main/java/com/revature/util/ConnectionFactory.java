package com.revature.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
//  DB info here!---------------------------->>>>>>>>>
	private static final String un = "jonathan";
	private static final String pw = "password";
	private static final String url = "jdbc:oracle:thin:@ersdbinstance.cclccpvm73o8.us-east-2.rds.amazonaws.com:1521:ORCL";
	// Private Constructor to enforce usage of factory method
	private ConnectionFactory() {}
	//had to use variable for my driver connection due to env variables not working, will research the reasoning...
	public static Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			return DriverManager.getConnection(url,un,pw);
		} catch (SQLException e) {
			System.err.println("Error Code: " + e.getErrorCode());
			System.err.println("SQL State: " + e.getSQLState());
			System.err.println("Message: " + e.getMessage());
			throw new RuntimeException("Failed to get database connection");
		} catch (ClassNotFoundException e) {
			System.err.println("Failed to locate JDBC Driver");
			throw new RuntimeException("Failed to locate JDBC driver");
		}
	}
}
