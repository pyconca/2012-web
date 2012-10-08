<%inherit file="base.mako"/>
<%block name="head_title">PyCon.ca - building your Python Canada Community</%block>
<%block name="head_description">${parent.head_description()}</%block>
<%block name="body_class">home-page</%block>

<%block name="content">

<section id="Intro">
  <div class="container">
    <div id="Banner">
        <h1>PyCon.ca</h1>
        <div id="DateAndPlace">${_(u"November 9 – 11, 2012 • Toronto")}</div>
        <!--<h3 class="header-sub-text">${_(u"Bringing the Canadian Python community together")}</h3>-->
    </div>

    <div>
      <div id="Callout">
        <p id="Teaser"><%block filter="gettext">INDEX_ABOUT_BLURB</%block></p>
        <div id="Register">
          <a href="http://guestlistapp.com/events/116013" class="guestlist-event-116013 register-button-en">${_(u"Register")}</a>
        </div>
      </div>
    </div>
  </div>
</section>

<section id="Sponsors">
  <h2>${_("Our Sponsors")}</h2>
  <div id="slider">
      <div class="viewport">
          <ul class="overview" style="width: 1560px; left: 0px; ">
            <li><%include file="pyconca:templates/sponsors/500px.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/freshbooks.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/wave.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/chango.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/psf.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/google.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/points.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/crs.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/upverter.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/bnotions.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/mozilla.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/agendaless.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/heroku.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/trapeze.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/guru_link.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/cloudant.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/vmfarms.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/llc.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/element34.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/danols.mako" args="img_class='black-and-white'"/></li>
            <li><%include file="pyconca:templates/sponsors/albert_oconnor.mako" args="img_class='black-and-white'"/></li>
            </div>
          </ul>
      </div>
  </div>
  <p class="bubble">${_(u"Interested in a sponsorship opportunity?")} <a href="${request.application_url}/sponsors">${_(u"Learn more")}</a>.</p>
</section>

<section id="Blurbs">
  <div class="container">
    <div class="row-fluid">
      <div class="span6 blurb speak">
        <h2>${_(u"Speak")}</h2>
        <p><%block filter="gettext">INDEX_SPEAK_BLURB</%block></p>
        <a href="${request.application_url}/speakers" class="more-info">${_(u"More info")}</a>
      </div>
      <div class="span6 blurb learn">
        <h2>${_(u"Learn")}</h2>
        <p><%block filter="gettext">INDEX_LEARN_BLURB</%block></p>
        <a href="${request.application_url}/learn" class="more-info">${_("More info")}</a>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span6 blurb venue">
        <h2>${_(u"Venue")}</h2>
        <p><%block filter="gettext">INDEX_VENUE_BLURB</%block></p>
        <a href="${request.application_url}/venue" class="more-info">${_(u"More info")}</a>
      </div>
      <div class="span6 blurb schedule">
        <h2>${_(u"Schedule")}</h2>
        <p><%block filter="gettext">INDEX_SCHEDULE_BLURB</%block></p>
        <a href="${request.application_url}/schedule" class="more-info">${_(u"More info")}</a>
      </div>
    </div>
  </div>
</section>

<script>
  $(function() {
    $('#slider').tinycarousel({
      interval: true,
      intervaltime: 3500,
      duration: 500
    });
  });
</script>

<script type="text/javascript" src="http://guestlistapp.com/javascripts/guestlist-embed.js"></script>

</%block>
