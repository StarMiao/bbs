<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>OWL论坛 - 登录页面</title>
    <link rel="stylesheet" href="static/css/all.css">

    <!-- Favicon -->
    <link rel="shortcut icon" href="/images/maotouying.png">

</head>
<body class="forum" data-page="forum">

<%@ include file="header.jsp" %>

<div id="main" class="main-container container">


    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">登录
                        <span class="panel-heading" style="color: crimson;margin: 19%">${msg}</span>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="POST" action="/login">

                            <div class="form-group">
                                <input type="login" class="form-control" name="username" value="" placeholder="用户名">
                            </div>

                            <div class="form-group">
                                <input type="password" class="form-control" name="password" placeholder="密码" required="required">
                            </div>
                            <div class="form-group">
                                <input type="submit" name="commit" value="登录" class="btn btn-primary btn-lg btn-block" required="required">
                            </div>
                        </form>
                    </div>
                    <div class="panel-footer">
                        <a href="">注册</a>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-heading">用其他平台的帐号登录</div>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a href="###" class="btn btn-default btn-lg btn-block"><i class="fa fa-github"></i> Github</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>

<%@ include file="footer.jsp" %>

</body>
</html>
