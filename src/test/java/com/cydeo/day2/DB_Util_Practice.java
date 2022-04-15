package com.cydeo.day2;

import com.cydeo.utility.DB_Util;

public class DB_Util_Practice {

    public static void main(String[] args) {

        String url = "jdbc:oracle:thin:@54.236.150.168:1521:XE" ;
        String username = "hr" ;
        String password = "hr" ;

        DB_Util.createConnection(url, username,password);

        DB_Util.runQuery("SELECT * FROM COUNTRIES");

        // THIS WILL PRINT OUT EVERY CELL IN THE RESULT
        DB_Util.displayAllData();

        //get second column from second row
        System.out.println("DB_Util.getCellValue(2,3) = " + DB_Util.getCellValue(2, 2));

        //get the country_name from 2nd row
        System.out.println("DB_Util.getCellValue(2,\"COUNTRY_NAME\") = " + DB_Util.getCellValue(2, "COUNTRY_NAME"));

        //GET ROW COUNT
        System.out.println("DB_Util.getRowCount() = " + DB_Util.getRowCount());

        //get column count

        System.out.println("DB_Util.getColumnCount() = " + DB_Util.getColumnCount());

        // get all column names as list
        System.out.println("DB_Util.getAllColumnNamesAsList() = " + DB_Util.getAllColumnNamesAsList());

        //get entire 3rd row as list

        System.out.println("DB_Util.getRowDataAsList(3) = " + DB_Util.getRowDataAsList(3));

        //get the entire second column as a list of string

        System.out.println("DB_Util.getRowDataAsList(2) = " + DB_Util.getRowDataAsList(2));

        //get the COUNTRY name column as list of string
        System.out.println("DB_Util.getColumnDataAsList(\"COUNTRY_NAME\") = " + DB_Util.getColumnDataAsList("COUNTRY_NAME"));

        // GET SECOND ROW AS MAP<String, String>
        System.out.println("DB_Util.getRowMap(2) = " + DB_Util.getRowMap(2));

        //get all rows as List of Map
        System.out.println("DB_Util.getAllRowAsListOfMap() = " + DB_Util.getAllRowAsListOfMap());

        //run this query and get the only cell in the result
        //select count(*) count from employees
        DB_Util.runQuery("SELECT COUNT(*) FROM EMPLOYEES");
        System.out.println("DB_Util.getFirstRowFirstColumn() = " + DB_Util.getFirstRowFirstColumn());


        // This will clean up ResultSet, Statement , Connection object resources just like you did
        DB_Util.destroy();


    }
}
