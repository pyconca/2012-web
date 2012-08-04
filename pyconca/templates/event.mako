<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">

<div class="row-fluid sub-header-image">
  <div class="span12 top-row">
        <h1 class="header-main-text"><%block name="title"/></h1>
        <h2 class="header-sub-text">PyCon Canada 2012</h2>
        <h2 class="header-sub-text">Toronto, November 9th - 11th</h2>
  </div>
</div>

<div class="row-fluid">
  <div class="content-holder">
    <div class="row-fluid">
      <div class="span4">
        <ul id="sidenav" class="sidenav"></ul>
      </div>
      <div class="span8 content-column">
        <%block name="info"/>
      </div>
    </div>
  </div>
</div>

<script>
  function createSidenav() {
    $(".header").each(function() {
      var navItemHolder = $("<li></li>");
      var navItem = $("<a></a>");

      navItem
        .text($(this).text())
        .addClass("sidenav-link")
        .attr("href", "#" + $(this).attr("id"));

      navItemHolder
        .append(navItem)
        .addClass("sidenav-item");

      $("#sidenav").append(navItemHolder);
    });
  };

  $(document).ready(function() {
    createSidenav();
  });
</script>

</%block>
