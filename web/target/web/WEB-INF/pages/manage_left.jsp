<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- Start: Sidebar -->
<aside id="sidebar_left" class="nano nano-light affix">

    <!-- Start: Sidebar Left Content -->
    <div class="sidebar-left-content nano-content">

        <!-- Start: Sidebar Header -->
        <header class="sidebar-header">

            <!-- Sidebar Widget - Author -->
            <div class="sidebar-widget author-widget">
                <div class="media">
                    <a class="media-left" href="#">
                        <img src="/assets/img/avatars/do.jpg" class="img-responsive">
                    </a>
                    <div class="media-body">
                        <div class="media-author">${sessionScope.admin.adminname}</div>
                        <div class="media-links">
                            <a href="/admin_quit" onclick=" return confirm('您确定要退出吗?')">退出</a>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Sidebar Widget - Search (hidden) -->
            <div class="sidebar-widget search-widget hidden">
                <div class="input-group">
              <span class="input-group-addon">
                <i class="fa fa-search"></i>
              </span>
                    <input type="text" id="sidebar-search" class="form-control" placeholder="Search...">
                </div>
            </div>

        </header>
        <!-- End: Sidebar Header -->

        <!-- Start: Sidebar Menu -->
        <ul class="nav sidebar-menu">
            <li class="sidebar-label pt20">日常管理</li>
            <li>
                <a href="/post/list">
                    <span class="glyphicon glyphicon-book"></span>
                    <span class="sidebar-title">帖子管理</span>
                </a>
            </li>
            <li class="active">
                <a href="/user/list">
                    <span class="glyphicon glyphicon-home"></span>
                    <span class="sidebar-title">用户管理</span>
                </a>
            </li>
        </ul>
        <!-- End: Sidebar Menu -->

        <!-- Start: Sidebar Collapse Button -->
        <div class="sidebar-toggle-mini">
            <a href="#">
                <span class="fa fa-sign-out"></span>
            </a>
        </div>
        <!-- End: Sidebar Collapse Button -->

    </div>
    <!-- End: Sidebar Left Content -->

</aside>