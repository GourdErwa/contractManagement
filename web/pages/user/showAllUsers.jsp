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
    <title>用户管理</title>
    <jsp:include page="./../public/public.jsp"/>
</head>
<body>
<div class="container">
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
                <li role="presentation">
                    <a href="<%=basePath%>pages/home/home.jsp">主页</a>
                </li>
                <li role="presentation" class="active">
                    <a href="<%=basePath%>pages/user/showAllUsers.jsp">用户管理</a>
                </li>
                <li role="presentation">
                    <a href="<%=basePath%>pages/contract/showAllContracts.jsp">合同管理</a>
                </li>
            </ul>
        </nav>
        <h3 class="text-muted">项目名称</h3>
    </div>
    <div>
        <button style="float: right;margin-bottom: 10px;" type="button" class="btn btn-info"
                onclick="window.location.href='<%=basePath%>pages/user/createUser.jsp'"
        >新建用户
        </button>

        <table id="showTable" class="display" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>用户名</th>
                <th>电话</th>
                <th>邮箱</th>
                <th>操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
</body>
</html>

<script>

    var $showTable = $("#showTable");
    var table;

    var dataTableSetting = {

        "language": {
            "sProcessing": "处理中...",
            "lengthMenu": "每页 _MENU_ 条记录",
            "zeroRecords": "查无数据",
            "info": "_PAGE_ / _PAGES_",
            "infoEmpty": "暂无数据",
            "infoFiltered": "(过滤总数 _MAX_ 条)",
            "search": "检索",
            "sLoadingRecords": "载入中...",
            "oPaginate": {
                "sNext": ">",
                "sPrevious": "<"
            }
        },
        "columns": [
            {"data": "userName"},
            {"data": "phone"},
            {"data": "email"},
            {"data": "userName"}
        ],
        "columnDefs": [
            {
                "render": function (data, type, row) {
                    return data;
                },
                "targets": 0
            },
            {
                "render": function (data, type, row) {
                    return data;
                },
                "targets": 1
            },
            {
                "render": function (data, type, row) {
                    return data;
                },
                "targets": 2
            },
            {
                "render": function (data, type, row) {
                    return "<button  type=\"button\" class=\"btn btn-warning\" " +
                            "onclick=\"window.location.href ='<%=basePath%>pages/user/updateUser.jsp?userName=" + data + "'\">修改</button>" +
                            "&nbsp;&nbsp;<button type=\"button\" class=\"btn btn-danger js-del\" userName=" + data + ">删除</button>";
                },
                "orderable": false,
                "targets": 3
            }
        ]
    };


    $(function () {

        /**
         * 注册删除事件
         */
        var delRegister = function () {
            $showTable.find(" tbody").on('click', 'tr .js-del', function () {
                var $2 = $(this);
                var userName = $2.attr("userName");
                $2.parent().parent().addClass("js-del-tr");
                $.ajax({
                    type: "POST",
                    url: "<%=basePath%>" + "UserServlet",
                    data: {
                        "method": "deleteUser",
                        "userName": userName
                    },
                    dataType: "json",
                    success: function (data) {
                        MSG.showMsg(data.data);
                        if (data.succeed) {
                            table.row(".js-del-tr").remove().draw(false);
                        }
                    }
                });

            });
        };

        /**
         * 获取所有用户数据展示
         */
        $.ajax({
            type: "POST",
            url: "<%=basePath%>" + "UserServlet",
            data: {
                "method": "getAllUsers"
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                dataTableSetting.data = data;
                table = $showTable.DataTable(dataTableSetting);
                delRegister();
            }
        });

    });

</script>
