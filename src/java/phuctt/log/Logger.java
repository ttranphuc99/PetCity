/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.log;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author Thien Phuc
 */
public class Logger implements ServletContextListener {
    private static FileWriter fw;
    private static BufferedWriter bw;
    private static PrintWriter pw;
    private static String realPath;

    public Logger() {
        
    }
    
    public static void log(String msg) {
        try {
            fw = new FileWriter(realPath + "log.txt", true);
            bw = new BufferedWriter(fw);
            pw = new PrintWriter(bw);
            
            Timestamp ts = new Timestamp((new Date()).getTime());
            pw.println(ts.toString() + " : " + msg);
        } catch (Exception e) {
            
        } finally {
            try {
                if (pw != null) pw.close();
                if (bw != null) bw.close();
                if (fw != null) fw.close();
            } catch (Exception e) {
                
            }
        }
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        realPath = sce.getServletContext().getRealPath("/");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}
