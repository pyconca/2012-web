<%inherit file="event.mako"/>

<%block name="head_title" filter="gettext">Code of Conduct</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">${_("Code of Conduct")}</h1>
        <p><%block filter="gettext">CONDUCT_OVERVIEW</%block></p>

        <h1 class="header">${_("The Short Version")}</h1>
        <p><%block filter="gettext">CONDUCT_SHORT</%block></p>

        <h1 class="header">${_("The Longer Version")}</h1>
        <p><%block filter="gettext">CONDUCT_LONG</%block></p>

        <h1 class="header">${_("Contact Information")}</h1>
        <p>
          <%block filter="gettext">CONDUCT_CONTACTS</%block>
          <ul>
            <li><strong>Michael DiBernardo</strong>: +1 (647) 519-3325</li>
            <li><strong>Diana Clarke</strong>: +1 (416) 453-3130</li>
          </ul>
          <%block filter="gettext">CONDUCT_POLICE</%block>
        </p>

        <h1 class="header">${_("License")}</h1>
        <p><%block filter="gettext">CONDUCT_CREDIT</%block></p>
    </div>
</%block>
