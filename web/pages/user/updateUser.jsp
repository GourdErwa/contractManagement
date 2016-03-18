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
    <title>用户管理-修改用户-<%=application.getAttribute("proName")%></title>
    <jsp:include page="./../public/public.jsp"/>
</head>
<body>
<div class="container">
    <jsp:include page="./../public/nav.jsp"/>
    <div>

        <form class="form-horizontal">
            <div class="form-group">
                <label for="userName" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userName" readonly placeholder="用户名">
                </div>
            </div>
            <div class="form-group">
                <label for="passWd" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="passWd" placeholder="密码">
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">电话</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="phone" placeholder="电话">
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="email" placeholder="邮箱">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-warning" id="update">修改</button>
                </div>
            </div>
        </form>

    </div>
</div>


</body>
</html>

<script>

    var $userName = $("#userName");
    var $passWd = $("#passWd");
    var $phone = $("#phone");
    var $email = $("#email");

    $(function () {

        <%
        String userName = request.getParameter("userName");
        userName = new String(userName.getBytes("ISO-8859-1"),"UTF-8");

        %>
        /**
         * 获取修改信息
         */
        $.ajax({
            type: "POST",
            url: "<%=basePath%>" + "UserServlet",
            data: {
                "method": "getUsersByUserName",
                "userName": "<%=userName%>"
            },
            dataType: "json",
            success: function (data) {
                console.log("getUsersByUserName" + data);
                $userName.val(data.userName);
                $passWd.val(data.passWd);
                $phone.val(data.phone);
                $email.val(data.email);
            }
        });

        /**
         * 修改按钮事件注册
         */
        $("#update").click(function () {

            var userName = $userName.val();

            if (userName !== "<%=userName%>") {
                MSG.showMsg("待修改用户名失效");
                return;
            }

            var passWd = $passWd.val();
            var phone = $phone.val();
            var email = $email.val();

            if (userName == "" || passWd == "") {
                $("#model").modal("toggle");
                MSG.showMsg("用户名密码必填");
                return;
            }

            $.ajax({
                type: "POST",
                url: "<%=basePath%>" + "UserServlet",
                data: {
                    "method": "updateUser",
                    "userName": userName,
                    "passWd": passWd,
                    "phone": phone,
                    "email": email
                },
                dataType: "json",
                success: function (data) {
                    MSG.showMsg(data.data);
                }
            });
        });


    });

</script>
