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
            <img alt='%{_("Ohloh profile for Chris McDonough")}' border='0' height='24'
                 src='https://www.ohloh.net/accounts/12691/widgets/account_rank.gif'
                 width='32' />
          </a>
      </h1>
      <p>
         ${_("Chris McDonough is the primary author of the")}
        <a href="http://docs.pylonsproject.org/en/latest/docs/pyramid.html">
          Pyramid web framework
        </a>${_(" and ")}
        <a href="http://supervisord.org/">Supervisor</a>.

        <ul>
            <li>He tweets: <a href="https://twitter.com/chrismcdonough">@chrismcdonough</a></li>
            <li>He codes: <a href="https://github.com/mcdonc">github.com/mcdonc</a></li>
            <li>He blogs: <a href="http://plope.com/">chrism on plope.com</a></li>
        <ul>
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
