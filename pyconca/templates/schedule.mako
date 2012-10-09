<%inherit file="event.mako"/>

<%block name="head_title">
    ${_(u"Schedule")}
</%block>

<%def name="slot(code)">
  <%
    from pyconca.models import DBSession, ScheduleSlot
    slot = DBSession.query(ScheduleSlot).filter_by(code=code).first()
    talk = slot and slot.talk
    owner = talk and talk.owner
  %>
  % if not talk:
    ${code} - TBA
    <% return %>
  % endif

  ${code}: ${owner.first_name} ${owner.last_name}: ${talk.title}
</%def>

<%block name="info">
  <div class="schedule-page">
    <div class="row-fluid content-section">
      <h1 class="header header-first" id="friday">${_(u"Friday, November 9")}</h1>
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
    </div>

    <div class="row-fluid content-section">
      <h1 class="header" id="saturday">${_(u"Saturday, November 10")}</h1>
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
            <strong>Keynote - ${slot("K1")}</strong>
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
            <strong>${slot("B1")}</strong>
          </td>
          <td>
            <strong>${slot("A1")}</strong><br>
            ${_(u" --- 5 minutes --- ")}<br>
            <strong>${slot("A2")}</strong>
          </td>
          <td rowspan="3">
            <strong>${slot("T1")}</strong>
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
            <strong>${slot("B2")}</strong>
          </td>
          <td>
            <strong>${slot("A3")}</strong><br>
            ${_(u" --- 5 minutes --- ")}<br>
            <strong>${slot("A4")}</strong>
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
            <strong>${slot("B3")}</strong>
          </td>
          <td>
            <strong>${slot("A5")}</strong><br>
            ${_(u" --- 5 minutes --- ")}<br>
            <strong>${slot("A6")}</strong>
          </td>
          <td rowspan="7">
            <strong>${slot("T2")}</strong>
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
            <strong>${slot("B4")}</strong>
          </td>
          <td>
            <strong>${slot("A7")}</strong><br>
            ${_(u" --- 5 minutes --- ")}<br>
            <strong>${slot("A8")}</strong>
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
            <strong>${slot("B5")}</strong>
          </td>
          <td>
            <strong>${slot("A9")}</strong><br>
            ${_(u" --- 5 minutes --- ")}<br>
            <strong>${slot("A10")}</strong>
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
            <strong>${slot("B6")}</strong>
          </td>
          <td>
            <strong>${slot("A11")}</strong><br>
            ${_(u" --- 5 minutes --- ")}<br>
            <strong>${slot("A12")}</strong>
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
            <strong>${slot("L1")}</strong><br>
            <strong>${slot("L2")}</strong><br>
            <strong>${slot("L3")}</strong><br>
            <strong>${slot("L4")}</strong><br>
            <strong>${slot("L5")}</strong><br>
            <strong>${slot("L6")}</strong><br>
          </td>
          <td>
            <strong>${slot("A13")}</strong><br>
            ${_(u" --- 5 minutes --- ")}<br>
            <strong>${slot("A14")}</strong>
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
    </div>

    <div class="row-fluid content-section">
      <h1 class="header" id="sunday">${_(u"Sunday, November 11")}</h1>
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
            <strong>${slot("A15")}</strong>
          </td>
          <td>
            <strong>${slot("A16")}</strong>
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
            <strong>${slot("B7")}</strong>
          </td>
          <td>
            <strong>${slot("A17")}</strong><br>
            ${_(u" --- 5 minutes --- ")}<br>
            <strong>${slot("A18")}</strong>
          </td>
          <td>
            <strong>${slot("T3")}</strong>
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
            <strong>${slot("B8")}</strong>
          </td>
          <td>
            <strong>${slot("A19")}</strong><br>
            ${_(u" --- 5 minutes --- ")}<br>
            <strong>${slot("A20")}</strong>
          </td>
          <td rowspan="5">
            <strong>${slot("T4")}</strong>
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
            <strong>${slot("B9")}</strong>
          </td>
          <td>
            <strong>${slot("A21")}</strong><br>
            ${_(u" --- 5 minutes --- ")}<br>
            <strong>${slot("A22")}</strong>
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
            <strong>${slot("B10")}</strong>
          </td>
          <td>
            <strong>${slot("A23")}</strong><br>
            ${_(u" --- 5 minutes --- ")}<br>
            <strong>${slot("A24")}</strong>
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
            <strong>${slot("L7")}</strong><br>
            <strong>${slot("L8")}</strong><br>
            <strong>${slot("L9")}</strong><br>
            <strong>${slot("L10")}</strong><br>
            <strong>${slot("L11")}</strong><br>
            <strong>${slot("L12")}</strong><br>
          </td>
          <td>
            <strong>${slot("A25")}</strong><br>
            ${_(u" --- 5 minutes --- ")}<br>
            <strong>${slot("A26")}</strong>
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
    </div>

    <div class="row-fluid content-section">
      <h1 class="header" id="monday">${_(u"Monday, November 12")}</h1>
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
    </div>

    <div class="row-fluid content-section">
      <h1 class="header" id="tuesday">${_(u"Tuesday, November 13")}</h1>
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
    </div>

  </div>
</%block>
