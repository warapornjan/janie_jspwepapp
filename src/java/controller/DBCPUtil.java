/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.Connection;
import java.util.ResourceBundle;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCPUtil {

    private static Context CTX = null;

    private static ResourceBundle config = ResourceBundle.getBundle("databaseconfig");
    private static String datasource = config.getString("dbsource");

    private static Context getInitialContext() throws NamingException {
        if (CTX == null) {
            CTX = new InitialContext();
        }
        return CTX;
    }

    public static Connection getDatabaseConnectionPool() throws Exception {
        Context context = getInitialContext();
        DataSource ds   = (DataSource)context.lookup(datasource);
        
        return ds.getConnection();
    }
}
