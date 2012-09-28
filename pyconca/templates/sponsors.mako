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
    </div>

    <div class="row-fluid">
      <div class="span6">
        <p>
          <%include file="pyconca:templates/sponsors/freshbooks.mako"/>
        </p>

        <br>
        <p>
          <%include file="pyconca:templates/sponsors/wave.mako"/>
        </p>
      </div>

      <div class="span6">
        <p>
          <%include file="pyconca:templates/sponsors/chango.mako"/>
        </p>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <div class="content-section">
            <h1 class="header">Internet Sponsor</h1>
            <p style="width: 200px;">
                <%include file="pyconca:templates/sponsors/crs.mako"/>
            </p>
        </div>
      </div>

      <div class="span6">
        <div class="content-section">
            <h1 class="header">Diversity Sponsor</h1>
            <br>
        </div>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <div class="content-section">
            <h1 class="header">Venue Sponsor</h1>
            <br>
            <p style="width: 200px;">
                <%include file="pyconca:templates/sponsors/psf.mako"/>
            </p>
        </div>
      </div>

      <div class="span6">
        <div class="content-section">
            <h1 class="header">Hosting Sponsor</h1>
            <br>
            <p>
                <%include file="pyconca:templates/sponsors/vmfarms.mako"/>
            </p>
        </div>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <div class="content-section">
            <h1 class="header">Party Sponsor</h1>
            <br>
            <p style="width: 200px;">
                <%include file="pyconca:templates/sponsors/upverter.mako"/>
            </p>
        </div>
      </div>

      <div class="span6">
        <div class="content-section">
            <h1 class="header">Media Sponsor</h1>
            <br>
            <p style="width: 200px;">
                <%include file="pyconca:templates/sponsors/bnotions.mako"/>
            </p>
        </div>
      </div>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header">Sprint Sponsors</h1>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <br>

        <p>
          <%include file="pyconca:templates/sponsors/agendaless.mako"/>
        </p>
      </div>

      <div class="span6">
        <p>
          <%include file="pyconca:templates/sponsors/llc.mako"/>
        </p>
      </div>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header">Bronze Sponsors</h1>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <p>
          <%include file="pyconca:templates/sponsors/mozilla.mako"/>
        </p>

        <br>

        <p>
          <%include file="pyconca:templates/sponsors/guru_link.mako"/>
        </p>
      </div>

      <div class="span6">
        <br>

        <p>
          <%include file="pyconca:templates/sponsors/trapeze.mako"/>
        </p>

        <br>
        <br>

        <p style="margin-left: -25px;">
          <%include file="pyconca:templates/sponsors/heroku.mako"/>
        </p>
        <br>
      </div>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header">Independent Sponsors</h1>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <br>

        <p>
          <%include file="pyconca:templates/sponsors/element34.mako"/>
        </p>

        <br>
        <br>

        <p>
          <%include file="pyconca:templates/sponsors/albert_oconnor.mako"/>
        </p>

      </div>

      <div class="span6">
        <br>

        <p>
          <%include file="pyconca:templates/sponsors/danols.mako"/>
        </p>

      </div>
    </div>

</%block>
