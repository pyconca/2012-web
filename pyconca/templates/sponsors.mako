<%inherit file="event.mako"/>

<%block name="title">
    ${_(u"Sponsor")}
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">${_(u"Sponsor PyCon Canada")}</h1>
        <p>
          <%block filter="gettext">
            If you are interested in sponsoring PyCon Canada, please contact <a
            href="mailto:sponsorship@pycon.ca">sponsorship@pycon.ca</a>.
          </%block>
            <br>
            <br>
            Sponsorship opportunities start at $350, and we still have a few
            Bronze sponsor spots available.
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

        <p>
            <br>
            <%include file="pyconca:templates/sponsors/wave.mako"/>
        </p>

        <p>
            <%include file="pyconca:templates/sponsors/chango.mako"/>
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">Bronze Sponsors</h1>
        <br>
        <p style="margin-left: -20px;">
            <%include file="pyconca:templates/sponsors/heroku.mako"/>
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">Venue Sponsor</h1>
        <br>
        <p style="width: 200px;">
            <%include file="pyconca:templates/sponsors/psf.mako"/>
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">Party Sponsor</h1>
        <p style="width: 200px;">
            <%include file="pyconca:templates/sponsors/upverter.mako"/>
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
