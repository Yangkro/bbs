<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.List,com.xh.bbs.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查看帖子</title>
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
            <%--判断是不是管理员登录，如果是则显示管理员登录的用户管理选项 --%>
            <%
                UserEntity admin = (UserEntity) request.getSession().getAttribute("user");
                if (admin.getIsAdmin() == 1) {
            %>
            <li><a href="MUserList"><span class="glyphicon glyphicon-th-list"> 用户管理</span></a></li>

            <%} %>
            <li>
                <a href="${pageContext.request.contextPath}/TouristHome"><span class="glyphicon glyphicon-log-in"> 退出论坛</span></a>
            </li>

        </ul>
    </div>
</nav>
<!-- 轮播-->

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


<div class="container"><!-- 中间 -->
    <nav class="navbar navbar-default" role="navigation">
        <div>
            <span style="font-size:24px">欢迎，${user.user_name}</span>
        </div>
        <ul class="nav nav-tabs">
            <li class="active"><a href="#">最新发布</a></li>
        </ul>
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
//                            for (ForumEntity forum : list) {
                            for (int i = list.size() - 1; i >= 0; i--) {
                                ForumEntity forum = (ForumEntity) list.get(i);
                    %>
                    <tbody>
                    <tr>

                        <td>
                            <a href="replyList?fid=<%=forum.getFid()%>"><%=forum.getTitle()%></a>
                        </td>
                        <td><%=forum.getCreateTime()%>
                        </td>
                        <td>
                            <img src="<%=forum.getAuthor().getUser_face() %> " class="img-circle">
                            <a href="FindUserByIdServlet?uid=<%=forum.getAuthor().getUser_id()%>"><%=forum.getAuthor().getUser_name()%>
                            </a>
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
<%--        发帖部分--%>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    发帖
                </h3>
            </div>
            <div class="panel-body">

                <form class="form-horizontal" role="form" name="form1" method="post" action="release">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="firstname"
                                   placeholder="请输入标题" name="title">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" name="content" id="name"></textarea></div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">发表</button>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </nav>
</div>

<div id="footer">
    <nav class="navbar navbar-inverse navbar-staic-bottom footer-nav">
        <div class="navbar-inner navbar-content-center">
            <p  class="footer-P"  align=center>by: Yangkro</p>
            <p  class="footer-P"  align=center>Identity information: 计科170626 杨传伟 20178712</p>
            <p class="footer-P" align=center>Contact information: <a href=" ">1085597619@qq.com</a></p>
        </div>
    </nav>
</div>

</body>
</html>