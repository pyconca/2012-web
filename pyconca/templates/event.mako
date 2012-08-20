<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">

<div class="row-fluid">
  <div class="span12 sub-header-container">
    <div class="row-fluid sub-header-image">
      <div class="span12 top-row">
        <h1 class="header-main-text"><%block name="title"/></h1>
        <h2 class="header-sub-text">PyCon Canada 2012</h2>
        <h2 class="header-sub-text">Toronto, November 9th - 11th</h2>
      </div>
    </div>
  </div>
</div>

<div class="row-fluid">
  <div class="content-holder">
    <div class="row-fluid">

      <div class="span3">
        <h3>Quick Links</h3>
        <ul id="sidenav" class="sidenav side-block"></ul>

        % if request['bfg.routes.route'].name != 'sponsors':
        <h3>Sponsors</h3>
        <div id="sponsors_carousel" class="carousel slide side-block">
          <div class="carousel-inner">
            <div class="active item">
              <a href="http://500px.com/">
                <img src="${request.static_url("pyconca:static/500px_logo_color.png")}"
                     width="200px;" height="100px;" alt="">
              </a>

             <br>

             <a href="http://www.freshbooks.com/">
               <img src="${request.static_url("pyconca:static/freshbooks.gif")}"
                    width="200px;" height="100px;" alt="">
             </a>

             <br>
             <br>
             <br>

              <a href="http://waveaccounting.com/">
                <img src="${request.static_url("pyconca:static/thumb-logo-wave-accounting.png")}"
                     alt="">
              </a>

             <br>
             <br>

              <a href="http://www.python.org/psf/">
                <img src="${request.static_url("pyconca:static/psf-logo-317x71-alpha.png")}"
                     alt="">
              </a>

            </div>
          </div>
        </div>
        % endif

        <script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
        <script>
        new TWTR.Widget({
          version: 2,
          type: 'search',
          search: 'pycon.ca OR \"PyCon Canada\" OR pyconca',
          interval: 30000,
          title: 'Nov 9th-11th 2012, Toronto',
          subject: 'PyCon Canada',
          width: 'auto',
          height: 400,
          theme: {
            shell: {
              background: '#423f39',
              color: '#ffffff'
            },
            tweets: {
              background: '#ffffff',
              color: '#444444',
              links: '#1985b5'
            }
          },
          features: {
            scrollbar: true,
            loop: false,
            live: true,
            behavior: 'all'
          }
        }).render().start();
        </script>

      </div>

      <div class="span9 content-column">
        <%block name="info"/>
      </div>

    </div>
  </div>
</div>

<script>
  function createSidenav() {
    $(".header").each(function() {
      var $this = $(this);
      var navItemHolder = $("<li></li>");
      var navItem = $("<a></a>");

      if (!$this.attr("id")) {
        console.log($this.text());
        var anchor = $this.text()
          .toLowerCase()
          .replace(" ", "-")
          .replace(/ /g, "")
          .replace(/[^a-z0-9-]/g, "");
        $this.attr("id", anchor);
      }

      navItem
        .text($this.text())
        .addClass("sidenav-link btn")
        .attr("href", "#" + $this.attr("id"));

      navItemHolder
        .append(navItem)
        .addClass("sidenav-item");

      $("#sidenav").append(navItemHolder);
    });
  };

  $(function() {
    createSidenav();
    $('.carousel').carousel({
      interval: 3000
    });
  });
</script>

</%block>
