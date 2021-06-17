<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<header class="navbar navbar-fixed-top navbar-shadow">
    <div class="navbar-branding">
        <a class="navbar-brand" href="dashboard.html">
            <b>OWL </b>BBS
        </a>
        <span id="toggle_sidemenu_l" class="ad ad-lines"></span>
    </div>
    <ul class="nav navbar-nav navbar-right">
        <li class="dropdown menu-merge">
            <a href="#" class="dropdown-toggle fw600 p15" data-toggle="dropdown">
                <img src="/assets/img/avatars/do.jpg" alt="avatar" class="mw30 br64">
                <span class="hidden-xs pl15"></span>
                <span class="caret caret-tp hidden-xs"></span>
            </a>
            <ul class="dropdown-menu list-group dropdown-persist w250" role="menu">
                <li class="list-group-item">
                    <a href="#" class="animated animated-short fadeInUp">
                        <span class="fa fa-user"></span> 个人信息
                        <span class="label label-warning"></span>
                    </a>
                </li>
                <li class="list-group-item">
                    <a href="#" class="animated animated-short fadeInUp">
                        <span class="fa fa-gear"></span> 设置密码 </a>
                </li>
                <li class="dropdown-footer">
                    <a href="/admin_quit" onclick=" return confirm('您确定要退出吗?')">
                        <span class="fa fa-power-off pr5"></span> 退出 </a>
                </li>
            </ul>
        </li>
    </ul>
</header>
