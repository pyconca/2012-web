<%inherit file="event.mako"/>

<%block name="head_title">${_(u"Sponsors")}</%block>
<%block name="body_class">sponsors-section</%block>
<%block name="title">${_(u"Sponsors")}</%block>

<%block name="info">
  <article>
    <h2>${_(u"Sponsor PyCon Canada")}</h2>
    <p><%block filter="gettext">SPONSOSORS_EMAIL</%block></p>
    <p>${_(u"For more information, please see:")}
    <a target="_blank" href="${request.static_url("pyconca:static/PyCon_Canada_2012_Sponsorship_Prospectus.pdf")}">
      ${_(u"Sponsorship Levels")}</a>.
  </article>

  <article>
    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Gold Sponsor</h2>
        <%include file="pyconca:templates/sponsors/500px.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Silver Sponsor</h2>
        <%include file="pyconca:templates/sponsors/freshbooks.mako"/>
      </div>
      <div class="span6">
        <h2 class="level">Silver Sponsor</h2>
        <%include file="pyconca:templates/sponsors/wave.mako"/>
      </div>
    </div>
    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Silver Sponsor</h2>
        <%include file="pyconca:templates/sponsors/chango.mako"/>
      </div>
      <div class="span6">
        <h2 class="level">Diversity Sponsor</h2>
        <%include file="pyconca:templates/sponsors/google.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Travel Sponsor</h2>
        <%include file="pyconca:templates/sponsors/points.mako"/>
      </div>
      <div class="span6">
        <h2 class="level">Internet Sponsor</h2>
        <%include file="pyconca:templates/sponsors/crs.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Venue Sponsor</h2>
        <%include file="pyconca:templates/sponsors/psf.mako"/>
      </div>
      <div class="span6">
        <h2 class="level">Party Sponsor</h2>
        <%include file="pyconca:templates/sponsors/upverter.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Media Sponsor</h2>
        <%include file="pyconca:templates/sponsors/bnotions.mako"/>
      </div>
      <div class="span6">
        <h2 class="level">Hosting Sponsor</h2>
        <%include file="pyconca:templates/sponsors/vmfarms.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Sprint Sponsor</h2>
        <%include file="pyconca:templates/sponsors/agendaless.mako"/>
      </div>
      <div class="span6">
        <h2 class="level">Sprint Sponsor</h2>
        <%include file="pyconca:templates/sponsors/llc.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Bronze Sponsor</h2>
        <%include file="pyconca:templates/sponsors/heroku.mako"/>
      </div>
      <div class="span6">
        <h2 class="level">Bronze Sponsor</h2>
        <%include file="pyconca:templates/sponsors/mozilla.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Bronze Sponsor</h2>
        <%include file="pyconca:templates/sponsors/guru_link.mako"/>
      </div>
      <div class="span6">
        <h2 class="level">Bronze Sponsor</h2>
        <%include file="pyconca:templates/sponsors/trapeze.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Bronze Sponsor</h2>
        <%include file="pyconca:templates/sponsors/cloudant.mako"/>
      </div>
      <div class="span6">
        <h2 class="level">Bronze Sponsor</h2>
        <%include file="pyconca:templates/sponsors/gadventures.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Transportation Sponsor</h2>
        <%include file="pyconca:templates/sponsors/uber.mako"/>
      </div>
      <div class="span6">
        <h2 class="level">Independent Sponsor</h2>
        <%include file="pyconca:templates/sponsors/montreal-python.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Independent Sponsor</h2>
        <%include file="pyconca:templates/sponsors/element34.mako"/>
      </div>
      <div class="span6">
        <h2 class="level">Independent Sponsor</h2>
        <%include file="pyconca:templates/sponsors/danols.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Independent Sponsor</h2>
        <%include file="pyconca:templates/sponsors/albert_oconnor.mako"/>
      </div>
      <div class="span6">
        <h2 class="level">Independent Sponsor</h2>
        <%include file="pyconca:templates/sponsors/amelanche.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2 class="level">Independent Sponsor</h2>
        <%include file="pyconca:templates/sponsors/verso.mako"/>
      </div>
      <div class="span6">
      </div>
    </div>

  </article>
</%block>
