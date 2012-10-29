<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if IE 9]>         <html class="no-js ie9"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js"> <!--<![endif]-->
  <head>
    <meta charset="utf-8" />
    <title><%block name="head_title"></%block> | PyCon Canada</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description"
    	content='<%block name="head_description">Your connection to the Python Canada community. We are the momentum 
    	behind the Canadian PyCon conference, and the source for local Python programmers, events, and jobs.</%block>' />
    <meta name="author" content="" />

    <link href="${request.static_url("pyconca:static/libs/bootstrap-2.0.3/css/bootstrap.css")}" rel="stylesheet" />
    <link href="${request.static_url("pyconca:static/libs/bootstrap-2.0.3/css/bootstrap-responsive.css")}" rel="stylesheet" />
    <link href="${request.static_url("pyconca:static/pycon.css")}" rel="stylesheet" />

    <script src="${request.static_url("pyconca:static/libs/jquery-1.7.2.min.js")}"></script>
    <script src="${request.static_url("pyconca:static/libs/bootstrap-2.0.3/js/bootstrap.min.js")}"></script>
    <script src="${request.static_url("pyconca:static/libs/handlebars-1.0.0.beta.6.js")}"></script>
    <script src="${request.static_url("pyconca:static/js/handlebars-helpers.js")}"></script>
    <script src="${request.static_url("pyconca:static/libs/jquery.tinycarousel.min.js")}"></script>

    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic' rel='stylesheet' type='text/css'>

    <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!--<script src="//widgets.twimg.com/j/2/widget.js"></script>-->
  </head>

  <body class="<%block name='body_class'/>">
    <header id="MainHeader">
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

                  <li class="dropdown">
                    <a class="dropdown-toggle nav-about" data-toggle="dropdown" href="#">
                        ${_(u"About")}
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a href="${request.route_url('about')}">
                          ${_(u"About")}
                        </a>
                      </li>
                      <li>
                        <a href="${request.route_url('conduct')}">
                          ${_(u"Code of Conduct")}
                        </a>
                      </li>
                    </ul>
                  </li>

                  <li>
                    <a href="${request.application_url}/venue" class="nav-venue">
                        ${_(u"Venue")}
                    </a>
                  </li>

                  <li class="dropdown">
                    <a class="dropdown-toggle nav-schedule" data-toggle="dropdown" href="#">
                        ${_(u"Schedule")}
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a href="${request.route_url('schedule')}">
                          ${_(u"Conference")}
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
                    <a href="${request.application_url}/speakers" class="nav-speak">
                        ${_(u"Speak")}
                    </a>
                  </li>

                  <li>
                    <a href="${request.application_url}/learn" class="nav-learn">
                        ${_(u"Learn")}
                    </a>
                  </li>

                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle nav-sponsor" data-toggle="dropdown" href="#">
                      ${_(u"Sponsors")}
                      <b class="caret"></b>
                  </a>
                  <ul class="dropdown-menu">
                    <li>
                      <a href="${request.route_url('sponsors')}">
                        ${_(u"All Sponsors")}
                      </a>
                    </li>
                    <li>
                      <a href="${request.route_url('sponsors_500px')}">
                        ${_(u"Gold Sponsor • 500px")}
                      </a>
                    </li>
                    <li>
                      <a href="${request.route_url('sponsors_freshbooks')}">
                        ${_(u"Silver Sponsor • FreshBooks")}
                      </a>
                    </li>
                    <li>
                      <a href="${request.route_url('sponsors_chango')}">
                        ${_(u"Silver Sponsor • Chango")}
                      </a>
                    </li>
                    <li>
                      <a href="${request.route_url('sponsors_wave')}">
                        ${_(u"Silver Sponsor • Wave")}
                      </a>
                    </li>
                    <li>
                      <a href="${request.route_url('directory')}">
                        ${_(u"Independent Sponsors")}
                      </a>
                    </li>
                  </ul>
                </li>
                  <li>
                    <a href="${request.application_url}/contact" class="nav-contact">
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
            <div class="fake-head">${_(u"Get in touch")}</div>
            <ul class="unstyled contact-list">
              <li><span>Twitter</span> <a href="http://twitter.com/pyconca">@pyconca</a></li>
              <li><span>IRC</span> <a href="irc://irc.freenode.net/#pyconca">#pyconca</a></li>
              <li><span>${_(u"Board")}</span> <a href="mailto:organizers@pycon.ca">organizers@pycon.ca</a></li>
              <li><span>${_(u"List")}</span> <a href="mailto:pyconca@googlegroups.com">pyconca@googlegroups.com</a></li>
              <li><span>GitHub</span> <a href="http://github.com/pyconca">github.com/pyconca</a></li>
              <li><span>${_(u"Volunteer")}</span> <a href="${request.application_url}/volunteer">pycon.ca/volunteer</a></li>
            </ul>
          </div>
        </div>
      </div>
    </footer>

    <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-35491606-1']);
      _gaq.push(['_trackPageview']);
      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    </script>

</body>
</html>
