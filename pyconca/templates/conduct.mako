<%inherit file="event.mako"/>

<%block name="head_title" filter="gettext">Code of Conduct</%block>
<%block name="body_class">about-section</%block>
<%block name="title" filter="gettext">Code of Conduct</%block>

<%block name="info">
  <article>
    <h2>${_("Code of Conduct")}</h2>
    <p><%block filter="gettext">CONDUCT_OVERVIEW</%block></p>

    <h2>${_("The Short Version")}</h2>
    <p><%block filter="gettext">CONDUCT_SHORT</%block></p>

    <h2>${_("The Longer Version")}</h2>
    <p><%block filter="gettext">CONDUCT_LONG</%block></p>

    <h2>${_("Contact Information")}</h2>
    <p>
      <%block filter="gettext">CONDUCT_CONTACTS</%block>
      <ul>
        <li><strong>Michael DiBernardo</strong>: +1 (647) 519-3325</li>
        <li><strong>Diana Clarke</strong>: +1 (416) 453-3130</li>
      </ul>
      <%block filter="gettext">CONDUCT_POLICE</%block>
    </p>

    <h2>${_("License")}</h2>
    <p><%block filter="gettext">CONDUCT_CREDIT</%block></p>
  </article>
</%block>
