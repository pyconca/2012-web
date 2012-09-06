<%inherit file="event.mako"/>

<%block name="title">
    ${_("Confirmed Speakers")}
</%block>

<%block name="info">
    <div class="row-fluid content-section">
      <h1 class="header header-first">Mike Bayer
          <a href='https://www.ohloh.net/accounts/5559?ref=Rank'
             style="border-bottom: none;" target='_top'>
            <img alt='Ohloh profile for zzzeek' border='0' height='24'
                 src='https://www.ohloh.net/accounts/5559/widgets/account_rank.gif'
                 width='32' />
          </a>
      </h1>
      <p>
        ${_("Mike Bayer is the creator of")}
        <a href="http://www.sqlalchemy.org/">SQLAlchemy</a>${_(" and ")}
        <a href="http://www.makotemplates.org/">Mako Templates</a>.
        <ul>
          <li>${_("He tweets: ")}<a href="https://twitter.com/zzzeek">@zzzeek</a></li>
          <li>${_("He codes: ")}<a href="https://bitbucket.org/zzzeek">bitbucket.org/zzzeek</a></li>
          <li>${_("He blogs: ")}<a href="http://techspot.zzzeek.org">techspot.zzzeek.org</a></li>
        </ul>
      </p>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header">Chris McDonough
          <a href='https://www.ohloh.net/accounts/12691?ref=Rank'
             style="border-bottom: none;" target='_top'>
            <img alt='Ohloh profile for Chris McDonough' border='0' height='24'
                 src='https://www.ohloh.net/accounts/12691/widgets/account_rank.gif'
                 width='32' />
          </a>
      </h1>
      <p>
        <a href="https://twitter.com/chrismcdonough">Chris McDonough</a>
        is the primary author of the
        <a href="http://docs.pylonsproject.org/en/latest/docs/pyramid.html">
        Pyramid web application</a> framework. He is a developer and
        consultant for Agendaless Consulting, a company based in
        Fredericksburg, VA, USA. His other major projects include
         <a href="http://supervisord.org/">Supervisor</a>, a
         Python process management system.
      </p>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header">Jessica McKellar
          <a href='https://www.ohloh.net/accounts/69607?ref=Rank'
             style="border-bottom: none;" target='_top'>
            <img alt='Ohloh profile for jesstess' border='0' height='24'
                 src='https://www.ohloh.net/accounts/69607/widgets/account_rank.gif'
                 width='32' />
          </a>
      </h1>
      <p>
        <a href="http://jesstess.com">Jessica McKellar</a>
        is a software engineer from Cambridge, MA.
        She is a Python Software Foundation board member and an
        organizer for the <a href="http://meetup.bostonpython.com/">
        largest Python user group in the world</a>.
        With that group she runs the 
        <a href="http://bostonpythonworkshop.com/">
        Boston Python Workshops</a> for
        women and their friends -- an introductory programming
        pipeline that has brought hundreds of women into the local
        Python community and is being replicated in cities across
        the US. Jessica is a veteran open source contributor and
        a maintainer for several open source projects, including
        OpenHatch and the Twisted event-driven networking engine; she
        wrote a chapter on Twisted for
        <a href="http://www.aosabook.org/en/index.html">The Architecture
        of Open Source Applications Volume II</a> and is working with
        O'Reilly on a new edition of Twisted Networking Essentials.
      </p>
    </div>

    <div class="row-fluid content-section">
      <h1 class="header">Sandy Walsh</h1>
      <p>
        <%block filter="gettext">
         Based in Halifax, Alex 'Sandy' Walsh is the owner of Dark Secret
         Software. He has been a senior professional developer for nearly 20
         years and a Pythonista for 10 years. He is a core developer on the
         <a href="http://www.openstack.org/">OpenStack</a> project with
         Rackspace. You can learn more about him at
         <a href="http://www.sandywalsh.com/">sandywalsh.com</a> or follow
         <a href="https://twitter.com/TheSandyWalsh">@TheSandyWalsh</a>.
        </%block>
      </p>
    </div>

</%block>
