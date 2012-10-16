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
        <h2>Gold Sponsor</h2>
        <%include file="pyconca:templates/sponsors/500px.mako"/>
      </div>
      <div class="span6">
        <h2>Silver Sponsor</h2>
        <%include file="pyconca:templates/sponsors/freshbooks.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2>Silver Sponsor</h2>
        <%include file="pyconca:templates/sponsors/wave.mako"/>
      </div>
      <div class="span6">
        <h2>Silver Sponsor</h2>
        <%include file="pyconca:templates/sponsors/chango.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2>Diversity Sponsor</h2>
        <%include file="pyconca:templates/sponsors/google.mako"/>
      </div>
      <div class="span6">
        <h2>Travel Sponsor</h2>
        <%include file="pyconca:templates/sponsors/points.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2>Internet Sponsor</h2>
        <%include file="pyconca:templates/sponsors/crs.mako"/>
      </div>
      <div class="span6">
        <h2>Venue Sponsor</h2>
        <%include file="pyconca:templates/sponsors/psf.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2>Party Sponsor</h2>
        <%include file="pyconca:templates/sponsors/upverter.mako"/>
      </div>

      <div class="span6">
        <h2>Media Sponsor</h2>
        <%include file="pyconca:templates/sponsors/bnotions.mako"/>
      </div>
    </div>

    <h2>Sprint Sponsors</h2>
    <div class="row-fluid">
      <div class="span6" style="margin-left: -15px;">
        <%include file="pyconca:templates/sponsors/agendaless.mako"/>
      </div>
      <div class="span6">
        <%include file="pyconca:templates/sponsors/llc.mako"/>
      </div>
    </div>

    <h2 class="gutter-top">Bronze Sponsors</h2>
    <div class="row-fluid">
      <div class="span6">
        <%include file="pyconca:templates/sponsors/heroku.mako"/>
      </div>
      <div class="span6" style="margin-left: -5px;">
        <%include file="pyconca:templates/sponsors/mozilla.mako"/>
      </div>
    </div>
    <div class="row-fluid gutter-top">
      <div class="span6">
        <%include file="pyconca:templates/sponsors/guru_link.mako"/>
        <br>
        <br>
      </div>
      <div class="span6">
        <%include file="pyconca:templates/sponsors/trapeze.mako"/>
      </div>
    </div>
    <div class="row-fluid gutter-top">
      <div class="span6">
        <%include file="pyconca:templates/sponsors/cloudant.mako"/>
      </div>
      <div class="span6">
        <%include file="pyconca:templates/sponsors/gadventures.mako"/>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6">
        <h2>Transportation Sponsor</h2>
        <%include file="pyconca:templates/sponsors/uber.mako"/>
      </div>
      <div class="span6">
        <h2>Hosting Sponsor</h2>
        <%include file="pyconca:templates/sponsors/vmfarms.mako"/>
      </div>
    </div>

    <h2>Independent Sponsors</h2>
    <div class="row-fluid">
      <div class="span6">
        <%include file="pyconca:templates/sponsors/element34.mako"/>
      </div>
      <div class="span6">
        <%include file="pyconca:templates/sponsors/danols.mako"/>
      </div>
    </div>
    <div class="row-fluid gutter-top">
      <div class="span6">
        <%include file="pyconca:templates/sponsors/albert_oconnor.mako"/>
      </div>
    </div>
  </article>
</%block>
