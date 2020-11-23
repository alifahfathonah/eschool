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
    <?php
    require "../auth/login_level.php";
    ?>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-4">
                <h2>Forum</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content animated fadeInRight">

                    <div class="ibox-content m-b-sm border-bottom">
                        <div class="p-xs">
                            <div class="pull-left m-r-md">
                                <i class="fa fa-globe text-navy mid-icon"></i>
                            </div>
                            <h2>Welcome in Inspinia Forum</h2>
                            <span>Feel free to choose topic you're interested in.</span>
                        </div>
                    </div>

                    <div class="ibox-content forum-container">

                        <div class="forum-title">
                            <div class="pull-right forum-desc">
                                <samll>Total posts: 0</samll>
                            </div>
                            <h3>General subjects</h3>
                        </div>
                        <div class="forum-item">
                            <div class="row">
                                <div class="col-md-9">
                                    <div class="forum-icon">
                                        <i class=""></i>
                                    </div>
                                    <a href="forum_post.php?subject=" class="forum-item-title">sub_name</a>
                                    <div class="forum-sub-title">sub_desc</div>
                                </div>
                                <div class="col-md-1 forum-info">
                                        <span class="views-number">
                                            0
                                        </span>
                                    <div>
                                        <small>Views</small>
                                    </div>
                                </div>
                                <div class="col-md-1 forum-info">
                                        <span class="views-number">
                                            0
                                        </span>
                                    <div>
                                        <small>Topics</small>
                                    </div>
                                </div>
                                <div class="col-md-1 forum-info">
                                        <span class="views-number">
                                            0
                                        </span>
                                    <div>
                                        <small>Posts</small>
                                    </div>
                                </div>
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
</html>
