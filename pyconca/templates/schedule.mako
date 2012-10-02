<%inherit file="event.mako"/>

<%block name="page_title">| ${_(u"Schedule")}</%block>
<%block name="title">${_(u"Schedule")}</%block>

<%block name="info">
  <article>
    <h2>${_(u"Friday, November 9")}</h2>
    <table class="table table-bordered">
      <tr>
        <th>18:00</th>
        <td>
          <%block filter="gettext">SCHEDULE_PARTY</%block>
        </td>
      </tr>
      <tr>
        <th>00:00</th>
        <td>
          <strong>${_(u"Venue closes")}</strong>
        </td>
      </tr>
    </table>
  </article>

  <article>
    <h2>${_(u"Saturday, November 10")}</h2>
    <table class="table table-bordered">
      <tr>
        <th>8:30</th>
        <td colspan="2">
          <strong>${_(u"Registration")}</strong>
        </td>
      </tr>

      <tr>
        <th>9:30</th>
        <td colspan="2">
          <strong>${_(u"Keynote")}</strong>
        </td>
      </tr>

      <tr>
        <th>10:15</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>10:50</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>11:15</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>11:40</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>12:05</th>
        <td colspan="2">
          <strong>${_(u"Lunch (provided)")}</strong>
        </td>
      </tr>

      <tr>
        <th>13:40</th>
        <td colspan="2"><strong>${_(u"Lightning talks")}</strong></td>
      </tr>

      <tr>
        <th>14:20</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>14:45</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>15:10</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>15:35</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>16:00</th>
        <td colspan="2">
          <%block filter="gettext">SCHEDULE_TALKS_DONE</%block>
        </td>
      </tr>

      <tr>
        <th>17:00</th>
        <td colspan="2">
          <%block filter="gettext">SCHEDULE_DINNER</%block>
        </td>
      </tr>

      <tr>
        <th>18:00</th>
        <td colspan="2">
          <%block filter="gettext">SCHEDULE_SPRINTS</%block>
        </td>
      </tr>

      <tr>
        <th>00:00</th>
        <td colspan="2">
          <strong>${_(u"Venue closes")}</strong>
        </td>
      </tr>
    </table>
  </article>

  <article>
    <h2>${_(u"Sunday, November 11")}</h2>
    <table class="table table-bordered">
      <tr>
        <th>9:30</th>
        <td colspan="2">
          <strong>${_(u"Keynote")}</strong>
        </td>
      </tr>

      <tr>
        <th>10:15</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>10:50</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>11:15</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>11:40</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>12:05</th>
        <td colspan="2">
          <strong>${_(u"Lunch (provided)")}</strong>
        </td>
      </tr>

      <tr>
        <th>13:40</th>
        <td colspan="2"><strong>${_(u"Lightning talks")}</strong></td>
      </tr>

      <tr>
        <th>14:20</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>14:45</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>15:10</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>15:35</th>
        <td>(tbd)</td>
        <td>(tbd)</td>
      </tr>

      <tr>
        <th>16:00</th>
        <td colspan="2">
          <%block filter="gettext">SCHEDULE_TALKS_DONE</%block>
        </td>
      </tr>

      <tr>
        <th>17:00</th>
        <td colspan="2">
          <%block filter="gettext">SCHEDULE_DINNER</%block>
        </td>
      </tr>

      <tr>
        <th>18:00</th>
        <td colspan="2">
          <%block filter="gettext">SCHEDULE_SPRINTS</%block>
        </td>
      </tr>

      <tr>
        <th>00:00</th>
        <td colspan="2">
          <strong>${_(u"Venue closes")}</strong>
        </td>
      </tr>
    </table>
  </article>

  <article>
    <h2>${_(u"Monday, November 12")}</h2>
    <table class="table table-bordered">
      <tr>
        <th>All Day</th>
        <td colspan="2">
          <strong><a href="${request.route_url('sprints')}">${_(u"Sprints")}</a></strong>
          <br>
          Location: TBD
        </td>
      </tr>
    </table>
  </article>

  <article>
    <h2>${_(u"Tuesday, November 13")}</h2>
    <table class="table table-bordered">
      <tr>
        <th>All Day</th>
        <td colspan="2">
          <strong><a href="${request.route_url('sprints')}">${_(u"Sprints")}</a></strong>
          <br>
          Location: TBD
        </td>
      </tr>
    </table>
  </article>
</%block>
