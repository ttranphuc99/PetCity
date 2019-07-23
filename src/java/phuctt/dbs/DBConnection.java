/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.dbs;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Thien Phuc
 */
public class DBConnection implements Serializable {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection("jdbc:sqlserver://prj321.database.windows.net:1433;database=PetCity;user=phuctt@prj321;password={19091999+Phuc};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30");
        return conn;
    }
}
