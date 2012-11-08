<%inherit file="event.mako"/>

<%block name="head_title">
    ${_(u"Schedule")}
</%block>

<%block name="title">${_(u"Schedule")}</%block>

<%def name="slot_from_code(code)">
  <%
    slot = slots.get(code)
    talk = slot and slot.talk
    owner = talk and talk.owner
    talk_url = talk and request.route_url('talk_get', id=talk.id)
  %>

  ${render_slot(
    talk_url,
    (talk and talk.title),
    (owner and "%s %s" %(owner.first_name, owner.last_name)),
    (slot and slot.room),
    code
  )}
</%def>

<%def name="render_slot(talk_url, title, owner_name, room, code)">
  <div class="talk-slot">
    % if title is None:
      <strong>TBA</strong> (${code})
      <% return %>
    % endif

    <%
      if "K" in code:
        title_style = ""
      else:
        title_style = "font-style: italic;"
    %>

    % if talk_url:
        <a href="${talk_url}">
    % endif
        <strong style="${title_style}">${title}</strong>
    % if talk_url:
        </a>
    % endif
    by <strong>${owner_name}</strong>

    <span class="talk-meta-phone">
      ${room.title()} • ${code}
      % if "T" in code:
        • <a href="https://github.com/pyconca/pyconca2012/wiki/Tutorials">reserve a seat</a>
      % endif
    </span>
    <span class="talk-meta-desktop">(${code})</span>
    % if "T" in code:
      <p class="tutorial-plug">
        <em class="limited-space">Space is limited!</em> <a href='https://github.com/pyconca/pyconca2012/wiki/Tutorials'>Reserve your seat</a> to avoid disappointment.
      </p>
    % endif
  </div>
</%def>

<%def name="five_min_break()">
  <div class="five-min-break">${_(u"• 5 minute break •")}</div>
</%def>

<%block name="info">
  <div class="schedule-page">
    <article>
    <div class="row-fluid content-section">
      <h2 class="header header-first" id="friday">${_(u"Friday, November 9")}</h2>
      <table class="table table-bordered">
        <tr>
          <th>${_(u"6:00pm")}</th>
          <td>
            <%block filter="gettext">SCHEDULE_PARTY</%block>
          </td>
        </tr>
        <tr>
          <th>${_(u"11:30pm")}</th>
          <td>
            <strong>${_(u"Venue closes")}</strong>
          </td>
        </tr>
      </table>
    </div>

    <div class="row-fluid content-section">
      <h2 class="header" id="saturday">${_(u"Saturday, November 10")}</h2>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th></th>
            <th>Main Hall</td>
            <th>Lower Hall</td>
            <th>Tutorial Room</td>
          </tr>
        </thead>

        <tbody>
          <tr>
            <th>${_(u"8:30am")}</th>
            <td colspan="3">
              <strong>${_(u"Registration")}</strong>
            </td>
          </tr>


          <tr>
            <th>${_(u"9:00am")}</th>
            <td colspan="3">
              <strong>Welcome to PyCon Canada</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"9:30am")}</th>
            <td colspan="3">
              ${render_slot('', _("Morning Keynote"), "Jessica McKellar", "Main Hall", "K1")}
            </td>
          </tr>

          <tr>
            <th>${_(u"10:15am")}</th>
            <td colspan="3">
              <strong>${_(u"Break")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"10:25am")}</th>
            <td>
              ${slot_from_code("B1")}
            </td>
            <td>
              ${slot_from_code("A1")}
              ${five_min_break()}
              ${slot_from_code("A2")}
            </td>
            <td rowspan="3">
              90 minute tutorial:<br>
              ${slot_from_code("T1")}
            </td>
          </tr>

          <tr>
            <th>${_(u"11:10am")}</th>
            <td colspan="2">
              <strong>${_(u"Break")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"11:20am")}</th>
            <td>
              ${slot_from_code("B2")}
            </td>
            <td>
              ${slot_from_code("A3")}
              ${five_min_break()}
              ${slot_from_code("A4")}
            </td>
          </tr>

          <tr>
            <th>${_(u"12:05pm")}</th>
            <td colspan="3">
              <strong>${_(u"Lunch (provided)")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"1:05pm")}</th>
            <td>
              ${slot_from_code("B3")}
            </td>
            <td>
              ${slot_from_code("A5")}
              ${five_min_break()}
              ${slot_from_code("A6")}
            </td>
            <td rowspan="7">
              3 hour tutorial:<br>
              ${slot_from_code("T2")}
            </td>
          </tr>

           <tr>
            <th>${_(u"1:50pm")}</th>
            <td colspan="2">
              <strong>${_(u"Break")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"2:00pm")}</th>
            <td>
              ${slot_from_code("B4")}
            </td>
            <td>
              ${slot_from_code("A7")}
              ${five_min_break()}
              ${slot_from_code("A8")}
            </td>
          </tr>

           <tr>
            <th>${_(u"2:45pm")}</th>
            <td colspan="2">
              <strong>${_(u"Coffee Break")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"3:00pm")}</th>
            <td>
              ${slot_from_code("B5")}
            </td>
            <td>
              ${slot_from_code("A9")}
              ${five_min_break()}
              ${slot_from_code("A10")}
            </td>
          </tr>

          <tr>
            <th>${_(u"3:45pm")}</th>
            <td colspan="2">
              <strong>${_(u"Break")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"3:55pm")}</th>
            <td>
              ${slot_from_code("A11")}
              ${five_min_break()}
              ${slot_from_code("A12")}
            </td>
            <td>
              ${slot_from_code("A13")}
              ${five_min_break()}
              ${slot_from_code("A14")}
            </td>
          </tr>

          <tr>
            <th>${_(u"4:40pm")}</th>
            <td colspan="3">
              <strong>${_(u"Break")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"4:50pm")}</th>
            <td>
              ${slot_from_code("L1")}
              ${slot_from_code("L2")}
              ${slot_from_code("L3")}
            </td>
            <td>
              ${slot_from_code("A15")}
            </td>
            <td>
            </td>
          </tr>

          <tr>
            <th>${_(u"5:15pm")}</th>
            <td>
              ${slot_from_code("L4")}
              ${slot_from_code("L5")}
              ${slot_from_code("L6")}
            </td>
            <td>
              ${slot_from_code("A16")}
            </td>
            <td>
            </td>
          </tr>

          <tr>
            <th>${_(u"5:35pm")}</th>
            <td colspan="3">
              <strong>${_(u"Break")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"5:40pm")}</th>
            <td colspan="3">
              <strong>${_(u"Closing Messages")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"5:45pm")}</th>
            <td colspan="3">
              <%block filter="gettext">SCHEDULE_TALKS_DONE</%block>
            </td>
          </tr>

          <tr>
            <th>${_(u"6:30pm")}</th>
            <td colspan="3">
              <%block filter="gettext">SCHEDULE_DINNER</%block>
            </td>
          </tr>

          <tr>
            <th>${_(u"7:30pm")}</th>
            <td colspan="3">
              <%block filter="gettext">SCHEDULE_SPRINTS</%block>
            </td>
          </tr>

          <tr>
            <th>${_(u"11:30pm")}</th>
            <td colspan="3">
              <strong>${_(u"Venue closes")}</strong>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <div class="row-fluid content-section">
      <h2 class="header" id="sunday">${_(u"Sunday, November 11")}</h2>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th></th>
            <th>Main Hall</td>
            <th>Lower Hall</td>
            <th>Tutorial Room</td>
          </tr>
        </thead>

        <tbody>
          <tr>
            <th>${_(u"8:30am")}</th>
            <td colspan="3">
              <strong>${_(u"Registration")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"9:00am")}</th>
            <td colspan="3">
              <strong>Morning Messages</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"9:15am")}</th>
            <td colspan="3">
              ${render_slot('', _("Morning Keynote"), "Michael Feathers", "Main Hall", "K2")}
            </td>
          </tr>

          <tr>
            <th>${_(u"10:00am")}</th>
            <td colspan="3">
              <strong>${_(u"Break")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"10:10am")}</th>
            <td>
              ${slot_from_code("B6")}
            </td>
            <td>
              ${slot_from_code("A17")}
              ${five_min_break()}
              ${slot_from_code("A18")}
            </td>
            <td>
            </td>
          </tr>

          <tr>
            <th>${_(u"10:55am")}</th>
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
            <th>${_(u"11:03am")}</th>
            <td colspan="3">
              <strong>${_(u"Break")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"11:10am")}</th>
            <td>
              ${slot_from_code("B7")}
            </td>
            <td>
              ${slot_from_code("A19")}
              ${five_min_break()}
              ${slot_from_code("A20")}
            </td>
            <td></td>
          </tr>

          <tr>
            <th>${_(u"11:55am")}</th>
            <td colspan="3">
              <strong>${_(u"Lunch (provided)")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"12:55pm")}</th>
            <td>
              ${slot_from_code("B8")}
            </td>
            <td>
              ${slot_from_code("A21")}
              ${five_min_break()}
              ${slot_from_code("A22")}
            </td>
            <td rowspan="5">
              2 hour tutorial:<br>
              ${slot_from_code("T4")}
            </td>
          </tr>

           <tr>
            <th>${_(u"1:40pm")}</th>
            <td colspan="2">
              <strong>${_(u"Break")}</strong>
            </td>
          </tr>
   
          <tr>
            <th>${_(u"1:50pm")}</th>
            <td>
              ${slot_from_code("B9")}
            </td>
            <td>
              ${slot_from_code("A23")}
              ${five_min_break()}
              ${slot_from_code("A24")}
            </td>
          </tr>

           <tr>
            <th>${_(u"2:35pm")}</th>
            <td colspan="2">
              <strong>${_(u"Coffee Break")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"2:50pm")}</th>
            <td>
              ${slot_from_code("A25")}
            </td>
            <td>
              ${slot_from_code("A27")}
            </td>
          </tr>

          <tr>
            <th>${_(u"3:15pm")}</th>
            <td>
              ${slot_from_code("A26")}
            </td>
            <td>
              ${slot_from_code("A28")}
            </td>
            <td>
            </td>
          </tr>

          <tr>
            <th>${_(u"3:35pm")}</th>
            <td colspan="3">
              <strong>${_(u"Break")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"3:45pm")}</th>
            <td>
              ${slot_from_code("L7")}
              ${slot_from_code("L8")}
              ${slot_from_code("L9")}
            </td>
            <td rowspan="2">
              ${slot_from_code("A29")}
            </td>
            <td>
            </td>
          </tr>

          <tr>
            <th>${_(u"4:10pm")}</th>
            <td>
              ${slot_from_code("L10")}
              ${slot_from_code("L11")}
              ${slot_from_code("L12")}
            </td>
            <td></td>
          </tr>

          <tr>
            <th>${_(u"4:30pm")}</th>
            <td colspan="3">
              <strong>${_(u"Break")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"4:40pm")}</th>
            <td colspan="3">
              ${render_slot('', _("Closing Keynote"), u"Fernando Pérez", "Main Hall", "K3")}
            </td>
          </tr>

          <tr>
            <th>${_(u"5:25pm")}</th>
            <td colspan="3">
              <strong>${_(u"Closing Messages")}</strong>
            </td>
          </tr>

          <tr>
            <th>${_(u"5:30pm")}</th>
            <td colspan="3">
              <%block filter="gettext">SCHEDULE_TALKS_DONE</%block>
            </td>
          </tr>

          <tr>
            <th>${_(u"6:30pm")}</th>
            <td colspan="3">
              <%block filter="gettext">SCHEDULE_DINNER</%block>
            </td>
          </tr>

          <tr>
            <th>${_(u"7:30pm")}</th>
            <td colspan="3">
              <%block filter="gettext">SCHEDULE_SPRINTS</%block>
            </td>
          </tr>

          <tr>
            <th>${_(u"11:30pm")}</th>
            <td colspan="3">
              <strong>${_(u"Venue closes")}</strong>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <div class="row-fluid content-section">
      <h2 class="header" id="monday">${_(u"Monday, November 12")}</h2>
      <table class="table table-bordered">
        <tr>
          <th>${_(u"10:00am")} - ${_(u"11:00pm")}</th>
          <td colspan="3">
            <a href="${request.route_url('sprints')}">${_(u"Sprints")}</a>
            <br>
            Location: <a href="http://ladieslearningcode.com/">Ladies Learning Code's</a> workshop space, <a href="http://goo.gl/maps/yA9E0">720 Bathurst Street, suite 500</a>.
          </td>
        </tr>
      </table>
    </div>

    <div class="row-fluid content-section">
      <h2 class="header" id="tuesday">${_(u"Tuesday, November 13")}</h2>
      <table class="table table-bordered">
        <tr>
          <th>${_(u"10:00am")} - ${_(u"11:00pm")}</th>
          <td colspan="3">
            <a href="${request.route_url('sprints')}">${_(u"Sprints")}</a>
            <br>
            Location: <a href="http://ladieslearningcode.com/">Ladies Learning Code's</a> workshop space, <a href="http://goo.gl/maps/yA9E0">720 Bathurst Street, suite 500</a>.
          </td>
        </tr>
      </table>
    </div>

  </article>
  </div>

  <script>
    $("th, td").each(function() {
      var $this = $(this);
      if ($this.text().match(/^\s*$/))
        $this.addClass("empty");
    });
  </script>
</%block>
