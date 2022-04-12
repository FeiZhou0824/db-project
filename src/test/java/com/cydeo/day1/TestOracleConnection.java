package com.cydeo.day1;

import java.sql.*;

public class TestOracleConnection {

    public static void main(String[] args) throws SQLException {

       // Step1: Create connection by providing connection information
        // this is connection JDBC url, AKA connection string
        //syntax look like this jdbc: DatabaseType:subprotocal:@Host:post:sid

        String url = "jdbc:oracle:thin:@3.95.13.229:1521:XE";
        String username = "HR";
        String password= "hr";

        // now JDBC provide utility class called DriverManager with many methods
        // the getConnection method accept 3 parameters url, username, password
        // according this information,
        // it will first look for driver of the database type you are connecting to
        // once it's found,use the rest of connection information like
        // host ip, username password, port, sid to make connection
        // MAKE SURE YOUR CONNECTION WORK MANUALLY ,
        // ANYTHING DOES NOT WORK MANUALLY WILL NOT WORK AUTOMATION

        Connection conn = DriverManager.getConnection(url, username,password);
        System.out.println("successfully connected");

        // Once we have the connection, now usr this connection object to creat statement object

        Statement stmt = conn.createStatement();

        // once we have statement object, now we can execute query to get ResultSet
        //ResultSet object store all the row data
        // it uses iterator to move through the row using cursor
        ResultSet rs = stmt.executeQuery("SELECT * FROM REGIONS");

        //By default, the cursor(pointer) of the ResultSet object is at a location know as BeforeFirst,basically right before the first row
        //in order to get to the first row, you need to call next() method
        //next method move your pointer to next row
        //it will return true if there is valid next row
        //false if there is no more valid row
        rs.next(); // now we are at first row

        // the resulting data has 2 column REGION_ID, REGION_NAME
        // IN ORDER TO ACCESS THE CELL VALUE,We can use getX(X here is data type) method that accept 1 parameter
        //either using column name or suing 1 based index
        //getString, getInt, get

        System.out.println("rs.getString(\"REGION_ID\") = " + rs.getString("REGION_ID"));

        System.out.println("rs.getString(\"region_name\") = " + rs.getString("region_name"));

        // you can also use column index
        System.out.println("rs.getString(1) = " + rs.getString(1));
        System.out.println("rs.getString(2) = " + rs.getString(2));

        // now we want to move to 2nd row
        rs.next();
        System.out.println("rs.getString(\"region_id\") = " + rs.getString("region_id"));
        System.out.println("rs.getString(\"region_name\") = " + rs.getString("region_name"));

        // now we want to move to 3rd row
        rs.next();
        System.out.println("rs.getString(\"region_id\") = " + rs.getString("region_id"));
        System.out.println("rs.getString(\"region_name\") = " + rs.getString("region_name"));

        // now we want to move to 4th row
        rs.next();
        System.out.println("rs.getString(\"region_id\") = " + rs.getString("region_id"));
        System.out.println("rs.getString(\"region_name\") = " + rs.getString("region_name"));

        System.out.println("rs.next() = " + rs.next());

    }
}
