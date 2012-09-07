<%inherit file="event.mako"/>

<%block name="title">
    ${_(u"Contact")}
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">${_(u"Contact Us")}</h1>
        <p><%block filter="gettext">CONTACT_US_MAILING_LISTS</%block></p>

        <p>${_(u"We are also online at:")}</p>
        <ul>
          <li>#<a href="irc://irc.freenode.net/#pyconca">pyconca</a></li>
          <li>@<a href="http://twitter.com/pyconca">pyconca</a></li>
          <li><a href="https://github.com/pyconca">github.com/pyconca</a></li>
        </ul>

        <br>
        <script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
        <script>
        new TWTR.Widget({
          version: 2,
          type: 'search',
          search: 'pycon.ca OR \"PyCon Canada\" OR pyconca',
          interval: 30000,
          title: 'Nov 9th-11th 2012, Toronto',
          subject: 'PyCon Canada',
          width: 'auto',
          height: 400,
          theme: {
            shell: {
              background: '#423f39',
              color: '#ffffff'
            },
            tweets: {
              background: '#ffffff',
              color: '#444444',
              links: '#FF7000'
            }
          },
          features: {
            scrollbar: true,
            loop: false,
            live: true,
            behavior: 'all'
          }
        }).render().start();
        </script>
       <br>
    </div>
</%block>
