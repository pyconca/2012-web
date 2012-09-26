<%inherit file="event.mako"/>

<%block name="page_title">| ${_(u"Sponsor")}</%block>
<%block name="title">${_(u"Sponsor")}</%block>

<%block name="info">
  <article>
    <h2>${_(u"Sponsor PyCon Canada")}</h2>
    <p><%block filter="gettext">SPONSOSORS_EMAIL</%block></p>
    <p>${_(u"For more information, please see:")}
    <a target="_blank" href="${request.static_url("pyconca:static/PyCon_Canada_2012_Sponsorship_Prospectus.pdf")}">
      ${_(u"Sponsorship Levels")}</a>.
  </article>

  <article>
    <h2>Gold Sponsor</h2>
    <p>
        <%include file="pyconca:templates/sponsors/500px.mako"/>
    </p>

    <h2 class="gutter-top">Silver Sponsors</h2>
    <p>
        <%include file="pyconca:templates/sponsors/freshbooks.mako"/>
    </p>

    <p>
        <%include file="pyconca:templates/sponsors/wave.mako"/>
    </p>

    <p>
        <%include file="pyconca:templates/sponsors/chango.mako"/>
    </p>

    <h2 class="gutter-top">Bronze Sponsors</h2>
    <p>
        <%include file="pyconca:templates/sponsors/heroku.mako"/>
    </p>

    <h2 class="gutter-top">Venue Sponsor</h2>
    <p>
        <%include file="pyconca:templates/sponsors/psf.mako"/>
    </p>

    <h2 class="gutter-top">Party Sponsor</h2>
    <p>
        <%include file="pyconca:templates/sponsors/upverter.mako"/>
    </p>

    <h2 class="gutter-top">Media Sponsor</h2>
    <p>
        <%include file="pyconca:templates/sponsors/bnotions.mako"/>
    </p>

    <h2 class="gutter-top">Hosting Sponsor</h2>
    <p>
        <%include file="pyconca:templates/sponsors/vmfarms.mako"/>
    </p>
  </article>
</%block>
