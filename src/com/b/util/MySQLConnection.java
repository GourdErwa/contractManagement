package com.b.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * @author HuKaiMo on 2016/3/9.
 */
public class MySQLConnection {

    private static final String url = "jdbc:mysql://localhost/test?user=root&password=yqs2602555";

    public static Connection getConn() {

        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver"); //加载mysq驱动
            conn = DriverManager.getConnection(url);
        } catch (Exception e) {
            System.out.println("数据库关闭错误");
        }

        return conn;
    }

    public static void close(Connection conn, Statement stmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception ignored) {
        }
    }

    public static void close(Connection conn, Statement stmt) {
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception ignored) {
        }
    }

    public static void close(Connection conn, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception ignored) {
        }
    }
}
