<%inherit file="event.mako"/>

<%block name="title">
    ${_(u"Venue")}
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">${_(u"Location")}</h1>
        <p><%block filter="gettext">VENUE_LOCATION</%block></p>

        <iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps/ms?msid=209898849797428860102.0004c67cb66abadbf199e&amp;msa=0&amp;ie=UTF8&amp;ll=43.654196,-79.395704&amp;spn=0.01228,0.019205&amp;t=m&amp;iwloc=0004c67cb66b9121bbdbe&amp;output=embed"></iframe>
        <small>${_(u"View the complete")} <a href="https://maps.google.com/maps/ms?msid=209898849797428860102.0004c67cb66abadbf199e&amp;msa=0&amp;ie=UTF8&amp;ll=43.654196,-79.395704&amp;spn=0.01228,0.019205&amp;t=m&amp;iwloc=0004c67cb66b9121bbdbe&amp;source=embed">${_(u"PyCon Canada 2012 map")}</a>.</small>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header">${_(u"Getting to Toronto")}</h1>
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
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">${_(u"Public Transit and Parking")}</h1>
        <p><%block filter="gettext">VENUE_PUBLIC_TRANSIT</%block></p>
        <p><%block filter="gettext">VENUE_PARKING</%block></p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">${_(u"Food")}</h1>
        <p><%block filter="gettext">VENUE_FOOD</%block></p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">${_(u"Hotel")}</h1>
        <p><%block filter="gettext">VENUE_HOTEL</%block></p>
    </div>
</%block>
