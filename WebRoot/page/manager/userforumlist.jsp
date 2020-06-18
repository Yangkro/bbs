<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.xh.bbs.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>查看用户发帖情况</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/base.css" type="text/css">
</head>
<body class="bodyBackground">
<!-- 顶部的菜单栏 -->
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
		<%--logo--%>
		<div>
			<img src="images/logo.jpg" class="logo">
		</div>
        <div class="navbar-header">
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
                <a href="${pageContext.request.contextPath}/TouristHome"><span class="glyphicon glyphicon-log-in"> 退出论坛</span></a>
            </li>
        </ul>
    </div>
</nav>
<div class="container"><!-- 中间的 -->
    <nav class="navbar navbar-default" role="navigation">
        <% List<ForumEntity> list = (List<ForumEntity>) request.getAttribute("forum");%>
        <table class="table table-bordered">
            <tr>
                <th>标题</th>
                <th>内容</th>
                <th>发帖时间</th>
                <th>操作</th>
            </tr>

            <% for (ForumEntity forumList : list) { %>
            <tr>
                <td><%=forumList.getTitle()%>
                </td>
                <td><%=forumList.getContent()%>
                </td>
                <td><%=forumList.getCreateTime()%>
                </td>
                <td><a href="MdeleteUserForum?fid=<%=forumList.getFid()%>&uid=<%=forumList.getAuthor().getUser_id()%>">删除</a>
                </td>
                <% }%>
            </tr>
        </table>
<%--        <a href="MUserList">返回</a>--%>
        <button type="button" class="btn btn-primary" onclick="location.href='MUserList'">返回</button>
    </nav>
</div>
</body>
</html>