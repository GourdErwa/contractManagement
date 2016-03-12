package com.b.servlet;

import com.b.model.Contract;
import com.b.model.ResultVO;
import com.b.util.MySQLConnection;
import com.b.util.PrintWriterUtil;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Wei.Li on 2016/3/9.
 */
public class ContractServlet extends HttpServlet {

    /*
    private int id;
        // 合同状态
        private int c;

        private String
                // 合同名称
                name,
        // 甲方乙方
        userName1, userName2,
        // 工程段
        engineeringSection,
        // 概算编码
        encodingBudget,
        // 合同金额
        contractAmount,
        // 分摊金额
        shareAmount,
        // 分摊金额比例
        shareRatio;
     */
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
        } catch (SQLException e) {
            System.err.println("insert admin user error :" + e.getMessage());
        } finally {
            MySQLConnection.close(conn, ps, rs);
        }
    }

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        try {
            final String method = req.getParameter("method");
            switch (method) {
                case "getAllContracts": {
                    getAllContracts(req, res);
                    break;
                }
                case "getContractById": {
                    getContractById(req, res);
                    break;
                }
                case "createContract": {
                    createContract(req, res);
                    break;
                }
                case "updateContract": {
                    updateContract(req, res);
                    break;
                }
                case "deleteContract": {
                    deleteContract(req, res);
                    break;
                }
                default: {

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    //获取所有用户信息
    private void getAllContracts(ServletRequest request, ServletResponse response) throws SQLException, IOException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Contract> list = new ArrayList<>();
        try {
            conn = MySQLConnection.getConn();
            ps = conn.prepareStatement(
                    "SELECT id,state, name, userName1, userName2," +
                            " engineeringSection,encodingBudget,contractAmount,shareAmount,shareRatio FROM contract" +
                            "");
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(
                        new Contract(
                                rs.getInt(1), rs.getInt(2),
                                rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
                                rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)
                        )
                );
            }
            PrintWriterUtil.printWriterObjectToJson(response, list);
        } finally {
            MySQLConnection.close(conn, ps, rs);
        }
    }

    //通过用户名获取某个用户信息
    private void getContractById(ServletRequest request, ServletResponse response) throws SQLException, IOException {

        final String id = request.getParameter("id");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = MySQLConnection.getConn();
            ps = conn.prepareStatement(
                    "SELECT id,state, name, userName1, userName2," +
                            " engineeringSection,encodingBudget,contractAmount,shareAmount,shareRatio FROM contract" +
                            " WHERE id = ?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            Contract contract = null;
            while (rs.next()) {
                contract = new Contract(
                        rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)
                );
            }
            PrintWriterUtil.printWriterObjectToJson(response, contract);
        } finally {
            MySQLConnection.close(conn, ps, rs);
        }
    }

    //新建用户
    private void createContract(ServletRequest request, ServletResponse response) throws SQLException, IOException {

        final String name = request.getParameter("name");
        final String userName1 = request.getParameter("userName1");
        final String userName2 = request.getParameter("userName2");
        final String engineeringSection = request.getParameter("engineeringSection");
        final String encodingBudget = request.getParameter("encodingBudget");
        final String contractAmount = request.getParameter("contractAmount");
        final String shareAmount = request.getParameter("shareAmount");
        final String shareRatio = request.getParameter("shareRatio");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = MySQLConnection.getConn();
            ps = conn.prepareStatement("SELECT name FROM contract WHERE name = ?");
            ps.setString(1, name);
            rs = ps.executeQuery();
            final boolean first = rs.first();

            if (first) {
                PrintWriterUtil.printWriterObjectToJson(response, new ResultVO(false, "用户名已存在"));
            } else {
                ps = conn.prepareStatement("INSERT INTO contract (name, userName1, userName2," +
                        "engineeringSection,encodingBudget,contractAmount,shareAmount,shareRatio) VALUE (?,?,?,?,?,?,?,?)");
                ps.setString(1, name);
                ps.setString(2, userName1);
                ps.setString(3, userName2);
                ps.setString(4, engineeringSection);
                ps.setString(5, encodingBudget);
                ps.setString(6, contractAmount);
                ps.setString(7, shareAmount);
                ps.setString(8, shareRatio);
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
    private void updateContract(ServletRequest request, ServletResponse response) throws SQLException, IOException {


        final String id = request.getParameter("id");
        final String userName1 = request.getParameter("userName1");
        final String userName2 = request.getParameter("userName2");
        final String engineeringSection = request.getParameter("engineeringSection");
        final String encodingBudget = request.getParameter("encodingBudget");
        final String contractAmount = request.getParameter("contractAmount");
        final String shareAmount = request.getParameter("shareAmount");
        final String shareRatio = request.getParameter("shareRatio");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = MySQLConnection.getConn();
            ps = conn.prepareStatement("UPDATE contract SET userName1=?, userName2=?," +
                    "engineeringSection=?,encodingBudget=?,contractAmount=?,shareAmount=?,shareRatio=? WHERE id = ?");
            ps.setString(1, userName1);
            ps.setString(2, userName2);
            ps.setString(3, engineeringSection);
            ps.setString(4, encodingBudget);
            ps.setString(5, contractAmount);
            ps.setString(6, shareAmount);
            ps.setString(7, shareRatio);
            ps.setString(8, id);
            ps.executeUpdate();
            PrintWriterUtil.printWriterObjectToJson(response, new ResultVO(true, "修改成功"));
        } finally {
            MySQLConnection.close(conn, ps);
        }
    }

    //删除用户
    private void deleteContract(ServletRequest request, ServletResponse response) throws SQLException, IOException {

        final String id = request.getParameter("id");
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = MySQLConnection.getConn();
            ps = conn.prepareStatement("DELETE FROM contract WHERE id = ?");
            ps.setString(1, id);
            ps.executeUpdate();
            PrintWriterUtil.printWriterObjectToJson(response, new ResultVO(true, "删除成功"));
        } catch (Exception e) {
            PrintWriterUtil.printWriterObjectToJson(response, new ResultVO(false, "删除失败:error=" + e.getMessage()));
        } finally {
            MySQLConnection.close(conn, ps);
        }
    }

}
