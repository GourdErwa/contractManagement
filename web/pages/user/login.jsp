<%--
  Created by IntelliJ IDEA.
  User: Wei.Li
  Date: 2016/3/9
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>登录-<%=application.getAttribute("proName")%></title>

    <link href="./../../resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="./../../resource/js/login.js"></script>
    <script src="./../../resource/js/jquery.min.js"></script>
    <style>

        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }

        .form-signin {
            margin-top: 100px;
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }

        .form-signin .form-signin-heading,
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }

        .form-signin .form-control:focus {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

    </style>
</head>

<body>

<div class="container">
    <form class="form-signin">
        <h2 class="form-signin-heading">登录</h2>
        <label for="userName" class="sr-only">用户名</label>
        <input type="text" id="userName" class="form-control" placeholder="用户名" required autofocus>
        <label for="passWd" class="sr-only">密码</label>
        <input type="password" id="passWd" class="form-control" placeholder="密码" required>
        <button class="btn btn-lg btn-primary btn-block" type="button" id="login">登录</button>
    </form>
</div>

</body>
</html>
<script>

    $(function () {

        $("#login").click(function () {

            var userName = $("#userName").val().trim();
            var passWd = $("#passWd").val().trim();

            if (userName == "" || passWd == "") {
                alert("请输入用户名密码");
                return;
            }

            $.ajax({
                type: "POST",
                url: "<%=basePath%>" + "UserServlet",
                data: {
                    "method": "login",
                    "userName": userName,
                    "passWd": passWd
                },
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if (data.succeed) {
                        window.location.href = "<%=basePath%>" + "pages/home/home.jsp";
                    } else {
                        if (data.data) {
                            alert(data.data);
                        } else {
                            alert("用户名密码不匹配");
                        }
                    }
                },
                error: function (XMLHttpRequest, textStatus) {
                    console.error(textStatus);
                    alert("登录过程发生错误" + textStatus);
                }

            });
        });

    });

</script>
