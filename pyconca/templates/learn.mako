<%inherit file="event.mako"/>

<%block name="head_title">${_("Confirmed Speakers")}</%block>
<%block name="body_class">learn-section</%block>
<%block name="title">${_("Confirmed Speakers")}</%block>

<%block name="info">
  <article>
    <h2>Michael Bayer
        <a href='https://www.ohloh.net/accounts/5559?ref=Rank'
           style="border-bottom: none;" target='_top'>
          <img alt='Ohloh profile for zzzeek' border='0' height='24'
               src='${request.static_url("pyconca:static/icons/9.gif")}'
               width='32' />
        </a>
    </h2>
    <p><%block filter="gettext">LEARN_MICHAEL_BAYER</%block></p>
  </article>

  <article>
    <h2>Michael Feathers</h2>
    <p><%block filter="gettext">LEARN_MICHAEL_FEATHERS</%block></p>
  </article>

  <article>
    <h2>Elizabeth Leddy
        <a href='https://www.ohloh.net/accounts/124089?ref=Rank'
           style="border-bottom: none;" target='_top'>
          <img alt='Ohloh profile for eleddy' border='0' height='24'
               src='${request.static_url("pyconca:static/icons/8.gif")}'
               width='32' />
        </a>
    </h2>
    <p><%block filter="gettext">LEARN_ELIZABETH_LEDDY</%block></p>
  </article>

  <article>
    <h2>Daniel Lindsley
        <a href='https://www.ohloh.net/accounts/228442?ref=Rank'
           style="border-bottom: none;" target='_top'>
          <img alt='Ohloh profile for daniellindsley' border='0' height='24'
               src='${request.static_url("pyconca:static/icons/8.gif")}'
               width='32' />
        </a>
    </h2>
    <p><%block filter="gettext">LEARN_DANIEL_LINDSLEY</%block></p>
  </article>

  <article>
    <h2>Chris McDonough
        <a href='https://www.ohloh.net/accounts/12691?ref=Rank'
           style="border-bottom: none;" target='_top'>
          <img alt='Ohloh profile for Chris McDonough' border='0' height='24'
               src='${request.static_url("pyconca:static/icons/9.gif")}' />
        </a>
    </h2>
    <p><%block filter="gettext">LEARN_CHRIS_MCDONOUGH</%block></p>
  </article>

  <article>
    <h2>Jessica McKellar
        <a href='https://www.ohloh.net/accounts/69607?ref=Rank'
           style="border-bottom: none;" target='_top'>
          <img alt='Ohloh profile for jesstess' border='0' height='24'
               src='${request.static_url("pyconca:static/icons/9.gif")}'
               width='32' />
        </a>
    </h2>
    <p><%block filter="gettext">LEARN_JESSICA_MCKELLAR</%block></p>
  </article>

  <article>
      <h2>Meredith L. Patterson</h2>
      <p><%block filter="gettext">LEARN_MEREDITH_L_PATTERSON</%block></p>
  </article>

  <article>
      <h2>Fernando Pérez
          <a href='https://www.ohloh.net/accounts/37028?ref=Rank'
             style="border-bottom: none;" target='_top'>
            <img alt='Ohloh profile for Fernando Perez' border='0' height='24'
                 src='${request.static_url("pyconca:static/icons/9.gif")}' />
          </a>
      </h2>
      <p><%block filter="gettext">LEARN_FERNANDO_PÉREZ</%block></p>
  </article>

  <article>
      <h2>Kenneth Reitz
          <a href='https://www.ohloh.net/accounts/224806?ref=Rank'
             style="border-bottom: none;" target='_top'>
            <img alt='Ohloh profile for kennethreitz' border='0' height='24'
                 src='${request.static_url("pyconca:static/icons/8.gif")}'
                 width='32' />
          </a>
      </h2>
      <p><%block filter="gettext">LEARN_KENNETH_REITZ</%block></p>
  </article>

  <article>
      <h2>Brandon Rhodes
          <a href='https://www.ohloh.net/accounts/32600?ref=Rank'
             style="border-bottom: none;" target='_top'>
            <img alt='Ohloh profile for brandon_craig_rhodes' border='0' height='24'
                 src='${request.static_url("pyconca:static/icons/9.gif")}'
                 width='32' />
          </a>
      </h2>
      <p><%block filter="gettext">LEARN_BRANDON_RHODES</%block></p>
  </article>

  <article>
    <h2>Sandy Walsh</h2>
    <p><%block filter="gettext">LEARN_SANDY_WALSH</%block></p>
  </article>
</%block>
