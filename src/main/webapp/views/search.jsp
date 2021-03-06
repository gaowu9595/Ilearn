<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>课程搜索</title>
    <link rel="stylesheet" href="${assetsPath}/css/app.min.css"/>
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="${assetsPath}/js/navLink.js"></script>
</head>
<body>
<jsp:include page="common/header.jsp" />

<div class="main course">
    <div class="contain">
        <div class="container">
            <div class="breadcrumb-main">
                <ol class="breadcrumb">
                    <li><a href="${rootPath}/index">首页</a></li>
                    <li><a href="${rootPath}/resource/course">课程</a></li>
                </ol>
            </div>



            <!----------------------------
                         body
             ------------------------------->
            <div class="course-body">
                <div class="container">
                    <div class="row">
                        <ul class="list-inline courses-sort">
                            <li>最热</li>
                            <li>最新</li>
                            <li>免费</li>
                        </ul>
                    </div>

                    <div class="floor">
                        <ul>

                            <c:forEach items="${page.list}" var="result">
                                <li>
                                    <div class="image">
                                        <img src="${result.imgurl}" alt=""/>
                                    </div>
                                    <div class="title"><a href="${result.url}">${result.title}</a></div>
                                        <%--<div class="price">${coursepage1.price}</div>--%>
                                    <c:if test="${result.joinNumber!='0' }">
                                        <div class="add pull-left">学习人数</div>
                                        <div class="people pull-right">${result.joinNumber}</div>
                                    </c:if>
                                    <c:if test="${result.collection!='0' && result.joinNumber=='0'}">
                                        <div class="add pull-left">收藏人数</div>
                                        <div class="people pull-right">${result.collection}</div>
                                    </c:if>
                                    <c:if test="${result.satisfaction!='0' && result.joinNumber=='0' && result.collection=='0'}">
                                        <div class="add pull-left">满意度</div>
                                        <div class="people pull-right">${result.satisfaction}</div>
                                    </c:if>
                                    <div class="clearfix"></div>
                                    <div class="line"></div>
                                    <div class="src">${result.sourceWeb}</div>
                                </li>
                            </c:forEach>

                            <div class="clearfix"></div>
                        </ul>
                    </div>

                </div>

                <jsp:include page="common/pagination.jsp" />

            </div>

        </div>

    </div>
</div>


<jsp:include page="common/footer.jsp" />

<script>
    $(document).ready(function () {
        $(".list-head").mouseenter(function () {
            $(this).find(".list-menu").show();
        });
        $(".list-head").mouseleave(function () {
            $(this).find(".list-menu").hide();
        });
        $(".list-menu").mouseover(function () {
            $(this).show();
        })
        $(".list-menu").mouseleave(function () {
            $(this).hide();
        })
    });
</script>


<script>
    //弹出层
    function openLogin() {
        $('.modal-dialog-mask').fadeIn(100);
        $("#login").slideDown(400);
    }
    function closeLogin() {
        $('.modal-dialog-mask').fadeOut(100);
        $("#login").slideUp(400);
    }

    function openRegister() {
        $('.modal-dialog-mask').fadeIn(100);
        $("#register").slideDown(400);
    }
    function closeRegister() {
        $('.modal-dialog-mask').fadeOut(100);
        $("#register").slideUp(400);
    }

    $("#login .re-register").click(function () {
        $("#login").css("display","none");
        $("#register").css("display","block");
    });
    $("#register .re-login").click(function () {
        $("#login").css("display","block");
        $("#register").css("display","none");
    });
</script>
</body>
</html>