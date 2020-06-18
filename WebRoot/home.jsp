<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.List,com.xh.bbs.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎来到校园论坛</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/base.css" type="text/css">
</head>
<body class="bodyBackground">
<!-- 顶部的菜单栏 -->
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <%-- logo--%>
        <div>
            <img src="images/logo.jpg" class="logo">
        </div>

        <div class="navbar-header logoText">
            <a class="navbar-brand" href="#">校园论坛</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="register.jsp"><span class="glyphicon glyphicon-user">注册</span> </a></li>
            <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in">登录</span> </a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="4000">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="images/L1.jpg" alt="First slide" class="slideShow">
            </div>
            <div class="item">
                <img src="images/L2.jpg" alt="Second slide" class="slideShow">
            </div>
            <div class="item">
                <img src="images/L3.jpg" alt="Third slide" class="slideShow">
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="carousel-control left toDisplay" href="#myCarousel" data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right toDisplay" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div>
</div>

<div class="container"><!-- 中间的 -->
    <nav class="navbar navbar-default" role="navigation">
        <div>
            <ul class="nav nav-tabs">
                <li class="active"><a href="#home" data-toggle="tab">最新发布</a></li>
            </ul>
        </div>
        <div class="tab-pane fade in active" id="home">
            <div class="panel panel-default">
                <div class="panel-body">
                    <table class="table table-hover">

                        <thead>
                        <tr>
                            <th>标题</th>
                            <th>时间</th>
                            <th>发帖人</th>
                        </tr>
                        </thead>
                        <%
                            //从作用域取出帖子列表,进行循环遍历
                            List<ForumEntity> list = (List<ForumEntity>) request.getAttribute("forumList");
                            if (list == null) {
                                out.println("恭喜您是第一个新用户，赶紧去发帖吧！");
                            } else {
                                for(int i = list.size() - 1; i >= 0; i--){
                                    ForumEntity forum = (ForumEntity)list.get(i);
                        %>
                        <tbody>
                        <tr>
                            <td>
                                <a href="TouristFindReply?fid=<%=forum.getFid()%>"><%=forum.getTitle()%></a>
                            </td>
                            <td>
                                <%=forum.getCreateTime()%>
                            </td>
                            <td><img src="<%=forum.getAuthor().getUser_face() %>" class="img-circle">
                                <a href="TouristFindUserById?uid=<%=forum.getAuthor().getUser_id()%>"><%=forum.getAuthor().getUser_name()%></a>
                            </td>
                        </tr>
                        </tbody>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
    </nav>
</div>
<div id="footer">
    <nav class="navbar navbar-inverse navbar-staic-bottom footer-nav">
        <div class="navbar-inner navbar-content-center">
            <p  class="footer-P"  align=center>by: Yangkro</p>
            <p  class="footer-P"  align=center>Identity information: 计科170626 杨传伟 20178712</p>
            <p class="footer-P" align=center>Contact information: <a href=" ">907661446@qq.com</a></p>
        </div>
    </nav>
</div>
</body>
</html>