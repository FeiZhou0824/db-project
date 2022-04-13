package com.cydeo.day1;

import java.sql.*;

public class LoopingThroughResultSet {

    public static void main(String[] args) {


        String url = "jdbc:oracle:thin:@3.95.13.229:1521:XE";
        String username = "HR";
        String password= "hr";

        try{
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM REGIONS");

            //KEEP LOOPING TO NEXT ROW UNTIL THERE IS NO MORE ROW WHEN rs.next() return false
            //rs.next()move the pointer to next row
            //and return ture if there is valid next row and false if there is no valid next row
            // this will print all 4 rows REGION_NAME
            while(rs.next()){

                System.out.println("rs.getString(\"REGIONS_NAME\") = " + rs.getString("REGION_NAME"));
            }

            // where is your pointer right now ?? --?? AfterLast location
            // below ling will throw exception because we are at afterlast location
            //System.out.println("rs.getString(\"region_name\") = " + rs.getString("region_name"));



        }catch (SQLException e){
            System.out.println("Exception occurred " + e.getMessage());
        }
    }
}
