<%inherit file="event.mako"/>

<%block name="title">
    ${_(u"Schedule")}
</%block>

<%block name="info">
  <div class="schedule-page">
    <div class="row-fluid content-section">
      <h1 class="header header-first" id="friday">${_(u"Friday, November 9")}</h1>
      <table class="table table-bordered">
        <tr>
          <th>18:00</th>
          <td>
            <strong>${_(u"Registration, casual mixer and venue setup")}</strong>.
            ${_(u"Come register, hang out, and chat. Food and drinks will be"
            u"provided, and the venue bar will be open.")}
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
            ${_(u"<strong>Lunch</strong> (provided)")}
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
            <strong>${_(u"Talks finish, venue bar opens, appetizers served")}</strong>.
            ${_(u"Time to meet some new people in preparation for dinner.")}
          </td>
        </tr>

        <tr>
          <th>17:00</th>
          <td colspan="2">
            ${_(u"<strong>Dinner</strong>. Not provided. Grab some friends and head"
            u"out to one of the local restaurants.")}
          </td>
        </tr>

        <tr>
          <th>18:00</th>
          <td colspan="2">
            ${_(u"<strong>Open space, BoF sessions</strong>. Hang out and chat. The"
            u"venue bar will be open, and there will be space for"
            u"<a href='http://en.wikipedia.org/wiki/Birds_of_a_feather_(computing)'>"
            u"birds of a feather</a> sessions.")}
          </td>
        </tr>

        <tr>
          <th>00:00</th>
          <td colspan="2">
            <strong>${_(u"Venue closes")}</strong>
          </td>
        </tr>
      </table>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header" id="sunday">${_(u"Sunday, November 11")}</h1>
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
            ${_(u"<strong>Lunch</strong> (provided)")}
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
            ${_(u"<strong>Talks finish, venue bar opens, appetizers served</strong>."
            u"Time to meet some new people in preparation for dinner.")}
          </td>
        </tr>

        <tr>
          <th>17:00</th>
          <td colspan="2">
            ${_(u"<strong>Dinner</strong>. Not provided. Grab some friends and head"
            u"out to one of the local restaurants.")}
          </td>
        </tr>

        <tr>
          <th>18:00</th>
          <td colspan="2">
            ${_(u"<strong>Open space, BoF sessions</strong>. Hang out and chat. The"
            u"venue bar will be open, and there will be space for"
            u"<a href='http://en.wikipedia.org/wiki/Birds_of_a_feather_(computing)'>"
            u"birds of a feather</a> sessions.")}
          </td>
        </tr>

        <tr>
          <th>00:00</th>
          <td colspan="2">
            <strong>${_(u"Venue closes")}</strong>
          </td>
        </tr>
      </table>
    </div>
  </div>
</%block>
