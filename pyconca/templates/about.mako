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
            <%block filter="gettext">
              Support the efforts of
              <a href='http://montrealpython.org/2011/03/pycon-2014-and-2015-in-montreal/'>
                Montreal Python</a> as they prepare to host
              <a href='http://us.pycon.org/'>PyCon North America</a>
              in 2014 and 2015. This is the first time
              that the main PyCon conference is going to be outside of the US.
              Let's take this opportunity to showcase the Canadian Python
              community, and step up to the challenge as speakers and volunteers.
            </%block>
          </li>
          <li>
            <%block filter="gettext">
             Strengthen the Canadian Python community by providing more
             opportunities for us to share knowledge and ideas, encourage
             support and education for speaking at conferences, and increase
             the visibility of developers, organizations, and companies
             within the community.
            </%block>
          </li>
          <li>
            ${_(u"Host an annual Canadian PyCon conference, starting now - 2012!")}
          </li>
        </ul>

        <p>
          <%block filter="gettext">
          PyCon Canada is entirely run by volunteers who are passionate about
          these goals. We hope to see you at the 2012 conference!
          </%block>
        </p>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header">${_(u"Code of Conduct")}</h1>
      <p>
        <%block filter="gettext">
        Please familiarize yourself with the
        <a href="/conduct">Code of Conduct</a>
        and do your part to make sure PyCon Canada doesn't end up on
        Hacker News for all the wrong reasons.
        </%block>
      </p>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header">${_(u"Made in Canada!")}</h1>
      <p>
        <%block filter="gettext">
        Made in Canada, with help from the greater Python community.
        <strong>Thank-you for your contribution!</strong>
        </%block>
      </p>

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
          <td></td>
        </tr>
      </table>

    <p>
      <%block filter="gettext">
      Have we missed thanking someone? Don't be shy &mdash; let us know:
      <a href="mailto:organizers@pycon.ca">organizers@pycon.ca</a>.
      </%block>
    </p>

    </div>
</%block>
