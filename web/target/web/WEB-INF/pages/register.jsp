<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>OWL论坛 - 注册页面</title>
    <link rel="stylesheet" href="/static/css/all.css">

    <!-- Favicon -->
    <link rel="shortcut icon" href="/images/maotouying.png">

    <script type="text/javascript">
        function validate_form(){
            // 获得密码的值
            var password = document.getElementById("password").value;
            // 获得确认密码的值
            var repassword = document.getElementById("password_confirm").value;
            if(repassword != password){
                document.getElementById("msg").innerHTML = "两次密码输入不一致";
                return false;
            }
            return true;
        }
    </script>

</head>
<body class="forum" data-page="forum">

<%@ include file="header.jsp" %>

<div id="main" class="main-container container">


    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-default">
                    <div class="panel-heading">注册</div>
                    <div class="panel-body">
                        <form role="form" method="POST" action="${pageContext.request.contextPath }/register"
                              onsubmit="return validate_form()" enctype="multipart/form-data">

                            <p style="font-size: 15px;color: #dc143c" id="msg"></p>

                            <div class="form-group">
                                <input type="text" class="form-control" name="username" value="" placeholder="用户名" required="required">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" name="email" value="" placeholder="邮箱地址" required="required">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="password" name="password" placeholder="密码" required="required">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="password_confirm" name="password_confirm" placeholder="确认密码" required="required">
                            </div>
                            <div class="form-group">
                                <label>上传头像</label>
                                <input type="file" name="file" placeholder="上传头像" required="required">
                            </div>

                            <button type="submit" class="btn btn-primary">
                                注册
                            </button>
                            <a href="" class="btn btn-default">取消</a>
                    </div>
                    </form>
                </div>
                <div class="panel-footer">
                    已注册或使用其他账号登录，请点击 <a href="/to_login">这里</a> 进行登录。
                </div>
            </div>
        </div>
    </div>
</div>

</div>

<%@ include file="footer.jsp" %>

</body>
</html>
