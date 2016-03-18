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
    <title>合同管理-<%=application.getAttribute("proName")%></title>
    <jsp:include page="./../public/public.jsp"/>
</head>
<body>
<div class="container">
    <jsp:include page="./../public/nav.jsp"/>
    <div>
        <button style="float: right;margin-bottom: 10px;" type="button" class="btn btn-info"
                onclick="window.location.href='<%=basePath%>pages/contract/createContract.jsp'"
        >新建合同
        </button>

        <table id="showTable" class="display" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>名称</th>
                <th>甲方</th>
                <th>乙方</th>
                <th>工程段</th>
                <th>概算编码</th>
                <th>合同金额</th>
                <th>分摊金额(万)</th>
                <th>分摊金额比例(%)</th>
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
            {"data": "name"},
            {"data": "userName1"},
            {"data": "userName2"},
            {"data": "engineeringSection"},
            {"data": "encodingBudget"},
            {"data": "contractAmount"},
            {"data": "shareAmount"},
            {"data": "shareRatio"},
            {"data": "id"}
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
                    return data;
                },
                "targets": 3
            },
            {
                "render": function (data, type, row) {
                    return data;
                },
                "targets": 4
            },
            {
                "render": function (data, type, row) {
                    return data;
                },
                "targets": 5
            },
            {
                "render": function (data, type, row) {
                    return data;
                },
                "targets": 6
            },
            {
                "render": function (data, type, row) {
                    return data;
                },
                "targets": 7
            },
            {
                "render": function (data, type, row) {
                    return "<button  type=\"button\" class=\"btn btn-warning\" " +
                            "onclick=\"window.location.href ='<%=basePath%>pages/contract/updateContract.jsp?id=" + data + "'\">修改</button>" +
                            "&nbsp;&nbsp;<button type=\"button\" class=\"btn btn-danger js-del\" contractId=" + data + ">删除</button>";
                },
                "orderable": false,
                "targets": 8
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
                var id = $2.attr("contractId");
                $2.parent().parent().addClass("js-del-tr");
                $.ajax({
                    type: "POST",
                    url: "<%=basePath%>" + "ContractServlet",
                    data: {
                        "method": "deleteContract",
                        "id": id
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
            url: "<%=basePath%>" + "ContractServlet",
            data: {
                "method": "getAllContracts"
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
