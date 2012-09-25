<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="utf-8" />
    <title>PyCon Canada <%block name="page_title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <link href="${request.static_url("pyconca:static/libs/bootstrap-2.0.3/css/bootstrap.css")}" rel="stylesheet" />
    <link href="${request.static_url("pyconca:static/libs/bootstrap-2.0.3/css/bootstrap-responsive.css")}" rel="stylesheet" />
    <link href="${request.static_url("pyconca:static/pycon.css")}" rel="stylesheet" />

    <script src="${request.static_url("pyconca:static/libs/jquery-1.7.2.min.js")}"></script>
    <script src="${request.static_url("pyconca:static/libs/bootstrap-2.0.3/js/bootstrap.min.js")}"></script>
    <script src="${request.static_url("pyconca:static/libs/handlebars-1.0.0.beta.6.js")}"></script>

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic' rel='stylesheet' type='text/css'>

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!--<script src="http://widgets.twimg.com/j/2/widget.js"></script>-->
  </head>

  <body class="<%block name='body_class'/>">
    <header>
      <div id="o-hai-can-haz-snake"></div>
      <nav class="navbar clearfix">
              <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </a>

              <div class="nav-collapse">
                <ul class="nav">
                  <li class="nav-home">
                    <a href="${request.application_url}">
                        <i class="icon-home icon-white nav-icon"></i>
                    </a>
                  </li>

                  <li>
                    <a href="${request.application_url}/about">
                        ${_(u"About")}
                    </a>
                  </li>

                  <li>
                    <a href="${request.application_url}/venue">
                        ${_(u"Venue")}
                    </a>
                  </li>

                  <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        ${_(u"Schedule")}
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a href="${request.route_url('schedule')}">
                          ${_(u"Conference Schedule")}
                        </a>
                      </li>
                      <li>
                        <a href="${request.route_url('sprints')}">
                          ${_(u"Sprints")}
                        </a>
                      </li>
                    </ul>
                  </li>

                  <li>
                    <a href="${request.application_url}/speakers">
                        ${_(u"Speak")}
                    </a>
                  </li>

                  <li>
                    <a href="${request.application_url}/learn">
                        ${_(u"Learn")}
                    </a>
                  </li>

                  <li>
                    <a href="${request.application_url}/sponsors">
                        ${_(u"Sponsor")}
                    </a>
                  </li>

                  <li>
                    <a href="${request.application_url}/contact">
                        ${_(u"Contact")}
                    </a>
                  </li>

                  % if logged_in and request.user:
                    <li class="dropdown nav-spacer nav-auth" id="menu1">
                      <a class="dropdown-toggle" data-toggle="dropdown" href="#menu1">
                        ${request.user.username}
                        <b class="caret"></b>
                      </a>
                      <ul class="dropdown-menu">
                        % if is_admin:
                        <li>
                          <a href="${request.application_url}/talk">
                            ${_(u"Talks")}
                          </a>
                        </li>
                        <li>
                          <a href="${request.application_url}/user">
                            ${_(u"Users")}
                          </a>
                        </li>
                        % else:
                        <li>
                          <a href="${request.application_url}/new/talk">
                            ${_(u"Submit a Talk")}
                          </a>
                        </li>
                        <li>
                          <a href="${request.application_url}/talk">
                            ${_(u"Your Talks")}
                          </a>
                        </li>
                        % endif:
                        <li class="divider"></li>
                        <li>
                          <a href="${request.application_url}/user/${logged_in}">
                            ${_(u"Your Profile")}
                          </a>
                        </li>
                        <li>
                          <a href="${request.application_url}/logout">
                            ${_(u"Logout")}
                          </a>
                        </li>
                      </ul>
                    </li>
                  % else:
                    <li class="nav-spacer nav-auth">
                      <a href="${request.application_url}/login">
                          ${_(u"Login")}
                      </a>
                    </li>

                    <li class="nav-auth">
                      <a href="${request.application_url}/new/user">
                          ${_(u"Sign Up")}
                      </a>
                    </li>
                  % endif

                  <li class="nav-spacer">
                    <a href="${request.application_url}/locale" class="locale-toggle">
                        <i class="icon-canada nav-icon"></i>
                        ${_(u"Français")}
                    </a>
                  </li>
                </ul>
              </div>
      </nav>
    </header>

    <%block name="content"/>

    <footer>
    <div class="container">
      <div class="row-fluid">
          <div class="span6">
            <nav>
              <ul class="unstyled">
                <li>
                  <a href="${request.application_url}">${_(u"Home")}</a>
                </li>

                <li>
                  <a href="${request.application_url}/about">${_(u"About")}</a>
                </li>

                <li>
                  <a href="${request.application_url}/contact">${_(u"Contact")}</a>
                </li>

                <li>
                  <a href="${request.application_url}/venue">${_(u"Venue")}</a>
                </li>

                <li>
                  <a href="${request.application_url}/schedule">${_(u"Schedule")}</a>
                </li>

                <li>
                  <a href="${request.application_url}/speakers">${_(u"Speak")}</a>
                </li>

                <li>
                  <a href="${request.application_url}/learn">${_(u"Learn")}</a>
                </li>

                <li>
                  <a href="${request.application_url}/sponsors">${_(u"Sponsor")}</a>
                </li>

                <li>
                  <a href="${request.application_url}/locale" class="locale-toggle">
                    <i class="icon-canada nav-icon"></i>
                    ${_(u"Français")}
                  </a>
                </li>
              </ul>
            </nav>
            <p>
              ${_(u"© PyCon Canada 2012")}
              <br>
              <a href="http://www.flickr.com/photos/camstatic/5535319505">${_(u"Photo by camstatic")}</a>
            </p>
          </div>

          <div class="span6">
            <h3>${_(u"Get in touch")}</h3>
            <ul class="unstyled contact-list">
              <li><span>Twitter</span> <a href="http://twitter.com/pyconca">@pyconca</a></li>
              <li><span>IRC</span> <a href="irc://irc.freenode.net/#pyconca">#pyconca</a></li>
              <li><span>${_(u"Board")}</span> <a href="mailto:organizers@pycon.ca">organizers@pycon.ca</a></li>
              <li><span>${_(u"List")}</span> <a href="mailto:pyconca@googlegroups.com">pyconca@googlegroups.com</a></li>
              <li><span>GitHub</span> <a href="http://github.com/pyconca">github.com/pyconca</a></li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
</body>
</html>
