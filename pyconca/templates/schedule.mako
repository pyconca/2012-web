<%inherit file="event.mako"/>

<%block name="head_title">${_(u"Schedule")}</%block>
<%block name="body_class">schedule-section</%block>
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
        <td colspan="3">
          <strong>${_(u"Registration")}</strong>
        </td>
      </tr>

      <tr>
        <th>9:00</th>
        <td colspan="3">
          <strong>Welcome to PyCon Canada</strong>
        </td>
      </tr>

      <tr>
        <th>9:30</th>
        <td colspan="3">
          <strong>Keynote - K1</strong>
        </td>
      </tr>

      <tr>
        <th>10:15</th>
        <td colspan="3">
          <strong>${_(u"Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>10:25</th>
        <td>
          <strong>${_(u"45 Minute Talk - B1")}</strong>
        </td>
        <td>
          <strong>${_(u"20 Minute Talk - A1")}</strong><br>
          ${_(u" --- 5 minutes --- ")}<br>
          <strong>${_(u"20 Minute Talk - A2")}</strong>
        </td>
        <td rowspan="3">
          <strong>${_(u"90 Minute Tutorial - T1")}</strong>
        </td>
      </tr>

      <tr>
        <th>11:10</th>
        <td colspan="2">
          <strong>${_(u"Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>11:20</th>
        <td>
          <strong>${_(u"45 Minute Talk - B2")}</strong>
        </td>
        <td>
          <strong>${_(u"20 Minute Talk - A3")}</strong><br>
          ${_(u" --- 5 minutes --- ")}<br>
          <strong>${_(u"20 Minute Talk - A4")}</strong>
        </td>
      </tr>

      <tr>
        <th>12:05</th>
        <td colspan="3">
          <strong>${_(u"Lunch (provided)")}</strong>
        </td>
      </tr>

      <tr>
        <th>1:05</th>
        <td>
          <strong>${_(u"45 Minute Talk - B3")}</strong>
        </td>
        <td>
          <strong>${_(u"20 Minute Talk - A5")}</strong><br>
          ${_(u" --- 5 minutes --- ")}<br>
          <strong>${_(u"20 Minute Talk - A6")}</strong>
        </td>
        <td rowspan="7">
          <strong>${_(u"3 Hour Tutorial - T2")}</strong>
        </td>
      </tr>

       <tr>
        <th>1:50</th>
        <td colspan="2">
          <strong>${_(u"Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>2:00</th>
        <td>
          <strong>${_(u"45 Minute Talk - B4")}</strong>
        </td>
        <td>
          <strong>${_(u"20 Minute Talk - A7")}</strong><br>
          ${_(u" --- 5 minutes --- ")}<br>
          <strong>${_(u"20 Minute Talk - A8")}</strong>
        </td>
      </tr>

       <tr>
        <th>2:45</th>
        <td colspan="2">
          <strong>${_(u"Coffee Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>3:00</th>
        <td>
          <strong>${_(u"45 Minute Talk - B5")}</strong>
        </td>
        <td>
          <strong>${_(u"20 Minute Talk - A9")}</strong><br>
          ${_(u" --- 5 minutes --- ")}<br>
          <strong>${_(u"20 Minute Talk - A10")}</strong>
        </td>
      </tr>

      <tr>
        <th>3:45</th>
        <td colspan="2">
          <strong>${_(u"Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>3:55</th>
        <td>
          <strong>${_(u"45 Minute Talk - B6")}</strong>
        </td>
        <td>
          <strong>${_(u"20 Minute Talk - A11")}</strong><br>
          ${_(u" --- 5 minutes --- ")}<br>
          <strong>${_(u"20 Minute Talk - A12")}</strong>
        </td>
      </tr>

      <tr>
        <th>4:40</th>
        <td colspan="3">
          <strong>${_(u"Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>4:50</th>
        <td>
          <strong>${_(u"Lightning Talk - L1")}</strong><br>
          <strong>${_(u"Lightning Talk - L2")}</strong><br>
          <strong>${_(u"Lightning Talk - L3")}</strong><br>
          <strong>${_(u"Lightning Talk - L4")}</strong><br>
          <strong>${_(u"Lightning Talk - L5")}</strong><br>
          <strong>${_(u"Lightning Talk - L6")}</strong><br>
        </td>
        <td>
          <strong>${_(u"20 Minute Talk - A13")}</strong><br>
          ${_(u" --- 5 minutes --- ")}<br>
          <strong>${_(u"20 Minute Talk - A14")}</strong>
        </td>
        <td>
        </td>
      </tr>

      <tr>
        <th>5:35</th>
        <td colspan="3">
          <strong>${_(u"Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>5:40</th>
        <td colspan="3">
          <strong>${_(u"Closing Messages")}</strong>
        </td>
      </tr>

      <tr>
        <th>5:45</th>
        <td colspan="3">
          <%block filter="gettext">SCHEDULE_TALKS_DONE</%block>
        </td>
      </tr>

      <tr>
        <th>6:30</th>
        <td colspan="3">
          <%block filter="gettext">SCHEDULE_DINNER</%block>
        </td>
      </tr>

      <tr>
        <th>7:30</th>
        <td colspan="3">
          <%block filter="gettext">SCHEDULE_SPRINTS</%block>
        </td>
      </tr>

      <tr>
        <th>Midnight</th>
        <td colspan="3">
          <strong>${_(u"Venue closes")}</strong>
        </td>
      </tr>
    </table>
  </article>

  <article>
    <h2>${_(u"Sunday, November 11")}</h2>
    <table class="table table-bordered">
      <tr>
        <th>8:30</th>
        <td colspan="3">
          <strong>${_(u"Registration")}</strong>
        </td>
      </tr>

      <tr>
        <th>9:00</th>
        <td colspan="3">
          <strong>Morning Messages</strong>
        </td>
      </tr>

      <tr>
        <th>9:30</th>
        <td colspan="3">
          <strong>Keynote - K2</strong>
        </td>
      </tr>

      <tr>
        <th>10:15</th>
        <td colspan="3">
          <strong>${_(u"Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>10:25</th>
        <td>
          <strong>${_(u"20 Minute Talk - A15")}</strong>
        </td>
        <td>
          <strong>${_(u"20 Minute Talk - A16")}</strong>
        </td>
        <td>
        </td>
      </tr>

      <tr>
        <th>10:45</th>
        <td colspan="3">
          <strong>${_(u"Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>10:55</th>
        <td colspan="3">
          <strong>Remembrance Day</strong>
        </td>
      </tr>

      <tr>
        <th>11:05</th>
        <td colspan="3">
          <strong>${_(u"Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>11:10</th>
        <td>
          <strong>${_(u"45 Minute Talk - B7")}</strong>
        </td>
        <td>
          <strong>${_(u"20 Minute Talk - A17")}</strong><br>
          ${_(u" --- 5 minutes --- ")}<br>
          <strong>${_(u"20 Minute Talk - A18")}</strong>
        </td>
        <td>
          <strong>${_(u"45 Minute Talk - T3")}</strong>
        </td>
      </tr>

      <tr>
        <th>11:55</th>
        <td colspan="3">
          <strong>${_(u"Lunch (provided)")}</strong>
        </td>
      </tr>

      <tr>
        <th>12:55</th>
        <td>
          <strong>${_(u"45 Minute Talk - B8")}</strong>
        </td>
        <td>
          <strong>${_(u"20 Minute Talk - A19")}</strong><br>
          ${_(u" --- 5 minutes --- ")}<br>
          <strong>${_(u"20 Minute Talk - A20")}</strong>
        </td>
        <td rowspan="5">
          <strong>${_(u"2 Hour Tutorial - T4")}</strong>
        </td>
      </tr>

       <tr>
        <th>1:40</th>
        <td colspan="2">
          <strong>${_(u"Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>1:50</th>
        <td>
          <strong>${_(u"45 Minute Talk - B9")}</strong>
        </td>
        <td>
          <strong>${_(u"20 Minute Talk - A21")}</strong><br>
          ${_(u" --- 5 minutes --- ")}<br>
          <strong>${_(u"20 Minute Talk - A22")}</strong>
        </td>
      </tr>

       <tr>
        <th>2:35</th>
        <td colspan="2">
          <strong>${_(u"Coffee Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>2:50</th>
        <td>
          <strong>${_(u"45 Minute Talk - B10")}</strong>
        </td>
        <td>
          <strong>${_(u"20 Minute Talk - A23")}</strong><br>
          ${_(u" --- 5 minutes --- ")}<br>
          <strong>${_(u"20 Minute Talk - A24")}</strong>
        </td>
      </tr>

      <tr>
        <th>3:35</th>
        <td colspan="3">
          <strong>${_(u"Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>3:45</th>
        <td>
          <strong>${_(u"Lightning Talk - L7")}</strong><br>
          <strong>${_(u"Lightning Talk - L8")}</strong><br>
          <strong>${_(u"Lightning Talk - L9")}</strong><br>
          <strong>${_(u"Lightning Talk - L10")}</strong><br>
          <strong>${_(u"Lightning Talk - L11")}</strong><br>
          <strong>${_(u"Lightning Talk - L12")}</strong><br>
        </td>
        <td>
          <strong>${_(u"20 Minute Talk - A25")}</strong><br>
          ${_(u" --- 5 minutes --- ")}<br>
          <strong>${_(u"20 Minute Talk - A26")}</strong>
        </td>
        <td>
        </td>
      </tr>

      <tr>
        <th>4:30</th>
        <td colspan="3">
          <strong>${_(u"Break")}</strong>
        </td>
      </tr>

      <tr>
        <th>4:40</th>
        <td colspan="3">
          <strong>${_(u"Closing Keynote - K3")}</strong>
        </td>
      </tr>

      <tr>
        <th>5:25</th>
        <td colspan="3">
          <strong>${_(u"Closing Messages")}</strong>
        </td>
      </tr>

      <tr>
        <th>5:30</th>
        <td colspan="3">
          <%block filter="gettext">SCHEDULE_TALKS_DONE</%block>
        </td>
      </tr>

      <tr>
        <th>6:30</th>
        <td colspan="3">
          <%block filter="gettext">SCHEDULE_DINNER</%block>
        </td>
      </tr>

      <tr>
        <th>7:30</th>
        <td colspan="3">
          <%block filter="gettext">SCHEDULE_SPRINTS</%block>
        </td>
      </tr>

      <tr>
        <th>Midnight</th>
        <td colspan="3">
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
        <td colspan="3">
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
        <td colspan="3">
          <strong><a href="${request.route_url('sprints')}">${_(u"Sprints")}</a></strong>
          <br>
          Location: TBD
        </td>
      </tr>
    </table>
  </article>
</%block>
