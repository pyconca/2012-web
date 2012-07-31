<%inherit file="base.mako"/>

<%block name="content">

    <div class="row-fluid splash-container">
        <div class="span12">

            <div class="row-fluid">
                <div class="span12 overlay">
                    <div class="row-fluid">
                        <div class="span8">
                          <br>
                          <h1>PyCon Canada</h1>
                          <h2>Toronto, November 9th - 11th 2012</h2>
                          <br>
                        </div>
                        <div class="span4">
                          <div class="pull-right">
                              <br>
                              <a href="#" class="btn btn-warning btn-large">Register</a>
                              &nbsp;
                              <a href="#" class="btn btn-large">Sponsor</a>
                              <br>
                          </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span4">
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <div id="myCarousel" class="carousel slide" style="position: relative; left: 10%; bottom: 1%;">
                      <h6>Sponsors</h6>
                      <div class="carousel-inner" style="opacity: 0.6;">
                        <div class="active item">
                         <img src="${request.static_url("pyconca:static/vmfarms-logo.png")}"
                              width="200px;" height="100px;" class="black-and-white" alt="">
                        </div>
                        <div class="item">
                         <img src="${request.static_url("pyconca:static/freshbooks.gif")}"
                              width="200px;" height="100px;" class="black-and-white" alt="">
                        </div>
                      </div>
                    </div>
                </div>

                <div class="span8">
                </div>

            </div>

        </div>
    </div>

    <div class="row-fluid circle-row">
      <div class="yellow-dotted">
        <div class="row-fluid">

            <div class="span1">
            </div>

            <div class="span10">
              <div class="menu">
                 About
              </div>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <br>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <br>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <div class="pull-right">
                  <a href="${request.application_url}/about" class="btn">More >></a>
                </div>
              </p>
            </div>
    
            <div class="span1">
            </div>

        </div>
      </div>
    </div>

    <div class="row-fluid circle-row">
      <div class="orange-dotted">
        <div class="row-fluid">

        <div class="span1">
        </div>

        <div class="span10">
          <br>
              <div class="menu-alt">
                Speakers
              </div>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <br>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <br>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <br>
                <div>
                  <a href="${request.application_url}/about" class="btn">More >></a>
                </div>
              </p>
        </div>

        <div class="span1">
        </div>

        </div>
      </div>
    </div>

    <div class="row-fluid circle-row">
      <div class="yellow-dotted">
        <div class="row-fluid">

        <div class="span1">
        </div>

        <div class="span10">
          <br>
              <div class="menu">
                  Sponsors
              </div>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <br>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <br>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <div class="pull-right">
                  <a href="${request.application_url}/about" class="btn">More >></a>
                </div>
              </p>
        </div>

        <div class="span1">
        </div>

        </div>
      </div>
    </div>

    <div class="row-fluid circle-row">
      <div class="orange-dotted">
        <div class="row-fluid">

        <div class="span1">
        </div>

        <div class="span10">
          <br>
              <div class="menu-alt">
                  Venue
              </div>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <br>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <br>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <br>
                <div>
                  <a href="${request.application_url}/about" class="btn">More >></a>
                </div>
              </p>
        </div>

        <div class="span1">
        </div>

        </div>
      </div>
    </div>

    <div class="row-fluid circle-row">
      <div class="yellow-dotted">
        <div class="row-fluid">

        <div class="span1">
        </div>

        <div class="span10">
          <br>
              <div class="menu">
                  Schedule
              </div>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <br>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <br>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Maecenas luctus leo ut urna egestas tempor. 
                Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
                Vestibulum ac arcu id justo tristique adipiscing.
                <br>
                <div class="pull-right">
                  <a href="${request.application_url}/about" class="btn">More >></a>
                </div>
              </p>
        </div>

        <div class="span1">
        </div>

        </div>
      </div>
    </div>

<script>
    $(function() {
        $('.carousel').carousel();
    });
</script>

</%block>

