<%inherit file="event.mako"/>

<%block name="title">
    ${_(u"Venue")}
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">${_(u"Location")}</h1>
        <p>
          ${_(u"The conference will be held at Beverley Halls, 206 Beverley St., just"
          u"south of College and Beverley, Toronto.")}
        </p>

        <iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps/ms?msid=209898849797428860102.0004c67cb66abadbf199e&amp;msa=0&amp;ie=UTF8&amp;ll=43.654196,-79.395704&amp;spn=0.01228,0.019205&amp;t=m&amp;iwloc=0004c67cb66b9121bbdbe&amp;output=embed"></iframe>
        <small>${_(u"View the complete")} <a href="https://maps.google.com/maps/ms?msid=209898849797428860102.0004c67cb66abadbf199e&amp;msa=0&amp;ie=UTF8&amp;ll=43.654196,-79.395704&amp;spn=0.01228,0.019205&amp;t=m&amp;iwloc=0004c67cb66b9121bbdbe&amp;source=embed">${_(u"PyCon Canada 2012 map")}</a>.</small>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header">${_(u"Getting to Toronto")}</h1>
      <p>
        ${_(u"Toronto has 2 major airports."
        u"<a href='http://www.gtaa.com'>Pearson</a> is the international airport"
        u"and is the location for almost all the major domestic and international"
        u"airlines. It's about a 35 minute drive from the Airport to Beverley"
        u"Halls, but be aware that downtown Toronto traffic is busy all day and"
        u"is particularly busy during peak rush hour. Allow at least an hour for"
        u"travel time from the airport.")}
      </p>

      <p>
        ${_(u"<a href='http://www.flyporter.com'>Porter Airlines</a> is located on"
        u"Toronto Island and is just south of Union Station, the main transit hub"
        u"in downtown Toronto, including Go Transit, TTC (the local bus,"
        u"streetcar and subway service) and VIA Rail.")}
      </p>

      <p>
        ${_(u"VIA is a good alternative to the airlines if you are coming from"
        u"somewhere like Montreal or Ottawa. Advance pricing is often available"
        u"at a discount.")}
      </p>

      <p>
        ${_(u"If you're coming from the US:")}
        <ul>
          <li>
            ${_(u"Make sure that you've got a valid passport and don't forget to"
            u"bring it with you.")}
          </li>
          <li>
            ${_(u"<a href='http://www.flyporter.com'>Porter Airlines</a> has"
            u"frequent, reasonably-priced flights for trips from several US"
            u"cities to Toronto, including Boston, Burlington (VT), Chicago,"
            u"Myrtle Beach, New York, and Washington")}
          </li>
        </ul>
      </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">${_(u"Public Transit and Parking")}</h1>
        <p>
            ${_(u"Beverly Halls is a short walk from a number of different public"
            u"transit stops.")}
            <a href="http://maps.google.ca/maps?daddr=206+Beverley+St,+Toronto,+ON+M5T+1Z3&hl=en&sll=43.657192,-79.395382&sspn=0.019933,0.077162&geocode=FWYnmgId0oVE-ynn5LTlxjQriDEq_o2na7PIDw&dirflg=r&ttype=now&noexp=0&noal=0&sort=def&mra=ltm&t=m&z=14&start=0">
              ${_(u"Google Map's transit directions")}</a>${(u" can be used to find the best route, and"
            u" <a href='http://www.ttc.ca/'>the TTC's website</a> for rates.")}
        </p>
        <p>
            ${_(u"Paid street parking is available on Beverley and surrounding side"
            u" streets, and some free parking is also available on weekends. There"
            u" is a paid Green P parking lot nearby, which can be seen on the")}
            <a href="https://maps.google.com/maps/ms?msid=209898849797428860102.0004c67cb66abadbf199e&amp;msa=0&amp;ie=UTF8&amp;ll=43.654196,-79.395704&amp;spn=0.01228,0.019205&amp;t=m&amp;iwloc=0004c67cb66b9121bbdbe&amp;source=embed">${_(u"PyCon Canada 2012 map")}</a>.
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">${_(u"Food")}</h1>
        <p>
          ${_(u"We'll be providing lunch on Saturday and Sunday, so make sure that"
          u" you let us know about any dietary restrictions. For your other meals,"
          u" there are lots of options on College St. and Spadina Ave. Some"
          u" additional options are available on Elm St. and Baldwin St. south of"
          u" the venue - some of restaurants will be a little pricier.")}
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">${_(u"Hotel")}</h1>
        <p>
            ${_(u"We are in the process of finding a recommended hotel. Contact <a"
            u" href='mailto:hotels@pycon.ca'>hotels@pycon.ca</a> if you would like"
            u" to be notified when a hotel is chosen.")}
        </p>
    </div>
</%block>
