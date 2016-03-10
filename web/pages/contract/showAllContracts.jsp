<%--
  Created by IntelliJ IDEA.
  User: wei.Li
  Date: 16/3/10
  Time: 下午3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>合同管理</title>
    <link href="./../../resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="./../../resource/dataTables/jquery.dataTables.min.css" rel="stylesheet">
    <script src="./../../resource/dataTables/jquery.dataTables.min.js"></script>
</head>
<body>
<div class="container">
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
                <li role="presentation">
                    <a href="<%=basePath%>pages/home/home.jsp">主页</a>
                </li>
                <li role="presentation">
                    <a href="<%=basePath%>pages/user/showAllUsers.jsp">用户管理</a>
                </li>
                <li role="presentation" class="active">
                    <a href="<%=basePath%>pages/contract/showAllContracts.jsp">合同管理</a>
                </li>
            </ul>
        </nav>
        <h3 class="text-muted">项目名称</h3>
    </div>

    <table id="allUsers" class="display" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th>用户名</th>
            <th>电话</th>
            <th>邮箱</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <th>用户名</th>
            <th>电话</th>
            <th>邮箱</th>
        </tr>
        </tfoot>
    </table>

</div>
</body>
</html>

<script>

    var $allUsersTable = $("#allUsersTable");

    $(function () {
        $.ajax({
            type: "POST",
            url: "<%=basePath%>" + "getAllUsers",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $allUsersTable.DataTable({
                    data: data
                });
            },
            error: function (XMLHttpRequest, textStatus) {
                console.error(textStatus);
                alert("过程发生错误" + textStatus);
            }
        });

    });

</script>
