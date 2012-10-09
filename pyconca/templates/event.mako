<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">
<div class="container">
  <div class="row-fluid">
    <section id="MainContent" class="span9">
      <header>
        <hgroup class="clearfix">
          <h1><%block name="title"/></h1>
          <div id="DateAndPlace"><b>${_(u"PyCon Canada 2012")}</b><br>
          ${_(u"November 9 – 11, 2012 • Toronto")}</div>
          <!--<h3 class="header-sub-text">${_(u"Bringing the Python Canada community together")}</h3>-->
        </hgroup>
        <div id="QuickLinks" class="hidden-desktop">
          <em>${_(u"Quick links")}:</em> <ul class="unstyled"></ul>
        </div>
      </header>
      <%block name="info"/>
    </section>

    <aside class="span3">
      % if request['bfg.routes.route'].name not in ['sponsors', 'sponsors_500px', 'sponsors_freshbooks', 'sponsors_chango']:
        <h1>${_(u"Our Sponsors")}</h1>
        <h2>— <b>${_(u"Gold")}</b> —</h2>
        <%include file="pyconca:templates/sponsors/500px.mako"/>

        <h2>— <b>${_(u"Silver")}</b> —</h2>
        <%include file="pyconca:templates/sponsors/freshbooks.mako"/>
        <%include file="pyconca:templates/sponsors/wave.mako"/>
        <%include file="pyconca:templates/sponsors/chango.mako"/>

        <h2>— <b>${_(u"Our Mothership")}</b> —</h2>
        <%include file="pyconca:templates/sponsors/psf.mako"/>

        <p class="gutter-top"><a href="${request.application_url}/sponsors" class="bubble">${_(u"View full list of sponsors")}</a></p>
        <p class="gutter-top"><a href="mailto:sponsorship@pycon.ca" class="bubble">${_(u"Sponsorship details")}</a></p>
      % endif
    </aside>
  </div>
</div>

<script>
  function createQuickLinks() {
    $("#MainContent h2").not(".sub-head").each(function() {
      var $this = $(this),
        navItemHolder = $("<li></li>"),
        navItem = $("<a></a>");

      if (!$this.attr("id")) {
        var anchor = $this.text()
          .toLowerCase()
          .replace(" ", "-")
          .replace(/ /g, "")
          .replace(/[^a-z0-9-]/g, "");
        $this.attr("id", anchor);
      }

      navItem
        .text($this.text())
        .addClass("bubble bubble-small")
        .attr("href", "#" + $this.attr("id"));

      navItemHolder
        .append(navItem)

      $("#QuickLinks ul").append(navItemHolder);
    });
  };

  $(function() {
    createQuickLinks();
  });
</script>

</%block>
