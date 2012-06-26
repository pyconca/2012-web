<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="utf-8" />
    <title>PyCon Canada</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- Le styles -->
    <link href="${request.static_url("pyconca:static/pyconca.css")}" rel="stylesheet" />
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
    </style>
    <link href="${request.static_url("pyconca:static/libs/bootstrap-2.0.3/css/bootstrap-responsive.css")}" rel="stylesheet" />
    <script src="${request.static_url("pyconca:static/libs/jquery-1.7.2.min.js")}"></script>
    <script src="${request.static_url("pyconca:static/libs/bootstrap-2.0.3/js/bootstrap.min.js")}"></script>
    <script src="${request.static_url("pyconca:static/libs/handlebars-0.9.0.pre.3.js")}"></script>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <script src="http://widgets.twimg.com/j/2/widget.js"></script>

  </head>

  <body class="main-body">

    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid main-nav">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>

          <a class="brand" href="${request.application_url}">PyCon Canada</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li class="divider-vertical"></li>

              <li>
                <a class="nav-link" href="${request.application_url}">
                    <i class="icon-home icon-white nav-icon"></i>
                    Home
                </a>
              </li>

              <li class="divider-vertical"></li>

              <li>
                <a class="nav-link" href="${request.application_url}/about">
                    <i class="icon-info-sign icon-white nav-icon"></i>
                    About
                </a>
              </li>

              <li class="divider-vertical"></li>

              <li>
                <a class="nav-link" href="#">
                    <i class="icon-asterisk icon-white nav-icon"></i>
                    Venue
                </a>
              </li>

              <li class="divider-vertical"></li>

              % if logged_in:
                  <li>
                    <a class="nav-link" href="${request.application_url}/logout">
                        <i class="icon-remove icon-white nav-icon"></i>
                        Logout
                    </a>
                  </li>
              % else:
                  <li>
                    <a class="nav-link" href="${request.application_url}/login">
                        <i class="icon-user icon-white nav-icon"></i>
                        Login
                    </a>
                  </li>
              % endif

              <li class="divider-vertical"></li>

              <li>
                <a class="nav-link" href="${request.application_url}/new/user">
                    <i class="icon-star-empty icon-white nav-icon"></i>
                    Create Account
                </a>
              </li>

              <li class="divider-vertical"></li>
            </ul>

            % if logged_in:
                <p class="navbar-text pull-right">
                    Logged in as 
                    <a href="${request.application_url}/user/${logged_in}">
                        ${request.user.username}
                    </a>
                </p>
            % endif

          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container-fluid main-container">

      <div>
        <%block name="content"/>
      </div>

      <hr />

      <footer>
        <h6>&copy; PyCon Canada 2012</h6>
      </footer>

    </div><!--/.fluid-container-->

  </body>
</html>
