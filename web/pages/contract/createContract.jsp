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
    <title>新建用户</title>
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
                <li role="presentation">
                    <a href="<%=basePath%>pages/user/showAllUsers.jsp">用户管理</a>
                </li>
                <li role="presentation" class="active">
                    <a href="<%=basePath%>pages/contract/showAllContracts.jsp">合同管理</a>
                </li>
                <li role="presentation">
                    <a href="#">当前用户 : <%=session.getAttribute("loginUserName")%>
                    </a>
                </li>
            </ul>
        </nav>
        <h3 class="text-muted"><%=application.getAttribute("proName")%>
        </h3>
    </div>
    <div>
        <form class="form-horizontal">
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">合同名称</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" placeholder="合同名称">
                </div>
            </div>
            <div class="form-group">
                <label for="userName1" class="col-sm-2 control-label">甲方</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userName1" placeholder="甲方">
                </div>
            </div>
            <div class="form-group">
                <label for="userName2" class="col-sm-2 control-label">乙方</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userName2" placeholder="乙方">
                </div>
            </div>
            <div class="form-group">
                <label for="engineeringSection" class="col-sm-2 control-label">工程段</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="engineeringSection" placeholder="工程段">
                </div>
            </div>
            <div class="form-group">
                <label for="encodingBudget" class="col-sm-2 control-label">概算编码</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="encodingBudget" placeholder="概算编码">
                </div>
            </div>
            <div class="form-group">
                <label for="contractAmount" class="col-sm-2 control-label">合同金额</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="contractAmount" placeholder="合同金额">
                </div>
            </div>
            <div class="form-group">
                <label for="shareAmount" class="col-sm-2 control-label">分摊金额(万)</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="shareAmount" placeholder="分摊金额(万)">
                </div>
            </div>
            <div class="form-group">
                <label for="shareRatio" class="col-sm-2 control-label">分摊金额比例(%)</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="shareRatio" placeholder="分摊金额比例(%)">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-warning" id="create">新建</button>
                </div>
            </div>
        </form>
    </div>
</div>


</body>
</html>

<script>


    $(function () {

        /**
         * 创建按钮事件
         */
        $("#create").click(function () {
            var name = $("#name").val();
            var userName1 = $("#userName1").val();
            var userName2 = $("#userName2").val();
            var engineeringSection = $("#engineeringSection").val();
            var encodingBudget = $("#encodingBudget").val();
            var contractAmount = $("#contractAmount").val();
            var shareAmount = $("#shareAmount").val();
            var shareRatio = $("#shareRatio").val();

            if (name == "" || userName1 == "" || userName2 == "" || engineeringSection == "" || encodingBudget == "" || contractAmount == ""
                    || shareAmount == "" || shareRatio == "") {
                $("#model").modal("toggle");
                MSG.showMsg("信息填写不完整");
                return;
            }

            $.ajax({
                type: "POST",
                url: "<%=basePath%>" + "ContractServlet",
                data: {
                    "method": "createContract",
                    "name": name,
                    "userName1": userName1,
                    "userName2": userName2,
                    "engineeringSection": engineeringSection,
                    "encodingBudget": encodingBudget,
                    "contractAmount": contractAmount,
                    "shareAmount": shareAmount,
                    "shareRatio": shareRatio
                },
                dataType: "json",
                success: function (data) {
                    MSG.showMsg(data.data);
                    if (data.succeed) {
                        setTimeout(reload, 3000);
                    }
                }
            });
        });


    });

</script>
