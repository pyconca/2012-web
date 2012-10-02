<%inherit file="event.mako"/>

<%block name="page_title">| ${_(u"About")}</%block>
<%block name="title">${_(u"About")}</%block>

<%block name="info">
  <article>
    <h2>${_(u"What is PyCon Canada?")}</h2>
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
  </article>

  <article>
    <h2>${_(u"Code of Conduct")}</h2>
    <p><%block filter="gettext">ABOUT_CONDUCT</%block></p>
  </article>

  <article>
    <h2>${_(u"Made in Canada!")}</h2>
    <p><%block filter="gettext">ABOUT_CONTRIBUTIONS</%block></p>

    <table class="table table-bordered">
        <tr>
          <td><a href="https://twitter.com/diana_clarke">Diana Clarke</a></td>
          <td><a href="https://twitter.com/wolever">David Wolever</a></td>
        </tr>

        <tr>
          <td><a href="https://twitter.com/ncurious">Nicola Yap</a></td>
          <td><a href="https://twitter.com/jaaaarel">Taavi Burns</a></td>
        </tr>

        <tr>
          <td><a href="https://twitter.com/kayzh">Kay Zhu</a></td>
          <td><a href="https://twitter.com/yiqingsim">Yi Qing Sim</a></td>
        </tr>

        <tr>
          <td><a href="https://twitter.com/gvwilson">Greg Wilson</a></td>
          <td><a href="https://twitter.com/zachaysan">Zach Aysan</a></td>
        </tr>

        <tr>
          <td><a href="https://twitter.com/jess_sanson">Jess Sanson</a></td>
          <td><a href="https://twitter.com/kmarincic">Kirsten Marincic</a></td>
        </tr>

        <tr>
          <td><a href="https://twitter.com/mdibernardo">Michael DiBernardo</a></td>
          <td><a href="https://twitter.com/dlanger">Daniel Langer</a></td>
        </tr>

        <tr>
          <td><a href="https://twitter.com/dwf">David Warde-Farley</a></td>
          <td><a href="https://twitter.com/mlhamel">Mathieu Leduc-Hamel</a></td>
        </tr>

        <tr>
          <td><a href="http://www.flickr.com/photos/camstatic">Camilla Bjerke</a></td>
          <td><a href="https://twitter.com/myusuf3">Mahdi Yusuf</a></td>
        </tr>

        <tr>
          <td><a href="https://twitter.com/codersquid">Sheila Miguez</a></td>
          <td><a href="https://twitter.com/cfkarsten">Carl Karsten</a></td>
        </tr>

        <tr>
          <td>Teresa Hulinska</td>
          <td><a href="https://twitter.com/baragiotta">Davin Baragiotta</a></td>
        </tr>

        <tr>
          <td><a href="https://twitter.com/lambacck">Christopher Lambacher</a></td>
          <td><a href="https://twitter.com/dlimeb">Dieter Limeback</a></td>
        </tr>

        <tr>
          <td><a href="https://twitter.com/blaiselaflamme">Blaise Laflamme</a></td>
          <td><a href="http://twitter.com/djoume">Djoume Salvetti</a></td>
        </tr>
    </table>

    <p><%block filter="gettext">ABOUT_SHY</%block></p>
  </article>
</%block>
