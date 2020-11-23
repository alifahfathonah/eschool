<!DOCTYPE html>
<html>
<head>
    <?php
    require "../auth/session.php";
    require "../connection/db_connect.php";
    include "../inc/header.php";
    ?>

</head>

<body>

<div id="wrapper">
    <?php require "../auth/login_level.php"; ?>
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-sm-4">
            <h2><a href="forum_main.php">Forum</a> - post view</h2>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox-content forum-post-container" style="min-height: 300px;">
            <div class="forum-post-info">
                <h4><span class="text-navy"><i class="fa fa-globe"></i> forum_name</span> -
                    Announcements - <span class="text-muted">Free talks</span></h4>
            </div>
            <br>

            <div class="col">
                <div class="col-sm-12">
                    <div class="form-group">
                        <input type="text" class="form-control" maxlength="100" placeholder="Post title"
                               id="post_title">
                    </div>
                    <textarea class="forum-textarea" maxlength="2000" placeholder="Write your thoughts here..."
                              id="post_text"></textarea>
                    <button type="button" class="btn btn-primary pull-right"
                            onclick="">Post
                    </button>
                </div>
            </div>
            <div class="post_div">
                    <div class="media">
                        <a class="forum-avatar" href="profile.php">
                            <img src="img/a1.jpg" class="img-circle" alt="image">
                            <div class="author-info">
                                <strong>Posted:</strong> time<br/>
                            </div>
                        </a>
                        <div class="media-body">
                            <h4 class="media-heading">post_title</h4>
                            <br/><br/>
                         post
                            <br/><br/>
                            - first last names
                                <div class="media">
                                    <a class="forum-avatar" href="#">
                                        <img src="img/a8.jpg" class="img-circle" alt="image">
                                        <div class="author-info">
                                            <strong>Commented:</strong> time<br/>
                                        </div>
                                    </a>
                                    <div class="media-body">
                                        comment
                                        <br/><br/>
                                        - first last names
                                    </div>
                                </div>
                        </div>
                        <button type="button" class="btn btn-default pull-right commentbtn"><i
                                    class="fa fa-comment-o"></i></button>
                        <br><br><br>
                        <div class="col" style="display: none">
                            <div class="col-sm-12">
                                <textarea class="forum-textarea" maxlength="2000"
                                          placeholder="Write your comment here..." id="comm_text"></textarea>
                                <button type="button" class="btn btn-primary pull-right"
                                        onclick="">
                                    Comment
                                </button>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>

</div>
</div>
<?php include('../inc/jscript.php') ?>
</body>


<!-- Mirrored from webapplayers.com/inspinia_admin-v2.7/forum_post.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 30 Mar 2017 13:45:43 GMT -->
</html>
