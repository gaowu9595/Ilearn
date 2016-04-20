<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>个人中心</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${assetsPath}/css/app.min.css"/>
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body class=" theme-blue">

<!-- Demo page code -->

<script type="text/javascript">
    $(function () {
        var match = document.cookie.match(new RegExp('color=([^;]+)'));
        if (match) var color = match[1];
        if (color) {
            $('body').removeClass(function (index, css) {
                return (css.match(/\btheme-\S+/g) || []).join(' ')
            })
            $('body').addClass('theme-' + color);
        }

        $('[data-popover="true"]').popover({html: true});

    });
</script>
<style type="text/css">
    #line-chart {
        height: 300px;
        width: 800px;
        margin: 0px auto;
        margin-top: 1em;
    }

    .navbar-default .navbar-brand, .navbar-default .navbar-brand:hover {
        color: #fff;
    }
</style>

<script type="text/javascript">
    $(function () {
        var uls = $('.sidebar-nav > ul > *').clone();
        uls.addClass('visible-xs');
        $('#main-menu').append(uls.clone());
    });
</script>

<!-- Le fav and touch icons -->
<%--<link rel="shortcut icon" href="../assets/ico/favicon.ico">--%>
<%--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">--%>
<%--<link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">--%>
<%--<link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">--%>
<%--<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">--%>

<!--<![endif]-->
<!--------------------
        header
--------------------->
<div class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="" href="${rootPath}/views/index.jsp"><span class="navbar-brand"><span class="fa fa-cloud"></span> Ilearn</span></a>
    </div>

    <div class="navbar-collapse collapse" style="height: 1px;">
        <ul id="main-menu" class="nav navbar-nav navbar-right">
            <li class="dropdown hidden-xs">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user padding-right-small"
                          style="position:relative;top: 3px;"></span> ${username}
                    <i class="fa fa-caret-down"></i>
                </a>

                <ul class="dropdown-menu">
                    <li><a href="../">My Account</a></li>
                    <li class="divider"></li>
                    <li class="dropdown-header">Admin Panel</li>
                    <li><a href="../">Users</a></li>
                    <li><a href="../">Security</a></li>
                    <li><a tabindex="-1" href="../">Payments</a></li>
                    <li class="divider"></li>
                    <li><a tabindex="-1" href="${rootPath}/user/logout">Logout</a></li>
                </ul>
            </li>
        </ul>

    </div>
</div>

<!--------------------
       nav
--------------------->
<div class="sidebar-nav">
    <ul>

        <li><a href="#" data-target=".dashboard-menu2" class="nav-header" data-toggle="collapse"><i
                class="fa fa-bug"></i> 个人信息管理<i class="fa fa-collapse"></i></a></li>

        <li>
            <ul class="dashboard-menu2 nav nav-list collapse in">
                <li><a href="${rootPath}/collection/getinfo"><span class="fa fa-caret-right"></span> 查看个人信息</a></li>
                <li><a href="${rootPath}/collection/getchange"><span class="fa fa-caret-right"></span> 修改个人信息</a></li>
                <li class="active"><a href="${rootPath}/collection/getpassword"><span class="fa fa-caret-right"></span> 修改密码</a></li>
                <!--<li><a href="user-do.jsp"><span class="fa fa-caret-right"></span> 操作日志</a></li>-->
            </ul>
        </li>

        <li><a href="${rootPath}/collection/getrecord" data-target=".dashboard-menu3" class="nav-header" data-toggle="collapse"><i
                class="fa fa-bug"></i> 浏览记录</a></li>

        <li><a href="${rootPath}/collection/getcollection" data-target=".dashboard-menu4" class="nav-header" data-toggle="collapse"><i
                class="fa fa-bug"></i> 收藏</a></li>
    </ul>
</div>


<!--于此分左右层次-->
<div class="content">
    <div class="header">
        <h1 class="page-title">修改密码</h1>
    </div>
    <div class="main-content">
        <div class="row">
            <div class="user-img col-md-4">
                <div><img src="${assetsPath}/images/cloud.ico" alt=""/></div>
            </div>
            <div class="col-md-3 password">
                <form action="${rootPath}/collection/changepassword" method="post">
                <div><span>旧密码:</span><input name="oldpassword" type="text" class="form-control" value="${loginUser.password}"/></div>
                <div><span>新密码:</span><input name="newpassword" type="text" class="form-control"/></div>
                <div><span>再次输入新密码:</span><input type="text" class="form-control"/></div>
                <div><input type="submit" class="btn btn-default pull-right" value="提交"/></div>
                <div class="clearfix"></div>
                </form>
            </div>
        </div>


    </div>
</div>


<script src="lib/bootstrap/js/bootstrap.js"></script>
<script src="${assetsPath}/js/Chart.js"></script>
<script type="text/javascript">
    $("[rel=tooltip]").tooltip();
    $(function () {
        $('.demo-cancel-click').click(function () {
            return false;
        });
    });
</script>


</body>
</html>
