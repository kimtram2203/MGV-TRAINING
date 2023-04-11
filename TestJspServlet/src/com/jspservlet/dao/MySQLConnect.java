package com.jspservlet.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class MySQLConnect {
	public static Connection connectDb() throws SQLException {
		
		/*
		 * String jdbcURL = "jdbc:mysql://localhost:3306/bookstore"; String jdbcUsername
		 * = "root"; String jdbcPassword = "123456";
		 */

		Connection jdbcConnection;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

		} catch (ClassNotFoundException e) {
			throw new SQLException(e);
		}
		jdbcConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "2609200126092001");
		System.out.println("Connected");
		return jdbcConnection;
	}

	public static void disconnect(Connection jdbcConnection) throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}
}
