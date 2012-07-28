<%inherit file="base.mako"/>

<%block name="content">

<div class="container-fluid">

    <div class="row-fluid splash-row-fluid">
        <div class="span12 splash-container"> 
            <br>
            <div class="hero-unit splash-title">
                <div class="pull-right">
                    <h1>PyCon Canada</h1>
                    <h3>Toronto, November 9th - 11th 2012</h3>
                    <br>
                    <a href="#" class="btn btn-inverse btn-large">Register</a>
                </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
        </div>
     </div>

    <div class="row-fluid gradient splash-row-fluid">
        <div class="span12">
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
        </div>
    </div>

    <div class="row-fluid splash-footer splash-row-fluid">
        <div class="span1 footer-section">
        </div>

        <div class="span10 footer-section">
          <h3>
              About
          </h3>
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
            <a href="${request.application_url}/about" class="btn btn-inverse">More >></a>
          </p>
        </div>

        <div class="span1 footer-section">
        </div>
    </div>

    <div class="row-fluid splash-footer splash-row-fluid">

        <div class="span1 footer-section">
        </div>

        <div class="span5 footer-section">
          <h3>
              Speakers
          </h3>
          <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
            Maecenas luctus leo ut urna egestas tempor. 
            Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
            Vestibulum ac arcu id justo tristique adipiscing.
            <br>
            <br>
            <a href="${request.application_url}/speakers" class="btn btn-inverse">More >></a>
          </p>
        </div>

        <div class="span5 footer-section">
          <h3>
              Sponsors
          </h3>
          <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
            Maecenas luctus leo ut urna egestas tempor. 
            Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
            Vestibulum ac arcu id justo tristique adipiscing.
            <br>
            <br>
            <a href="${request.application_url}/sponsors" class="btn btn-inverse">More >></a>
          </p>
        </div>

        <div class="span1 footer-section">
        </div>
    </div>

</div>


</%block>

