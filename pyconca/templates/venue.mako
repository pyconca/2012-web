<%inherit file="event.mako"/>

<%block name="head_title">
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
<p>
The recommended hotel for PyCon Canada is the Metropolitan.
</p> 

<blockquote>
    <address>
    Metropolitan Hotel Toronto<br>
    108 Chestnut Street<br>
    Toronto, Ontario</br> 
    M5G 1R3, Canada<br>
    (416) 977-5000<br>
    </address>
</blockquote>

<p>
<strong>Use this link to reserve rooms: </strong>
<a href='https://gc.synxis.com/rez.aspx?Hotel=27076&Chain=10237&template=YYZME&shell=YYZME&group=236098'>Metropolitan Hotel</a>
</p>

<p>
The hotel rate is $120 per night 
(plus 13% Harmonized Sales Tax, and $8.00 per day room facilities fee).
This includes:
  <ul>
    <li>Two double beds</li>
    <li>Free wireless</li>
    <li>Local phone calls</li>
    <li>Access to the health club</li>
  </ul>
</p>

<p>
If you would like to share a hotel room with someone else attending the
conference, please see the PyCon Canada
<a href='https://github.com/pyconca/pyconca2012/wiki/Room-Sharing'>
room sharing wiki</a> page.

<p>
The PyCon Canada block of hotel rooms is reserved under the name 'PYCONCA ASSOCIATION'.
</p>

<p>
Email <a href='mailto:organizers@pycon.ca'>organizers@pycon.ca</a> if you 
run into any trouble reserving your room, or finding someone to share a 
room with.
</p>
    </div>
</%block>
