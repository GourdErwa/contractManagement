<%--
  Created by IntelliJ IDEA.
  User: Wei.Li
  Date: 2016/3/9
  Time: 19:30
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

    <title>首页-<%=application.getAttribute("proName")%></title>
    <jsp:include page="./../public/public.jsp"/>
</head>

<body>

<div class="container">

    <jsp:include page="./../public/nav.jsp"/>

    <div class="jumbotron" style="min-height: 410px;">
        <h2><%=application.getAttribute("proName")%>
        </h2>

        <p class="lead" style="text-align: left;">
            <%=application.getAttribute("proNameDescribe")%>
        </p>
    </div>

    <footer class="footer">
        <p>&copy; Company 2016</p>
    </footer>

</div>


</body>
</html>
