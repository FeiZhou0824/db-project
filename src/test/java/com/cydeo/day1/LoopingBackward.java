package com.cydeo.day1;

import java.sql.*;

public class LoopingBackward {

    //Print all employees Employee_ID and First_Name backward
    // select * from employees (do not sort this)
    public static void main(String[] args) throws SQLException {



    String url = "jdbc:oracle:thin:@3.95.13.229:1521:XE";
    String username = "HR";
    String password= "hr";

    Connection conn = DriverManager.getConnection(url,username,password);
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    ResultSet rs = stmt.executeQuery("SELECT * FROM employees");

    // use afterLast() method to go to after last location
        // use previous() method to move backward
        // and check weather we have valid previous row or now
        // stop if there is no more valid row
        rs.afterLast();
        while(rs.previous()){
            System.out.println(rs.getString("EMPLOYEE_ID") + " "+
            rs.getString("first_name"));
        }
}
}