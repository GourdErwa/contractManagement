package com.b.util;

import java.sql.*;

/**
 * @author Wei.Li on 2016/3/9.
 */
public class MySQLConnection {

    //测试数据自动插入
    static {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = null;
            ps = null;
            rs = null;

            conn = MySQLConnection.getConn();
            ps = conn.prepareStatement("SELECT userName FROM user WHERE userName = 'admin'");
            rs = ps.executeQuery();
            final boolean first = rs.first();

            ps = conn.prepareStatement("INSERT INTO user (userName, passWd, phone, email) VALUE (?,?,?,?)");
            if (first) {
                for (int i = 0; i < 10; i++) {
                    String x = null;
                    try {
                        x = "测试用户-" + i;
                        ps.setString(1, x);
                        ps.setString(2, i + "");
                        ps.setString(3, "18601341988");
                        ps.setString(4, "liweityut@163.com");
                        ps.execute();
                    } catch (SQLException e) {
                        System.err.println("insert test user ,ignore .  key=" + x);
                    }
                }
            } else {
                ps.setString(1, "admin");
                ps.setString(2, "admin");
                ps.setString(3, "18601341988");
                ps.setString(4, "liweityut@163.com");
                ps.execute();
            }
        } catch (Exception e) {
            System.err.println("insert admin user error :" + e.getMessage());
        } finally {
            MySQLConnection.close(conn, ps, rs);
        }
    }


    //测试数据自动插入
    static {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = null;
            ps = null;
            rs = null;

            conn = MySQLConnection.getConn();
            ps = conn.prepareStatement("SELECT * FROM contract");
            rs = ps.executeQuery();
            final boolean first = rs.first();


            if (!first) {
                ps = conn.prepareStatement("INSERT INTO contract " +
                        "(state, name, userName1, userName2, engineeringSection,encodingBudget,contractAmount,shareAmount,shareRatio)" +
                        " VALUE (?,?,?,?,?,?,?,?,?)");
                for (int i = 0; i < 10; i++) {
                    String x = null;
                    try {
                        x = "合同-" + i;
                        ps.setInt(1, 0);
                        ps.setString(2, x);
                        ps.setString(3, "张三");
                        ps.setString(4, "李四");
                        ps.setString(5, "001");
                        ps.setString(6, "001-002");
                        ps.setString(7, "100");
                        ps.setString(8, "98");
                        ps.setString(9, "30");
                        ps.execute();
                    } catch (SQLException e) {
                        System.err.println("insert test user ,ignore .  key=" + x);
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("insert admin user error :" + e.getMessage());
        } finally {
            MySQLConnection.close(conn, ps, rs);
        }
    }

    public static Connection getConn() throws SQLException, ClassNotFoundException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(Constant.URL);
        } catch (Exception e) {
            System.out.println("数据库连过程发生错误:" + e.getMessage());
            throw e;
        }

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
