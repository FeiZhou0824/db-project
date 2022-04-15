package com.cydeo.day2;

import com.cydeo.utility.DB_Util;

import java.sql.*;

public class GettingColumnInformation {

    public static void main(String[] args) throws SQLException {


    /*
        ResultSet object only store Row data
        It does not store any column information
        like column names , column data type , column counts
        In order to get column information
        We need to get  ResultSetMetaData object from ResultSet

        What is MetaData?  It's data about data
        ResultSetMetaData hold information about the ResultObject
        like column name column data type and count

     */


        String url = "jdbc:oracle:thin:@54.236.150.168:1521:XE" ;
        String username = "hr" ;
        String password = "hr" ;

        Connection conn = DriverManager.getConnection(url,username,password) ;
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs   = stmt.executeQuery("SELECT * FROM COUNTRIES") ;

        // We want to extract column information from above ResultSet object
        // First we need to ResultSetMetaData object by calling below method

        ResultSetMetaData resultSetMetaData = rs.getMetaData();

        // This ResultSetMetaData has 2 methods we care about
        //  getColumnCount method to get the count of column
        //  getColumnName or getColumnLabel using 1 based index

        System.out.println("resultSetMetaData.getColumnCount() = " + resultSetMetaData.getColumnCount());

        System.out.println("resultSetMetaData.getColumnName(2) = " + resultSetMetaData.getColumnName(2));


        int totalColumnCount = resultSetMetaData.getColumnCount();

        for (int columnIndex = 1; columnIndex <=totalColumnCount ; columnIndex++) {
           // System.out.println("resultSetMetaData.getColumnName("+columnIndex +") = " + resultSetMetaData.getColumnName(columnIndex));
            System.out.println(resultSetMetaData.getColumnName(columnIndex));
        }




    }
}
