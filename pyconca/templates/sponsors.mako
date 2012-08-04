<%inherit file="base.mako"/>

<%block name="content">

<div class="row-fluid sub-header-image">
  <div class="span12 top-row">
        <h1 class="header-main-text">Sponsors</h1>
        <h2 class="header-sub-text">PyCon Canada 2012</h2>
        <h2 class="header-sub-text">Toronto, November 9th - 11th 2012</h2>
  </div>
</div>

<div class="row-fluid">
  <div class="content-holder">
    <div class="row-fluid">
      <div class="span3">
        <ul id="sponsors-sidenav" class="sidenav"></ul>
      </div>

      <div class="span9 content-column">

        <div class="row-fluid content-section">
            <h1 class="header" id="gold">Gold sponsors</h1>
        </div> <!-- content-section -->

        <div class="row-fluid content-section">
            <h1 class="header" id="silver">Silver sponsors</h1>
        </div> <!-- content section -->

        <div class="row-fluid content-section">
            <h1 class="header" id="bronze">Bronze sponsors</h1>
        </div> <!-- content-section -->

      </div>
    </div> <!-- content column -->
  </div> <!-- content-holder -->
</div> <!-- row-fluid -->

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

      $("#sponsors-sidenav").append(navItemHolder);
    });
  };

  $(document).ready(function() {
    createSidenav();
  });
</script>

</%block>
