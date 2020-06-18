﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.List,com.xh.bbs.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查看回复</title>
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%--    <style>--%>
<%--      .bodyBackground {--%>
<%--        background-color: #f9f7f6;--%>
<%--      }--%>
<%--    </style>--%>
</head>
<body class="bodyBackground">

<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <%--logo--%>
        <div>
            <img src="images/logo.jpg" class="logo">
        </div>
        <div class="navbar-header">
            <a class="navbar-brand logoText" href="TouristHome">校园论坛</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="register.jsp"><span class="glyphicon glyphicon-user">注册</span></a></li>
            <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in">登录</span></a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <nav class="navbar navbar-default" role="navigation">
        <%
            ForumEntity forum = (ForumEntity) request.getAttribute("forum");
        %>
        <div class="panel panel-default">
            <div class="panel-body">
                <form name="form1" method="post" action="reply">
                    <table class="table table-bordered">
                        <tr class="ttr">
                            <td width="95">标题</td>
                            <td width="397"><%=forum.getTitle() %>
                            </td>
                        </tr>
                        <tr class="ttr">
                            <td><%=forum.getAuthor().getUser_name() %>
                            </td>
                            <td>发表于&nbsp;&nbsp;<%=forum.getCreateTime() %>
                            </td>
                        </tr>
                        <tr class="ttr">
                            <td height="92"><img src="<%=forum.getAuthor().getUser_face() %>" class="img-circle">
                            </td>
                            <td>&nbsp;<%=forum.getContent() %>
                            </td>
                        </tr>
                        <%
                            List<ReplyEntity> replyList = forum.getReplyList();
                            for (ReplyEntity reply : replyList) {
                        %>
                        <tr class="ttr">
                            <td><%=reply.getUser().getUser_name() %>
                            </td>
                            <td>回复于&nbsp;&nbsp;<%=reply.getReplyTime() %>
                            </td>
                        </tr>
                        <tr class="ttr">
                            <td height="101" class="td1"><img src="<%=reply.getUser().getUser_face() %>"
                                                              class="img-circle">
                            </td>
                            <td class="td2">&nbsp;<%=reply.getContent() %>
                            </td>
                        </tr>
                        <%} %></table>
                    <div class="form-group">

                        <div class="col-sm-10">
                            <p align="center">您还没有登录，暂时无法回复！&nbsp&nbsp&nbsp<a href="login.jsp">请登录</a></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </nav>
</div>


</body>
</html>