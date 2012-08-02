<%inherit file="base.mako"/>

<%block name="content">


<div class="row-fluid sub-header-image">
  <div class="main-row">
    <div class="top-row-sub">
      <h1 class="header-main-text">Venue</h1>
    </div>
  </div>
</div>

<div class="row-fluid">
  <div class="content-holder">
    <div class="row-fluid">
      <div class="span3">
        <ul id="sponsors-sidenav" class="nav sidenav"></ul>
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
        .addClass("sidenav-item")
        .attr("href", "#" + $(this).attr("id"));

      navItemHolder.append(navItem);
      $("#sponsors-sidenav").append(navItemHolder);
    });
  };

  $(document).ready(function() {
    createSidenav();
  });
</script>

</%block>
