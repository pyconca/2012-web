<%inherit file="event.mako"/>

<%block name="title">
    ${_(u"Sponsor")}
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">${_(u"Sponsor PyCon Canada")}</h1>
        <p><%block filter="gettext">SPONSOSORS_EMAIL</%block></p>
        For more information, please see: 
        <a target="_blank" href="${request.static_url("pyconca:static/PyCon_Canada_2012_Sponsorship_Prospectus.pdf")}">
        Sponsorship Levels</a>.
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
        <h1 class="header">Media Sponsor</h1>
        <br>
        <p style="width: 200px;">
            <%include file="pyconca:templates/sponsors/bnotions.mako"/>
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
