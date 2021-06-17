<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="col-md-3 side-bar">
    <div class="panel panel-default corner-radius">
        <div class="panel-heading">
            <h3 class="panel-title">BBS</h3>
        </div>
        <!-- 已登录的情况 -->
        <c:if test="${sessionScope.user != null}">
            <div class="panel-body text-center">
                <a href="/to_newpost" class="btn btn-primary">
                    <i class="fa fa-user"> </i> 发帖
                </a>
            </div>
        </c:if>

        <!-- 未登录的情况 -->
        <c:if test="${sessionScope.user == null}">
            <div class="panel-body text-center">
                <a href="/to_register" class="btn btn-primary">
                    <i class="fa fa-user"> </i> 注册
                </a>
            </div>
            <div class="panel-footer text-center">
                已注册用户请 <a href="/to_login">登录</a>
            </div>
        </c:if>
    </div>

    <div class="panel panel-default corner-radius">
        <div class="panel-heading">
            <h3 class="panel-title">小贴士</h3>
        </div>
        <div class="panel-body">
            这里可以设置BBS的小贴士!
        </div>
    </div>

    <div class="panel panel-default corner-radius">
        <div class="panel-heading">
            <h3 class="panel-title">统计信息</h3>
        </div>
        <ul class="list-group">
            <li class="list-group-item">社区会员: ${userNum}</li>
            <li class="list-group-item">主题帖数: ${postNum}</li>
            <c:if test="${post.id != null}">
                <li class="list-group-item">回帖数: ${commentNum}</li>
            </c:if>
        </ul>
    </div>

</div>
<div class="clearfix"></div>

</div>