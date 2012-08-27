<%inherit file="event.mako"/>

<%block name="title">
    Confirmed Speakers
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">Mike Bayer</h1>
        <p>
          <%block filter="gettext">
          Mike Bayer is the creator of
          <a href="http://www.sqlalchemy.org/">SQLAlchemy</a> and
          <a href="http://www.makotemplates.org/">Mako Templates</a>.
          </%block>
        <ul>
            <li>${_("He tweets: ")}<a href="https://twitter.com/zzzeek">@zzzeek</a></li>
            <li>${_("He codes: ")}<a href="https://bitbucket.org/zzzeek">bitbucket.org/zzzeek</a></li>
            <li>${_("He blogs: ")}<a href="http://techspot.zzzeek.org">techspot.zzzeek.org</a></li>
        <ul>
        </p>
    </div>
</%block>
