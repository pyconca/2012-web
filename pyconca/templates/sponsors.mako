<%inherit file="event.mako"/>

<%block name="title">
    ${_(u"Sponsors")}
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">${_(u"Sponsor PyCon Canada")}</h1>
        <p>
          <%block filter="gettext">
            We are in the process of developing a prospectus. In the mean time,
            if you are interested in sponsoring PyCon Canada, please contact <a
            href='mailto:sponsorship@pycon.ca'>sponsorship@pycon.ca</a>.
          </%block>
        </p>
    </div>
</%block>
