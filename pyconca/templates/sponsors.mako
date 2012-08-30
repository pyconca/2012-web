<%inherit file="event.mako"/>

<%block name="title">
    Sponsors
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">Sponsor PyCon Canada</h1>
        <p>
            If you are interested in sponsoring PyCon Canada, please contact <a
            href="mailto:sponsorship@pycon.ca">sponsorship@pycon.ca</a>.
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">Gold Sponsor</h1>
        <p>
          <a href="http://500px.com/" style="border-bottom: none;">
            <img src="${request.static_url("pyconca:static/500px_logo_color.png")}"
                 width="200" height="100" alt="500px">
          </a>
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">Silver Sponsors</h1>
        <p>
          <a href="http://www.freshbooks.com/" style="border-bottom: none;">
            <img src="${request.static_url("pyconca:static/freshbooks.png")}"
                 width="200" height="104" alt="FreshBooks">
          </a>
        </p>

        <br>

        <p>
          <a href="http://waveaccounting.com/" style="border-bottom: none;">
            <img src="${request.static_url("pyconca:static/thumb-logo-wave-accounting.png")}"
                 width="200" height="64" alt="Wave Accounting">
          </a>
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">Venue Sponsor</h1>
        <br>
        <p>
          <a href="http://www.python.org/psf/" style="border-bottom: none;">
            <img src="${request.static_url("pyconca:static/psf-logo-317x71-alpha.png")}"
                 width="317" height="71" alt="Python Software Foundation">
          </a>
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">Hosting Sponsor</h1>
        <br>
        <p>
          <a href="http://vmfarms.com/" style="border-bottom: none;">
            <img src="${request.static_url("pyconca:static/vmfarms-logo.png")}"
                 width="200" height="100" alt="VM Farms">
          </a>
        </p>
    </div>

</%block>
