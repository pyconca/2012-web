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
            ${_(u"""Support the efforts of
            <a href="http://montrealpython.org/2011/03/pycon-2014-and-2015-in-montreal/">
            Montreal Python</a> as they prepare to host
            <a href="http://us.pycon.org/">PyCon North America</a>
            in 2014 and 2015. This is the first time
            that the main PyCon conference is going to be outside of the US.
            Let's take this opportunity to showcase the Canadian Python
            community, and step up to the challenge as speakers and volunteers.""")}
          </li>
          <li>
            ${_(u"""Strengthen the Canadian Python community by providing more
            opportunities for us to share knowledge and ideas, encourage
            support and education for speaking at conferences, and increase
            the visibility of developers, organizations, and companies
            within the community.""")}
          </li>
          <li>
            ${_(u"Host an annual Canadian PyCon conference, starting now - 2012!")}
          </li>
        </ul>

        <p>
          ${_(u"""PyCon Canada is entirely run by volunteers who are passionate about
          these goals. We hope to see you at the 2012 conference!""")}
        </p>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header">${_(u"Made in Canada!")}</h1>
      <p>
        ${_(u"Made in Canada, with help from the greater Python community.")}
        <strong>${_(u"Thank-you for your contribution!")}</strong>
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
          <td>&nbsp;</td>
        </tr>
      </table>

    <p>
      ${_(u"Have we missed thanking someone? Don't be shy &mdash; let us know:")}
      <a href="mailto:organizers@pycon.ca">organizers@pycon.ca</a>.
    </p>

    </div>
</%block>
