<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><%= request.getParameter("page_title") %></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link href="/COMP6006BugTracker/app/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/COMP6006BugTracker/app/css/styles.css" rel="stylesheet" media="screen">
        <script src="/COMP6006BugTracker/app/js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->
        <header>
            <div class="container">
                <h1>COMP 6006 Bug Tracker</h1>
            </div>
        </header>
        <div class="container">
            <div class="row">
                <div class="span3">
                    <ul class="nav nav-list affix sidenav">
                        <li><a href="/COMP6006BugTracker/app"><i class="icon-chevron-right"></i> Home</a></li>
                        <li><a href="/COMP6006BugTracker/app/bugs/list.jsp"><i class="icon-chevron-right"></i> Tracker</a></li>
                        <li><a href="/COMP6006BugTracker/app/bugs/search.jsp"><i class="icon-chevron-right"></i> Search</a></li>
                        <li><a href="/COMP6006BugTracker/app/bugs/new.jsp"><i class="icon-chevron-right"></i> Submit Bug</a></li>
                    </ul>
                </div>
                <div class="span9">
