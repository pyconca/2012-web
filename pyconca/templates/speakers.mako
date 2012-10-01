<%inherit file="event.mako"/>

<%block name="head_title">
    ${_(u"Speakers")}
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">${_(u"Speakers")}</h1>

        <p><%block filter="gettext">SPEAKERS_SCHEDULE</%block></p>

        <p><%block filter="gettext">SPEAKERS_WELCOME</%block></p>

        <p><%block filter="gettext">SEPAKERS_NERVOUS</%block></p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">${_(u"Submitting a Talk or Tutorial")}</h1>
        <p>
          <%block filter="gettext">SEPAKERS_LENGTH</%block>
          <b><%block filter="gettext">SEPAKERS_DEADLINE</%block></b>
        </p>

        <p><%block filter="gettext">SEPAKERS_SUBMIT</%block></p>

        <ul>
          <li>${_(u"Name of the talk or tutorial")}</li>
          <li>${_(u"Length of the talk/tutorial")}</li>
          <li>${_(u"Intended audience (assumed level of knowledge)")}</li>
          <li>${_(u"Abstract for the talk/tutorial - 200 chars max")}</li>
          <li>${_(u"Outline of the talk/tutorial")}</li>
          <li><%block filter="gettext">SEPAKERS_NOTES</%block></li>
        </ul>
    </div>
</%block>
