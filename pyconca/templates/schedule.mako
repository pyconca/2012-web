<%inherit file="event.mako"/>

<%block name="head_title">
    ${_(u"Schedule")}
</%block>

<%block name="title">${_(u"Schedule")}</%block>

<%def name="slot(code)">
  <%
    slot = slots.get(code)
    talk = slot and slot.talk
    owner = talk and talk.owner
  %>
  % if not talk:
    <strong>TBA</strong> (${code})
    <% return %>
  % endif

  <strong><em>${talk.title}</em></strong> by <strong>${owner.first_name} ${owner.last_name}</strong> (${code})
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
            ##${slot("K1")}
            <strong>Jessica McKellar</strong> (K1)
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
            ##${slot("B1")}
            <strong>Michael Bayer</strong> (B1)
          </td>
          <td>
            ${slot("A1")}<br>
            <br>${_(u" --- 5 minutes --- ")}<br><br>
            ${slot("A2")}
          </td>
          <td rowspan="3">
            ${slot("T1")}
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
            ${slot("B2")}
          </td>
          <td>
            ${slot("A3")}<br>
            <br>${_(u" --- 5 minutes --- ")}<br><br>
            ${slot("A4")}
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
            ${slot("B3")}
          </td>
          <td>
            ${slot("A5")}<br>
            <br>${_(u" --- 5 minutes --- ")}<br><br>
            ${slot("A6")}
          </td>
          <td rowspan="7">
            ${slot("T2")}
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
            ${slot("B4")}
          </td>
          <td>
            ${slot("A7")}<br>
            <br>${_(u" --- 5 minutes --- ")}<br><br>
            ${slot("A8")}
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
            ##${slot("B5")}
            <strong>Daniel Lindsley</strong> (B5)
          </td>
          <td>
            ${slot("A9")}<br>
            <br>${_(u" --- 5 minutes --- ")}<br><br>
            ${slot("A10")}
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
            ##${slot("A11")}<br>
            <strong>Meredith L. Patterson</strong> (A11)<br>
            ${_(u" --- 5 minutes --- ")}<br>
            ${slot("A12")}
          </td>
          <td>
            ${slot("A13")}<br>
            <br>${_(u" --- 5 minutes --- ")}<br><br>
            ${slot("A14")}
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
            ${slot("L1")}<br>
            ${slot("L2")}<br>
            ${slot("L3")}<br>
            ${slot("L4")}<br>
            ${slot("L5")}<br>
            ${slot("L6")}<br>
          </td>
          <td>
            ${slot("A15")}<br>
            <br>${_(u" --- 5 minutes --- ")}<br><br>
            ${slot("A16")}
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
          <th>9:15</th>
          <td colspan="3">
            ##${slot("K2")}
            <strong>Michael Feathers</strong> (K2)
          </td>
        </tr>

        <tr>
          <th>10:00</th>
          <td colspan="3">
            <strong>${_(u"Break")}</strong>
          </td>
        </tr>

        <tr>
          <th>10:10</th>
          <td>
            ## ${slot("B6")}
            <strong>Kenneth Reitz</strong> (B6)
          </td>
          <td>
            ${slot("A17")}<br>
            <br>${_(u" --- 5 minutes --- ")}<br><br>
            ${slot("A18")}
          </td>
          <td>
          </td>
        </tr>

        <tr>
          <th>10:55</th>
          <td>
            <strong>Remembrance Day</strong>
          </td>
          <td>
            <strong>Remembrance Day</strong>
          </td>
          <td>
          </td>
        </tr>

        <tr>
          <th>11:03</th>
          <td colspan="3">
            <strong>${_(u"Break")}</strong>
          </td>
        </tr>

        <tr>
          <th>11:10</th>
          <td>
            ${slot("B7")}
          </td>
          <td>
            ${slot("A19")}<br>
            <br>${_(u" --- 5 minutes --- ")}<br><br>
            ${slot("A20")}
          </td>
          <td>
            ${slot("T3")}
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
            ##${slot("B8")}
            <strong><em>OpenStack 101</em> by Sandy Walsh</strong> (B8)
          </td>
          <td>
            ${slot("A21")}<br>
            <br>${_(u" --- 5 minutes --- ")}<br><br>
            ${slot("A22")}
          </td>
          <td rowspan="5">
            ${slot("T4")}
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
            ${slot("B9")}
          </td>
          <td>
            ${slot("A23")}<br>
            <br>${_(u" --- 5 minutes --- ")}<br><br>
            ${slot("A24")}
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
            ##${slot("A25")}<br>
            <strong>Elizabeth Leddy</strong> (A25)<br>
            ${_(u" --- 5 minutes --- ")}<br>
            ${slot("A26")}
          </td>
          <td>
            ${slot("A27")}<br>
            <br>${_(u" --- 5 minutes --- ")}<br><br>
            ${slot("A28")}
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
            ${slot("L7")}<br>
            ${slot("L8")}<br>
            ${slot("L9")}<br>
            ${slot("L10")}<br>
            ${slot("L11")}<br>
            ${slot("L12")}<br>
          </td>
          <td>
            ${slot("A29")}<br>
            <br>${_(u" --- 5 minutes --- ")}<br><br>
            ${slot("A30")}
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
            ##${slot("K3")}
            <strong>Fernando Pérez</strong> (K3)
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
            <a href="${request.route_url('sprints')}">${_(u"Sprints")}</a>
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
            <a href="${request.route_url('sprints')}">${_(u"Sprints")}</a>
            <br>
            Location: TBD
          </td>
        </tr>
      </table>
    </div>

  </div>
</%block>
