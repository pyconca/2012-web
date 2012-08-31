<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="utf-8" />
    <title>PyCon Canada</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <link href="${request.static_url("pyconca:static/libs/bootstrap-2.0.3/css/bootstrap.css")}" rel="stylesheet" />
    <link href="${request.static_url("pyconca:static/libs/bootstrap-2.0.3/css/bootstrap-responsive.css")}" rel="stylesheet" />
    <link href="${request.static_url("pyconca:static/pyconca.css")}" rel="stylesheet" />

    <script src="${request.static_url("pyconca:static/libs/jquery-1.7.2.min.js")}"></script>
    <script src="${request.static_url("pyconca:static/libs/bootstrap-2.0.3/js/bootstrap.min.js")}"></script>
    <script src="${request.static_url("pyconca:static/libs/handlebars-1.0.0.beta.6.js")}"></script>
    <link href='http://fonts.googleapis.com/css?family=Philosopher' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Special+Elite' rel='stylesheet' type='text/css'>

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <script src="http://widgets.twimg.com/j/2/widget.js"></script>
  </head>

  <body class="main-body">
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid main-nav">
          <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </a>

            <div class="nav-collapse">
              <ul class="nav">
                <li class="nav-item">
                  <a class="nav-link" href="${request.application_url}">
                      <i class="icon-home icon-white nav-icon"></i>
                      ${_(u"Home")}
                  </a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" href="${request.application_url}/about">
                      <i class="icon-info-sign icon-white nav-icon"></i>
                      ${_(u"About")}
                  </a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" href="${request.application_url}/venue">
                      <i class="icon-map-marker icon-white nav-icon"></i>
                      ${_(u"Venue")}
                  </a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" href="${request.application_url}/schedule">
                      <i class="icon-time icon-white nav-icon"></i>
                      ${_(u"Schedule")}
                  </a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" href="${request.application_url}/speakers">
                      <i class="icon-bullhorn icon-white nav-icon"></i>
                      ${_(u"Speak")}
                  </a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" href="${request.application_url}/learn">
                      <i class="icon-pencil icon-white nav-icon"></i>
                      ${_(u"Learn")}
                  </a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" href="${request.application_url}/sponsors">
                      <i class="icon-heart icon-white nav-icon"></i>
                      ${_(u"Sponsor")}
                  </a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" href="${request.application_url}/contact">
                      <i class="icon-envelope icon-white nav-icon"></i>
                      ${_(u"Contact")}
                  </a>
                </li>

                % if logged_in and request.user:
                  <li class="dropdown" id="menu1">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#menu1">
                      <i class="icon-user icon-white nav-icon"></i>
                      ${request.user.username}
                      <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                      % if is_admin:
                      <li>
                        <a class="nav-link"  href="${request.application_url}/talk">
                          <i class="icon-file nav-icon"></i>
                          ${_(u"Talks")}
                        </a>
                      </li>
                      <li>
                        <a class="nav-link"  href="${request.application_url}/user">
                          <i class="icon-th nav-icon"></i>
                          ${_(u"Users")}
                        </a>
                      </li>
                      % else:
                      <li>
                        <a class="nav-link"  href="${request.application_url}/new/talk">
                          <i class="icon-bullhorn nav-icon"></i>
                          ${_(u"Submit a Talk")}
                        </a>
                      </li>
                      <li>
                        <a class="nav-link"  href="${request.application_url}/talk">
                          <i class="icon-briefcase nav-icon"></i>
                          ${_(u"Your Talks")}
                        </a>
                      </li>
                      % endif:
                      <li class="divider"></li>
                      <li>
                        <a href="${request.application_url}/user/${logged_in}">
                          <i class="icon-cog nav-icon"></i>
                          ${_(u"Your Profile")}
                        </a>
                      </li>
                      <li>
                        <a class="nav-link" href="${request.application_url}/logout">
                          <i class="icon-remove nav-icon"></i>
                          ${_(u"Logout")}
                        </a>
                      </li>
                    </ul>
                  </li>
                % else:
                  <li class="nav-item">
                    <a class="nav-link" href="${request.application_url}/login">
                        <i class="icon-user icon-white nav-icon"></i>
                        ${_(u"Login")}
                    </a>
                  </li>

                  <li class="nav-item">
                    <a class="nav-link" href="${request.application_url}/new/user">
                        <i class="icon-star-empty icon-white nav-icon"></i>
                        ${_(u"Sign Up")}
                    </a>
                  </li>
                % endif
              </ul>
            </div><!--/.nav-collapse -->
          </div> <!-- main-row -->
        </div>
      </div>
    </div>

<div class="container-fluid">

  <div>
    <%block name="content"/>
  </div>

  <div id="footer-row" class="row-fluid hidden-phone">
    <div class="main-row">
      <div class="span12" style="text-align: center;" id="footer-links">
        <div>
          <ul id="footer-nav">
            <li class="footer-nav-link">
              <a class="nav-link" href="${request.application_url}">${_(u"Home")}</a>
            </li>

            <li class="footer-nav-link">
              <a class="nav-link" href="${request.application_url}/about">${_(u"About")}</a>
            </li>

            <li class="footer-nav-link">
              <a class="nav-link" href="${request.application_url}/contact">${_(u"Contact")}</a>
            </li>

            <li class="footer-nav-link">
              <a class="nav-link" href="${request.application_url}/venue">${_(u"Venue")}</a>
            </li>

            <li class="footer-nav-link">
              <a class="nav-link" href="${request.application_url}/schedule">${_(u"Schedule")}</a>
            </li>

            <li class="footer-nav-link">
              <a class="nav-link" href="${request.application_url}/speakers">${_(u"Speak")}</a>
            </li>

            <li class="footer-nav-link">
              <a class="nav-link" href="${request.application_url}/learn">${_(u"Learn")}</a>
            </li>

            <li class="footer-nav-link">
              <a class="nav-link" href="${request.application_url}/sponsors">${_(u"Sponsor")}</a>
            </li>

            <li class="footer-nav-link">
              <a class="nav-link" href="${request.application_url}/locale">${_(u"Français")}</a>
            </li>

            <li class="footer-nav-link">
              <a href="https://twitter.com/pyconca">@pyconca</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <div id="footer-links">
      <div id="footer-row" class="row-fluid visible-phone">
         <div class="main-row">
          <div class="span12">
            <a class="nav-link" href="${request.application_url}">${_(u"Home")}</a>
            <a class="nav-link pull-right" href="${request.application_url}/speakers">${_(u"Speak")}</a>
            <br>
            <a class="nav-link" href="${request.application_url}/venue">${_(u"Venue")}</a>
            <a class="nav-link pull-right" href="${request.application_url}/learn">${_(u"Learn")}</a>
            <br>
            <a class="nav-link" href="${request.application_url}/about">${_("About")}</a>
            <a class="nav-link pull-right" href="${request.application_url}/schedule">${_(u"Schedule")}</a>
            <br>
            <a class="nav-link" href="${request.application_url}/contact">${_(u"Contact")}</a>
            <a class="nav-link pull-right" href="${request.application_url}/sponsors">${_(u"Sponsor")}</a>
          </div>
        </div>
      </div>

      <div id="footer-row" class="row-fluid">
         <div class="main-row">
          <div class="span12" style="text-align: center;">
            <strong>${_(u"© PyCon Canada 2012")}</strong>
              <br>
              <a style="color: #aaa;"
                 href="http://www.flickr.com/photos/camstatic/5535319505">
                 ${_(u"photo by camstatic")}
              </a>
              <br>
              <br>
          </div>
        </div>
      </div>
  </div>

</div>

</body>
</html>
