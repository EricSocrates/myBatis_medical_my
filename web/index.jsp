<%--
  Created by IntelliJ IDEA.
  User: Yy
  Date: 2019/1/24
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>医疗管理系统</title>

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="profile-element">
                        <%--<span><img alt="image" class="img-circle" src="img/profile_small.jpg" /></span>--%>
                        <a class="dropdown-toggle" href="#">
                                      <span class="clear">
                                     <span class="block m-t-xs"><strong class="font-bold">admin</strong></span>
                                      <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                                      </span>
                        </a>
                    </div>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">医师信息管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="doctor_add.jsp" data-index="0">新增</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="doctor_list.jsp">列表</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">就诊信息管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="patient_add.jsp" data-index="0">新增患者</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="patient_list.jsp">患者列表</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <%--顶部层栏--%>
    <%--<div id="page-wrapper" class="gray-bg dashbard-1">--%>
    <%--<div class="row border-bottom">--%>
    <%--<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0;background-color: #00E8D7">--%>
    <%--<ul class="nav navbar-top-links navbar-left">--%>
    <%--<li class="dropdown hidden-xs">--%>
    <%--<a href="welcome.jsp" class="left-sidebar-toggle" style="color: purple;" target="test">--%>
    <%--首页--%>
    <%--</a>--%>
    <%--</li>--%>
    <%--</ul>--%>
    <%--<ul class="nav navbar-top-links navbar-right">--%>
    <%--<li class="dropdown hidden-xs">--%>
    <%--<a class="right-sidebar-toggle" aria-expanded="false">--%>
    <%--注销--%>
    <%--</a>--%>
    <%--</li>--%>
    <%--</ul>--%>
    <%--</nav>--%>
    <%--</div>--%>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row J_mainContent" id="content-main" style="height: 100%">
            <iframe src="welcome.jsp" class="J_iframe" frameborder="0" width="100%" height="100%" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">&copy; 2019 Eric Yao</div>
        </div>
    </div>
</div>
<!--右侧部分结束-->

</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="js/hplus.js?v=4.1.0"></script>
<script type="text/javascript" src="js/contabs.js"></script>

<!-- 第三方插件 -->
<script src="js/plugins/pace/pace.min.js"></script>

</body>

</html>

