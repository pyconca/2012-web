<%inherit file="event.mako"/>

<%block name="title">
    ${_(u"About")}
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">${_(u"What is PyCon Canada?")}</h1>
        <p>
          ${_(u"PyCon Canada is an initiative to strengthen the Canadian Python community.")}
        </p>

        <p>
          ${_(u"Our main goals:")}
        </p>

        <ul>
          <li>
            <%block filter="gettext">ABOUT_GOAL_SUPPORT</%block>
          </li>
          <li>
            <%block filter="gettext">ABOUT_GOAL_STRENGTHEN</%block>
          </li>
          <li>
            ${_(u"Host an annual Canadian PyCon conference, starting now - 2012!")}
          </li>
        </ul>

        <p><%block filter="gettext">ABOUT_VOLUNTEERS</%block></p>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header">${_(u"Code of Conduct")}</h1>
      <p><%block filter="gettext">ABOUT_CONDUCT</%block></p>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header">${_(u"Made in Canada!")}</h1>
      <p><%block filter="gettext">ABOUT_CONTRIBUTIONS</%block></p>

      <table class="table table-bordered">
        <tr>
          <td>David Wolever</td>
          <td>Diana Clarke</td>
        </tr>

        <tr>
          <td>Nicola Yap</td>
          <td>Taavi Burns</td>
        </tr>

        <tr>
          <td>Kay Zhu</td>
          <td>Yi Qing Sim</td>
        </tr>

        <tr>
          <td>Greg Wilson</td>
          <td>Zach Aysan</td>
        </tr>

        <tr>
          <td>Jess Sanson</td>
          <td>Kirsten Marincic</td>
        </tr>

        <tr>
          <td>Michael DiBernardo</td>
          <td>Daniel Langer</td>
        </tr>

        <tr>
          <td>David Warde-Farley</td>
          <td>Mathieu Leduc-Hamel</td>
        </tr>

        <tr>
          <td>Camilla Bjerke</td>
          <td>Mahdi Yusuf</td>
        </tr>

        <tr>
          <td>Sheila Miguez</td>
          <td>Carl Karsten</td>
        </tr>

        <tr>
          <td>Teresa Hulinska</td>
          <td>Davin Baragiotta</td>
        </tr>

        <tr>
          <td>Christopher Lambacher</td>
          <td>David Warde-Farley</td>
        </tr>

        <tr>
          <td>Dieter Limeback</td>
          <td>Blaise Laflamme</td>
        </tr>
      </table>

    <p><%block filter="gettext">ABOUT_SHY</%block></p>

    </div>
</%block>
