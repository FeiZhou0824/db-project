package com.cydeo.day1;

import java.sql.*;

public class FlexibleNavigation {

    public static void main(String[] args) throws SQLException {


        String url = "jdbc:oracle:thin:@3.95.13.229:1521:XE";
        String username = "HR";
        String password= "hr";

        Connection conn = DriverManager.getConnection(url,username,password);
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery("SELECT * FROM REGIONS");

        /*
         * In order to access data in ResultSet object , we need to use cursor navigation methods :
         *
         * next() -move to next row and return true false according to if we have valid row
         * previous() -move to previous row and return true false according to if we have valid row
         * first() - move to first row from anywhere
         * last() - move to last row from anywhere
         * beforeFirst() - move to before first location from anywhere
         * afterLast() - move to after last location from anywhere
         * absolute(8) - move to any row by using row number , for example 8 in this case
         */

        rs.next();  //row 1
        System.out.println(rs.getString("region_id") + " "
                + rs.getString("region_name"));

        rs.last(); // last row, row 4
        System.out.println(rs.getString("region_id") + " "
                + rs.getString("region_name"));

        rs.first(); // row 1
        System.out.println(rs.getString("region_id") + " "
                + rs.getString("region_name"));
        rs.absolute(3); //row 3
        System.out.println(rs.getString("region_id") + " "
                + rs.getString("region_name"));

        rs.previous();
        System.out.println(rs.getString("region_id") + " "
                + rs.getString("region_name"));

        rs.beforeFirst();  // before first location
       // System.out.println(rs.getString("region_id") + " " + rs.getString("region_name"));
        rs.next(); //row 1 ;
        rs.afterLast(); // now we are at after last location, nothing is here
        rs.previous(); // now we are at last row



    }
}
