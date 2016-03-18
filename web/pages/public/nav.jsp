<%--
  Created by IntelliJ IDEA.
  User: wei.Li
  Date: 16/3/17
  Time: 下午6:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="header clearfix">
    <nav>
        <ul class="nav nav-pills pull-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">
                    概预算管理 <span class="caret"></span></a>
                <ul class="dropdown-menu">

                    <li><a href="#">概算范本</a></li>
                    <li><a href="#">初步设计概算</a></li>
                    <li><a href="#">概算统计设置</a></li>
                    <li><a href="#">施工图预算</a></li>
                    <li><a href="#">概算执行情况</a></li>
                    <li><a href="#">年度预算</a></li>
                    <li><a href="<%=basePath%>pages/contract/showAllContracts.jsp">合同管理</a></li>
                </ul>
            </li>
            <li role="presentation">
                <a href="#">工程清单管理</a>
            </li>
            <li role="presentation">
                <a href="#">决算管理</a>
            </li>
            <li role="presentation">
                <a href="<%=basePath%>pages/user/showAllUsers.jsp">用户管理</a>
            </li>
            <li role="presentation">
                <a href="#">用户 : <%=session.getAttribute("loginUserName")%>
                </a>
            </li>
        </ul>
    </nav>
    <a href="<%=basePath%>pages/home/home.jsp">
        <h3 class="text-muted"><%=application.getAttribute("proName")%>
        </h3>
    </a>
</div>
