<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="header">
    <nav class="navbar navbar-inverse navbar-fixed-top navbar-default">
        <div class="container">
            <div class="navbar-header" id="navbar-header">
                <a href="/home" class="navbar-brand"><img src="/images/baimao.png">
                </a>
            </div>
            <div id="main-nav-menu">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/home"><i class="fa fa-home"></i> <span
                            class="hidden-xs hidden-sm">首页</span></a></li>
<%--                    <li class="hidden-sm hidden-xs"><a href="#"><i class="fa fa-comments-o"></i> 话题</a></li>--%>

                </ul>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <!-- 登录成功要显示的内容 -->
                <c:if test="${sessionScope.user != null}">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                            <img class="/media-object img-thumbnail avatar" alt="strdemo"
                                 src="${sessionScope.user.path}" style="width:30px;height:30px;"/>
                           ${sessionScope.user.username}  <!-- 此处显示用户名 -->
                        </a>
                            <li><a href="/quit" onclick=" return confirm('您确定要退出吗?')"><i class="fa fa-sign-out"></i> 退出
                            </a></li>
                    </li>
                </c:if>
                <!-- 未登录显示的内容 -->
                <c:if test="${sessionScope.user == null}">
                    <li><a href="/to_register" id="signup-btn">注册</a></li>
                    <li><a href="/to_login" id="login-btn">登录</a></li>
                </c:if>


            </ul>
        </div>
    </nav>
</div>