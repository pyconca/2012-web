<%inherit file="base.mako"/>
<%block name="content">

<div class="row-fluid top">
  <div id="top-row" class="main-row">
    <h1>PyCon Canada</h1>
    <h2>Toronto, November 9th - 11th 2012</h2>
    <br />
    <a href="#" class="btn btn-warning btn-large">Register</a>
    <a href="#" class="btn btn-large">Sponsor</a>
  </div>
</div>

<div id="sponsor-carousel-row" class="row-fluid">
  <div class="main-row">
    <div class="span2">
      <h3 style="text-align:right;">Sponsors</h3>
    </div>

    <div class="span10">
      <div id="myCarousel" class="carousel slide" style="position: relative; left: 10%; bottom: 1%;">
        <div class="carousel-inner" style="opacity: 0.6;">
          <div class="active item">
            <img src="${request.static_url("pyconca:static/vmfarms-logo.png")}"
              width="200px;" height="100px;" class="black-and-white" alt="">
          </div>

          <div class="item">
            <img src="${request.static_url("pyconca:static/freshbooks.gif")}"
              width="200px;" height="100px;" class="black-and-white" alt="">
          </div>

        </div> <!-- carousel-inner -->
      </div> <!-- myCarousel -->
    </div> <!-- span4 -->
  </div> 
</div> <!-- sponsors-row -->

<script>
  $(function() {
    $('.carousel').carousel();
  });
</script>

<div id="about-row" class="row-fluid">
  <div class="main-row">
    <div class="menu">
       About
    </div>

    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <div class="pull-right">
      <a href="${request.application_url}/about" class="btn">More >></a>
    </div>
  </div>
</div>

<div id="speakers-row" class="row-fluid">
  <div class="main-row">
    <div class="menu-alt">
      Speakers
    </div>

    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>

    <div>
      <a href="${request.application_url}/about" class="btn">More >></a>
    </div>
  </div>
</div>

<div id="sponsors-row" class="row-fluid">
  <div class="main-row">
    <div class="menu">
        Sponsors
    </div>

    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>

    <div class="pull-right">
      <a href="${request.application_url}/about" class="btn">More >></a>
    </div>
  </div>
</div>

<div id="venue-row" class="row-fluid">
  <div class="main-row">
    <div class="menu-alt">
      Venue
    </div>

    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>

    <div>
      <a href="${request.application_url}/venue" class="btn">More >></a>
    </div>
  </div>
</div>

<div id="schedule-row" class="row-fluid">
  <div class="main-row">
    <div class="menu">
      Schedule
    </div>

    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>

    <div class="pull-right">
      <a href="${request.application_url}/about" class="btn">More >></a>
    </div>
  </div>
</div>

</%block>
