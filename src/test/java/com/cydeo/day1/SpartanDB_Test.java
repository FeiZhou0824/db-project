package com.cydeo.day1;

import java.sql.*;

public class SpartanDB_Test {

    public static void main(String[] args) throws SQLException {

        String url = "jdbc:oracle:thin:@3.95.13.229:1521:XE";
        String username = "SP";
        String password= "SP";

        Connection conn = DriverManager.getConnection(url,username,password);
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery("SELECT * FROM SPARTANS");

        // This table has SPARTAN_ID,name,gender,greated_at, updated_at


    }


}
