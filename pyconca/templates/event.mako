<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">

<div class="row-fluid">
  <div class="span12 sub-header-container">
    <div class="row-fluid sub-header-image">
      <div class="span12 top-row">
        <h1 class="header-main-text"><%block name="title"/></h1>
        <h2 class="header-sub-text">${_(u"PyCon Canada 2012")}</h2>
        <h2 class="header-sub-text">${_(u"Toronto, November 9th - 11th")}</h2>
      </div>
    </div>
  </div>
</div>

<div class="row-fluid">
  <div class="content-holder">
    <div class="row-fluid">

      <div class="span3">
        <h3>${_(u"Quick Links")}</h3>
        <ul id="sidenav" class="sidenav side-block"></ul>

        % if request['bfg.routes.route'].name != 'sponsors':
        <h3>${_("Sponsors")}</h3>
        <div id="sponsors_carousel" class="carousel slide side-block">
          <div class="carousel-inner">
            <div class="active item">

             <%include file="pyconca:templates/sponsors/500px.mako"/>

             <br>

             <%include file="pyconca:templates/sponsors/freshbooks.mako"/>

             <br>
             <br>
             <br>

             <%include file="pyconca:templates/sponsors/wave.mako"/>

             <br>
             <br>

             <%include file="pyconca:templates/sponsors/psf.mako"/>

             <br>
             <br>

             <%include file="pyconca:templates/sponsors/vmfarms.mako"/>

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
