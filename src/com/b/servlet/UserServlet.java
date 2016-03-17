package com.b.servlet;

import com.b.model.ResultVO;
import com.b.model.User;
import com.b.util.Constant;
import com.b.util.MySQLConnection;
import com.b.util.PrintWriterUtil;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Wei.Li on 2016/3/9.
 */
public class UserServlet extends HttpServlet {

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        try {
            final String method = req.getParameter("method");
            switch (method) {
                case "login": {
                    login(req, res);
                    break;
                }
                case "getAllUsers": {
                    getAllUsers(req, res);
                    break;
                }
                case "getUsersByUserName": {
                    getUsersByUserName(req, res);
                    break;
                }
                case "createUser": {
                    createUser(req, res);
                    break;
                }
                case "updateUser": {
                    updateUser(req, res);
                    break;
                }
                case "deleteUser": {
                    deleteUser(req, res);
                    break;
                }
                default: {

                }
            }
        } catch (Exception e) {
            PrintWriterUtil.printWriterObjectToJson(res, new ResultVO(false, "请求执行过程出错:" + e.getMessage()));
        }
    }

    //登录
    private void login(ServletRequest request, ServletResponse response) throws Exception {

        final String userName = request.getParameter("userName");
        final String passWd = request.getParameter("passWd");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = MySQLConnection.getConn();
            ps = conn.prepareStatement("SELECT userName FROM user WHERE userName = ? AND passWd = ?");
            ps.setString(1, userName);
            ps.setString(2, passWd);

            rs = ps.executeQuery();
            final boolean first = rs.first();
            PrintWriterUtil.printWriterObjectToJson(response, first ? new ResultVO(true) : new ResultVO(false));
            if (first) {
                final HttpServletRequest servletRequest = (HttpServletRequest) request;
                servletRequest.getSession().setAttribute("loginUserName", userName);
                servletRequest.getSession().getServletContext().setAttribute("proName", Constant.PRO_NAME);
                servletRequest.getSession().getServletContext().setAttribute("proNameDescribe", Constant.PRO_NAME_DESCRIBE);
            }
        } finally {
            MySQLConnection.close(conn, ps, rs);
        }
    }


    //获取所有用户信息
    private void getAllUsers(ServletRequest request, ServletResponse response) throws Exception {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<User> list = new ArrayList<>();
        try {
            conn = MySQLConnection.getConn();
            ps = conn.prepareStatement("SELECT userName,phone,email FROM user WHERE userName != 'admin'");
            rs = ps.executeQuery();

            while (rs.next()) {
                final String userName = rs.getString(1);
                final String phone = rs.getString(2);
                final String email = rs.getString(3);
                list.add(new User(userName, phone, email));
            }
            PrintWriterUtil.printWriterObjectToJson(response, list);
        } finally {
            MySQLConnection.close(conn, ps, rs);
        }
    }

    //通过用户名获取某个用户信息
    private void getUsersByUserName(ServletRequest request, ServletResponse response) throws Exception {

        final String userName = request.getParameter("userName");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        User user = null;

        try {
            conn = MySQLConnection.getConn();
            ps = conn.prepareStatement("SELECT phone,email FROM user WHERE userName = ?");
            ps.setString(1, userName);
            rs = ps.executeQuery();

            while (rs.next()) {
                final String phone = rs.getString(1);
                final String email = rs.getString(2);
                user = new User(userName, phone, email);
            }
            PrintWriterUtil.printWriterObjectToJson(response, user);
        } finally {
            MySQLConnection.close(conn, ps, rs);
        }
    }

    //新建用户
    private void createUser(ServletRequest request, ServletResponse response) throws Exception {

        final String userName = request.getParameter("userName");
        final String passWd = request.getParameter("passWd");
        final String phone = request.getParameter("phone");
        final String email = request.getParameter("email");


        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = MySQLConnection.getConn();
            ps = conn.prepareStatement("SELECT userName FROM user WHERE userName = ?");
            ps.setString(1, userName);
            rs = ps.executeQuery();
            final boolean first = rs.first();

            if (first) {
                PrintWriterUtil.printWriterObjectToJson(response, new ResultVO(false, "用户名已存在"));
            } else {
                ps = conn.prepareStatement("INSERT INTO user (userName, passWd, phone, email) VALUE (?,?,?,?)");
                ps.setString(1, userName);
                ps.setString(2, passWd);
                ps.setString(3, phone);
                ps.setString(4, email);
                ps.execute();
                PrintWriterUtil.printWriterObjectToJson(response, new ResultVO(true, "创建成功"));
            }
        } catch (Exception e) {
            PrintWriterUtil.printWriterObjectToJson(response, new ResultVO(false, "创建过程出错 , error = " + e.getMessage()));
        } finally {
            MySQLConnection.close(conn, ps, rs);
        }
    }

    //修改用户
    private void updateUser(ServletRequest request, ServletResponse response) throws Exception {


        final String userName = request.getParameter("userName");
        final String passWd = request.getParameter("passWd");
        final String phone = request.getParameter("phone");
        final String email = request.getParameter("email");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = MySQLConnection.getConn();
            ps = conn.prepareStatement("UPDATE  user SET passWd=?,phone=?,email=? WHERE userName = ?");

            ps.setString(1, passWd);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, userName);

            ps.executeUpdate();
            PrintWriterUtil.printWriterObjectToJson(response, new ResultVO(true, "修改成功"));
        } finally {
            MySQLConnection.close(conn, ps);
        }
    }

    //删除用户
    private void deleteUser(ServletRequest request, ServletResponse response) throws Exception {

        final String userName = request.getParameter("userName");
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = MySQLConnection.getConn();
            ps = conn.prepareStatement("DELETE FROM user WHERE userName = ?");
            ps.setString(1, userName);
            ps.executeUpdate();
            PrintWriterUtil.printWriterObjectToJson(response, new ResultVO(true, "删除成功"));
        } catch (Exception e) {
            PrintWriterUtil.printWriterObjectToJson(response, new ResultVO(false, "删除失败:error=" + e.getMessage()));
        } finally {
            MySQLConnection.close(conn, ps);
        }
    }

}
