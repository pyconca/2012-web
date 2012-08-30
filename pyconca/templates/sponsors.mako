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
            <%include file="pyconca:templates/sponsors/500px.mako"/>
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">Silver Sponsors</h1>
        <p>
            <%include file="pyconca:templates/sponsors/freshbooks.mako"/>
        </p>

        <br>

        <p>
            <%include file="pyconca:templates/sponsors/wave.mako"/>
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">Venue Sponsor</h1>
        <br>
        <p>
            <%include file="pyconca:templates/sponsors/psf.mako"/>
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">Hosting Sponsor</h1>
        <br>
        <p>
            <%include file="pyconca:templates/sponsors/vmfarms.mako"/>
        </p>
    </div>

</%block>
