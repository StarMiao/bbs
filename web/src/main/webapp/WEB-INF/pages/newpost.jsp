<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>OWL论坛 - 发送帖子</title>
    <link rel="stylesheet" href="static/css/all.css">

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
                    <a href="index.html">首页</a>
                </li>
                <li>
                    <strong>发表新帖</strong>
                </li>
            </ul>
        </div>
    </div>


    <div class="thread_create">

        <div class="col-md-9 main-col">
            <div class="panel panel-default corner-radius">
                <div class="panel-heading">发表新帖</div>
                <div class="panel-body">
                    <div class="reply-box form box-block">
                        <form method="POST" action="/newpost" accept-charset="UTF-8" id="thread_create_form" class="create_form">

                            <input name="username" type="hidden" value="${sessionScope.user.username}">
                            <div class="form-group">
                                <input class="form-control" id="title" placeholder="标题" name="title" type="text">
                            </div>

                            <div class="form-group">
                                <select class="form-control selectpicker" name="category">
                                    <option value="帮助">帮助</option>
                                    <option value="使用指南">使用指南</option>
                                </select>
                            </div>
                            <!-- editor start -->
                            <div class="editor-toolbar">

                                <ul class="nav nav-pills" style="clear:none;">
                                    <li class="edit active"><a href="#">编辑</a></li>

                                </ul>
                            </div>                    <!-- end -->
                            <div class="form-group">
                                <textarea class="post-editor form-control" rows="15" style="overflow:hidden" id="body_field" placeholder="请使用Markdown撰写内容" name="content" cols="50"></textarea>
                            </div>

                            <div class="form-group">
                                <select class="form-control js-tag-tokenizer" name="tag">

                                    <option value="Java">Java</option>
                                    <option value="Python">Python</option>
                                </select>
                                <small>
                                    请填写标签
                                </small>
                            </div>

                            <div class="form-group status-post-submit">
                                <input class="btn btn-primary col-xs-2" id="thread-create-submit" type="submit" value="发布">

                            </div>

                            <div class="box preview markdown-body" id="preview-box" style="display:none;"></div>

                        </form>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-md-3 side-bar">


            <div class="panel panel-default corner-radius help-box">
                <div class="panel-heading text-center">
                    <h3 class="panel-title">发帖提示</h3>
                </div>
                <div class="panel-body">
                    <ul class="list">
                        <li>主题标题
                            <p>请在标题中描述内容要点。</p>
                        </li>
                        <li>选择节点
                            <p>请为你的主题选择一个节点。恰当的归类会让你发布的信息更有用。</p>
                        </li>
                        <li>正文
                            <p>owl 支持 <span style="font-family: Consolas, 'Panic Sans', mono"><a href="https://help.github.com/articles/github-flavored-markdown" target="_blank">GitHub Flavored Markdown</a></span> 文本标记语法。你可以在页面下方实时预览正文的实际渲染效果。</p>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="panel panel-default corner-radius help-box">
                <div class="panel-heading text-center">
                    <h3 class="panel-title">社区指导原则</h3>
                </div>
                <div class="panel-body">
                    <ul class="list">
                        <li>尊重原创
                            <p>请不要在 OWL论坛 发布任何盗版链接，包括软件、音乐、电影等。</p>
                        </li>
                        <li>友好互助
                            <p>保持对陌生人的友善。用知识去帮助别人。</p>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>


</div>

<%@include file="footer.jsp"%>

</body>
</html>
