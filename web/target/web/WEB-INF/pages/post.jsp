<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>OWL论坛 - 帖子页面</title>
    <link rel="stylesheet" href="/static/css/all.css">

    <!-- Favicon -->
    <link rel="shortcut icon" href="/images/maotouying.png">

</head>
<body class="forum" data-page="forum">

        <%@ include file="header.jsp" %>

<div id="main" class="main-container container">
    <div class="row max-width">
        <div class="col-xs-12">
            <ul class="breadcrumb">
                <li>
                    <a href="/home">首页</a>
                </li>
                <li>
                    <strong><!-- 此处显示帖子标题 -->${post.title}</strong>
                </li>
            </ul>
        </div>
    </div>

    <div class="col-md-9 threads-show main-col">

        <!-- Thread Detial -->
        <div class="thread panel panel-default">
            <div class="infos panel-heading">

                <div class="pull-right avatar">
                    <a href="###"> <img src="${post.path}" class="media-object img-thumbnail avatar-64"/> </a>
                </div>

                <h1 class="panel-title thread-title"><!-- 此处显示帖子标题 -->${post.title}</h1>

                <div class="meta inline-block">

                    <a href="###"> <!-- 此处显示发帖人用户名 -->${post.title} </a>

                    • 于 <abbr title="" class="timeago"><spring:eval expression="post.createTime"/></abbr>

                    发布
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="panel-body content-body">

                <div class="markdown-body" id="emojify">
                    <ul>
                        <li><!-- 此处显示帖子内容 -->${post.content}</li>
                    </ul>
                </div>

            </div>

            <div class="panel-footer operate">

                <div class="pull-left" style="font-size:15px;">
                    <a class=""
                       href="http://service.weibo.com/share/share.php?url=http%3A%2F%2Fstarmiao.com%2Fthread%2F10&type=3&pic=&title=starmiao 接下来需要完善的功能"
                       target="_blank" title="分享到微博"> <i class="fa fa-weibo"></i> </a> <a
                        href="https://twitter.com/intent/tweet?url=http%3A%2F%2Fstarmiao.com%2Fthread%2F10&text=starmiao 接下来需要完善的功能&via=starmiao.com"
                        class="" target="_blank" title="分享到 Twitter"> <i class="fa fa-twitter"></i> </a> <a
                        href="http://www.facebook.com/sharer.php?u=http%3A%2F%2Fstarmiao.com%2Fthread%2F10" class=""
                        target="_blank" title="分享到 Facebook"> <i class="fa fa-facebook"></i> </a> <a
                        href="https://plus.google.com/share?url=http%3A%2F%2Fstarmiao.com%2Fthread%2F10" class=""
                        target="_blank" title="分享到 Google Plus"> <i class="fa fa-google-plus"></i> </a>
                </div>

                <div class="pull-right">
          <span class="tag-list hidden-xs">
      Tags:
            <a href="###"><span class="tag">${post.tag}</span></a>
            </span>

                </div>
                <div class="clearfix"></div>
            </div>

            <div class="modal fade" id="exampleModal" tabindex="-1" role="" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="exampleModalLabel">备注内容</h4>
                        </div>

                        <form method="POST" action="" accept-charset="UTF-8">


                            <div class="modal-body">

                                <div class="alert alert-warning">
                                    附加备注, 使用此功能的话, 会给所有参加过讨论的人发送通知.
                                </div>

                                <div class="form-group">
                                    <textarea class="form-control" style="min-height:20px" placeholder="请使用Markdown撰写内容"
                                              name="content" cols="50" rows="10"></textarea>

                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary">提交</button>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>

        <!-- Reply List -->
        <div class="replies panel panel-default list-panel replies-index">
            <div class="panel-heading">
                <div class="total">回复总数: <b>${commentNum}</b></div>
            </div>

            <div class="panel-body">

                <ul class="list-group row">
                    <c:forEach items="${comments}" var="comment" varStatus="st">
                        <li class="list-group-item media " id="reply11">
                            <div class="avatar pull-left">
                                <a href="###"> <img class="/media-object img-thumbnail avatar" alt="strdemo"
                                                        src="${comment.path}" style="width:48px;height:48px;"/>
                                </a>
                            </div>
                            <div class="infos">
                                <div class="media-heading meta">
                                    <b>#${fn:length(comments) - st.index}</b>
                                    <a href="###" title="strdemo" class="remove-padding-left author">
                                        ${comment.userName}
                                    </a>
                                    <abbr class="timeago" title="create_time">• 回帖时间 • </abbr>
                                    <a name="reply1" class="anchor" href="#reply1" aria-hidden="true">
                                        <spring:eval expression="comment.createTime"/>
                                    </a>
                                </div>
                                <div class="media-body markdown-reply content-body">
                                    ${comment.content}
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <!-- Pager -->
                <div class="pull-right" style="padding-right:20px">

                </div>
            </div>
        </div>

        <!-- Reply Box -->
        <div class="panel panel-default">
            <div class="panel-heading">
                发表回复
            </div>
            <div class="panel-body">
                <div class="reply-box form">
                        <!-- 已经登录的情况 -->
                    <c:if test="${sessionScope.user != null}">
                        <form method="POST" action="/reply" accept-charset="UTF-8" id="thread_create_form" class="create_form">
                            <input type="hidden" name="postId" value="${post.id}">
                            <input type="hidden" name="userId" value="${sessionScope.user.id}">
                            <input type="hidden" name="userName" value="${sessionScope.user.username}">
                            <div class="form-group">
                                <textarea class="post-editor form-control" rows="5" style="overflow:hidden" id="content" placeholder="请使用Markdown撰写内容" name="content" cols="50"></textarea>
                            </div>
                            <div class="form-group status-post-submit">
                                <input class="btn btn-primary col-xs-2" id="thread-create-submit" type="submit" value="回复">
                            </div>
                        </form>
                    </c:if>
                    <!-- 未登录的情况 -->
                    <c:if test="${sessionScope.user == null}">
                        <div style="padding:20px;">
                            需要 <a class="btn btn-success" href="/to_login">登录</a> 后方可回复, 如果你还没有账号请点击这里 <a
                                class="btn btn-primary" href="/to_register">注册</a>。
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

    </div>

    <%@ include file="sidebar.jsp" %>

    <%@include file="footer.jsp"%>

</body>
</html>
