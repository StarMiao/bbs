<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>

<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <title>欢迎使用OWL BBS管理系统</title>
    <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme" />
    <meta name="description" content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
    <meta name="author" content="AbsoluteAdmin">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Theme CSS -->
    <link rel="stylesheet" type="text/css" href="assets/skin/default_skin/css/theme.css">

    <!-- Admin Forms CSS -->
    <link rel="stylesheet" type="text/css" href="assets/admin-tools/admin-forms/css/admin-forms.css">

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/img/favicon.png">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body class="external-page external-alt sb-l-c sb-r-c">

<!-- Start: Main -->
<div id="main" class="animated fadeIn">

    <!-- Start: Content-Wrapper -->
    <section id="content_wrapper">

        <!-- Begin: Content -->
        <section id="content">

            <div class="admin-form theme-info mw500" id="login">

                <!-- Login Logo -->
                <div class="content-header">
                    <h1>OWL BBS</h1>
                    <p class="lead">欢迎使用OWL BBS管理系统</p>
                    <p class="lead" style="color: crimson">${requestScope.msg}</p>
                </div>
                <!-- Login Panel/Form -->
                <div class="panel mt30 mb25">

                    <form method="post" action="/admin_login" id="contact">
                        <div class="panel-body bg-light p25 pb15">


                            <!-- Username Input -->
                            <div class="section">
                                <label for="adminname" class="field-label text-muted fs18 mb10">用户名</label>
                                <label for="adminname" class="field prepend-icon">
                                    <input type="text" name="adminname" id="adminname" class="gui-input" placeholder="请输入用户名...">
                                    <label for="adminname" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>

                            <!-- Password Input -->
                            <div class="section">
                                <label for="adminname" class="field-label text-muted fs18 mb10">密码</label>
                                <label for="password" class="field prepend-icon">
                                    <input type="password" name="password" id="password" class="gui-input" placeholder="请输入密码...">
                                    <label for="password" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                </label>
                            </div>
                        </div>

                        <div class="panel-footer clearfix">
                            <button type="submit" class="button btn-primary mr10 pull-right">登录</button>
                        </div>

                    </form>
                </div>



            </div>

        </section>
        <!-- End: Content -->

    </section>
    <!-- End: Content-Wrapper -->

</div>
<!-- End: Main -->

</body>

</html>

