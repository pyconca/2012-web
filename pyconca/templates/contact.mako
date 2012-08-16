<%inherit file="event.mako"/>

<%block name="title">
    ${_(u"Contact")}
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">${_(u"Contact Us")}</h1>
        <p>
          ${_(u"""The majority of our discussion occurs on the mailing list
          <a href='mailto:pyconca@googlegroups.com'>pyconca@googlegroups.com</a>
          (<a href='https://groups.google.com/forum/?fromgroups#!forum/pyconca'>archives</a>).
          The organizing committee can be contacted privately at
          <a href='mailto:organizers@pycon.ca'>organizers@pycon.ca</a>, and the
          board (Diana Clarke, Nicola Yap, and David Wolever) can be contacted
          privately at <a href='mailto:board@pycon.ca'>board@pycon.ca</a>.""")}
        </p>

        <p>${_(u"We are also online at:")}</p>
        <ul>
          <li>#<a href="irc://irc.freenode.net/#pyconca">pyconca</a></li>
          <li>@<a href="http://twitter.com/pyconca">pyconca</a></li>
          <li><a href="https://github.com/pyconca">github.com/pyconca</a></li>
        </ul>
    </div>
</%block>
