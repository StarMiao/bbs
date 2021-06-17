<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Hi,I'm OWL - 欢迎来到猫头鹰论坛</title>
    <link rel="stylesheet" href="/static/css/all.css">

    <!-- Favicon -->
    <link rel="shortcut icon" href="/images/maotouying.png">

</head>
<body class="forum" data-page="forum">

    <%@ include file="header.jsp" %>

    <div id="main" class="main-container container">
        <!-- 首页通知栏 -->
        <div class="col-md-9 threads-index main-col">
            <div class="panel panel-default">

            <div class="panel-heading">
                <div class="pull-left hidden-sm hidden-xs">
                    <i class="fa fa-list"></i> 首页
                </div>
                <ul class="pull-right list-inline remove-margin-bottom thread-filter">
                    <li>
                        <a href="/home?page=1">
                            <i class="fa fa-history"></i> 最新话题
                        </a>
                    </li>
                    <li>
                        <a href="/home?method=cnum&page=1">
                            <i class="fa fa-diamond"> </i> 最多回复
                        </a>
                    </li>
                    <c:if test="${sessionScope.user != null}">
                        <li>
                            <a href="/home?method=mypost&page=1&username=${sessionScope.user.username}">
                                <i class="fa fa-eye"></i> 我的帖子
                            </a>
                        </li>
                    </c:if>
                </ul>
                <div class="clearfix"></div>
            </div>


            <div class="panel-body remove-padding-horizontal">
                <ul class="list-group row thread-list">
                    <!-- 显示帖子，每个li显示一个帖子的内容 -->
                    <c:forEach items="${posts}" var="post">
                        <li class="list-group-item media " style="margin-top: 0px;">
                        <a class="pull-right" href="#">
                            <span class="badge badge-reply-count">${post.commentNum}</span>
                        </a>
                        <div class="avatar pull-left">
                            <a href="#">
                                <img class="media-object img-thumbnail avatar-48" alt="starmiao" src="${post.path}"/>
                            </a>
                        </div>
                        <div class="infos">
                            <div class="media-heading">
                                <i class="fa fa-thumb-tack text-danger"></i>
                                <!-- 此处存放帖子标题的内容 -->
                                <a href="/to_post?id=${post.id}" title="">
                                    ${post.title}
                                </a>
                            </div>
                            <div class="media-body meta">
                                <a href="#">
                                    ${post.username}
                                </a>
                                <span> • </span>
                                <span class="timeago " data-toggle="tooltip" data-placement="top"
                                      title="">
                                    <spring:eval expression="post.createTime"/>
                                </span>
                            </div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>

            <div class="panel-footer text-right remove-padding-horizontal pager-footer" style="text-align: center">
                <!-- Pager -->
                <c:if test="${method == null}">
                    <ul class="pagination">
                        <c:if test="${page!=1 }">
                            <li><a href="/home?page=1">首页</a></li>
                            <li><a href="/home?page=${page-1 }">上一页</a></li>
                        </c:if>
                        <c:forEach var="i" begin="1" end="${totalPage }">
                            <c:if test="${page==i }">
                                <li><span class="first-page">${i }</span></li>
                            </c:if>
                            <c:if test="${page!=i }">
                                <li><a href="/home?page=${i }">${i }</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${page!=totalPage }">
                            <li><a href="/home?page=${page+1 }">下一页</a></li>
                            <li><a href="/home?page=${totalPage }">尾页</a></li>
                        </c:if>
                    </ul>
                </c:if>

                <c:if test="${method == 'cnum'}">
                    <ul class="pagination">
                        <c:if test="${page!=1 }">
                            <li><a href="/home?method=${method}&page=1">首页</a></li>
                            <li><a href="/home?method=${method}&page=${page-1 }">上一页</a></li>
                        </c:if>
                        <c:forEach var="i" begin="1" end="${totalPage }">
                            <c:if test="${page==i }">
                                <li><span class="first-page">${i }</span></li>
                            </c:if>
                            <c:if test="${page!=i }">
                                <li><a href="/home?method=${method}&page=${i }">${i }</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${page!=totalPage }">
                            <li><a href="/home?method=${method}&page=${page+1 }">下一页</a></li>
                            <li><a href="/home?method=${method}&page=${totalPage }">尾页</a></li>
                        </c:if>
                    </ul>
                </c:if>

                <c:if test="${method == 'mypost'}">
                    <ul class="pagination">
                        <c:if test="${page!=1 }">
                            <li><a href="/home?method=${method}&page=1&username=${sessionScope.user.username}">首页</a></li>
                            <li><a href="/home?method=${method}&page=${page-1 }&username=${sessionScope.user.username}">上一页</a></li>
                        </c:if>
                        <c:forEach var="i" begin="1" end="${totalPage }">
                            <c:if test="${page==i }">
                                <li><span style="color: #a94442;">${i }</span></li>
                            </c:if>
                            <c:if test="${page!=i }">
                                <li><a href="/home?method=${method}&page=${i }&username=${sessionScope.user.username}">${i }</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${page!=totalPage }">
                            <li><a href="/home?method=${method}&page=${page+1 }&username=${sessionScope.user.username}">下一页</a></li>
                            <li><a href="/home?method=${method}&page=${totalPage }&username=${sessionScope.user.username}">尾页</a></li>
                        </c:if>
                    </ul>
                </c:if>
            </div>


        </div>
    </div>

    <%@ include file="sidebar.jsp" %>

    <%@include file="footer.jsp"%>
</body>
</html>