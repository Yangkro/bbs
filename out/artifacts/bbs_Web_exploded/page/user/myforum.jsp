<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="java.util.*,com.xh.bbs.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>个人帖子</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .logo {
            float: left;
            height: 50px;
            width: 50px;
            margin-right: 5px;
            cursor: pointer;
        }

        .logoText {
            float: left;
            margin-left: 10px;
        }
    </style>
</head>
<body class="bodyBackground">
<!-- 顶部的菜单栏 -->
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <%--logo--%>
        <div>
            <img src="images/logo.jpg" class="logo">
        </div>
        <div class="navbar-header logoText">
            <a class="navbar-brand" href="forumList">校园论坛</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="${pageContext.request.contextPath}/UserInfo?uid=${user.user_id}"><span class="glyphicon glyphicon-user"> 个人信息</span></a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/UPersonForumList?uid=${user.user_id}"><span class="glyphicon glyphicon-book"> 我的帖子</span></a>
            </li>
            <li>
                <a href="TouristHome"><span class="glyphicon glyphicon-log-in"> 退出论坛</span></a>
            </li>

        </ul>
    </div>
</nav>
<div class="container"><!-- 中间的 -->
    <nav class="navbar navbar-default" role="navigation">
        <% List<ForumEntity> pForumList = (List<ForumEntity>) request.getAttribute("perForumList"); %>
        <table class="table table-bordered">
            <tr>
                <td>标题</td>
                <td>内容</td>
                <td>发帖时间</td>
                <td>操作</td>
            </tr>

            <% for (ForumEntity forumList : pForumList) {%>
            <tr>
                <td><%=forumList.getTitle() %>
                </td>
                <td><%=forumList.getContent() %>
                </td>
                <td><%=forumList.getCreateTime() %>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/UPersonDeleteForum?fid=<%=forumList.getFid()%>&uid=<%=forumList.getAuthor().getUser_id()%> ">删除</a>
                    <a href="UPfindReplyById?fid=<%=forumList.getFid()%>">查看</a>
                </td>
            </tr>
            <%} %>
        </table>
        <input type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/forumList'" value="返回">
    </nav>
</div>
</body>
</html>