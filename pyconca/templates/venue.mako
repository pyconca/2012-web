<%inherit file="event.mako"/>

<%block name="page_title">| ${_(u"Venue")}</%block>
<%block name="title">${_(u"Venue")}</%block>

<%block name="info">
  <article>
    <h2>${_(u"Location")}</h2>
    <p><%block filter="gettext">VENUE_LOCATION</%block></p>

    <iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps/ms?msid=209898849797428860102.0004c67cb66abadbf199e&amp;msa=0&amp;ie=UTF8&amp;ll=43.654196,-79.395704&amp;spn=0.01228,0.019205&amp;t=m&amp;iwloc=0004c67cb66b9121bbdbe&amp;output=embed"></iframe>
    <small>${_(u"View the complete")} <a href="https://maps.google.com/maps/ms?msid=209898849797428860102.0004c67cb66abadbf199e&amp;msa=0&amp;ie=UTF8&amp;ll=43.654196,-79.395704&amp;spn=0.01228,0.019205&amp;t=m&amp;iwloc=0004c67cb66b9121bbdbe&amp;source=embed">${_(u"PyCon Canada 2012 map")}</a>.</small>
  </article>

  <article>
    <h2>${_(u"Getting to Toronto")}</h2>
    <p><%block filter="gettext">VENUE_AIRPORTS</%block></p>
    <p><%block filter="gettext">VENUE_PORTER</%block></p>
    <p><%block filter="gettext">VENUE_VIA</%block></p>

    <p>
      ${_(u"If you're coming from the US:")}
      <ul>
        <li><%block filter="gettext">VENUE_PASSPORT_USA</%block></li>
        <li><%block filter="gettext">VENUE_PORTER_USA</%block></li>
      </ul>
    </p>
  </article>

  <article>
    <h2>${_(u"Public Transit and Parking")}</h2>
    <p><%block filter="gettext">VENUE_PUBLIC_TRANSIT</%block></p>
    <p><%block filter="gettext">VENUE_PARKING</%block></p>
  </article>

  <article>
    <h2>${_(u"Food")}</h2>
    <p><%block filter="gettext">VENUE_FOOD</%block></p>
  </article>

  <article>
    <h2>${_(u"Hotel")}</h2>
    <p><%block filter="gettext">VENUE_HOTEL</%block></p>
  </article>
</%block>
