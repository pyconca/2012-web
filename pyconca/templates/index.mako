<%inherit file="base.mako"/>

<%block name="page_title">| ${_(u"November 9 – 11, 2012 • Toronto")}</%block>
<%block name="body_class">home-page</%block>

<%block name="content">

<div id="Intro">
  <div class="container">
    <div id="Banner">
        <h1>PyCon.ca</h1>
        <h2>${_(u"November 9 – 11, 2012 • Toronto")}</h2>
    </div>
    <div>
      <div id="Callout">
        <p id="Teaser"><%block filter="gettext">INDEX_ABOUT_BLURB</%block></p>
        <div id="Register">
          <a href="http://guestlistapp.com/events/116013" class="guestlist-event-116013">${_(u"Register")}</a>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="Sponsors">
  <div class="container">
    <div id="sponsors_carousel" class="carousel slide hidden-phone">
      <h2>${_("Our Sponsors")}</h2>
      <div class="carousel-inner" style="opacity: 0.6; height: 100px;">
        <div class="active item">
          <%include file="pyconca:templates/sponsors/500px.mako" args="img_class='black-and-white'"/>
        </div>
        <div class="item">
          <%include file="pyconca:templates/sponsors/freshbooks.mako" args="img_class='black-and-white'"/>
        </div>
        <div class="item">
          <%include file="pyconca:templates/sponsors/wave.mako" args="img_class='black-and-white'"/>
        </div>
        <div class="item">
          <%include file="pyconca:templates/sponsors/chango.mako" args="img_class='black-and-white'"/>
        </div>
        <div class="item">
          <%include file="pyconca:templates/sponsors/psf.mako" args="img_class='black-and-white'"/>
        </div>
        <div class="item">
          <%include file="pyconca:templates/sponsors/upverter.mako" args="img_class='black-and-white'"/>
        </div>
        <div class="item">
          <%include file="pyconca:templates/sponsors/bnotions.mako" args="img_class='black-and-white'"/>
        </div>
        <div class="item">
          <%include file="pyconca:templates/sponsors/heroku.mako" args="img_class='black-and-white'"/>
        </div>
        <div class="item">
          <%include file="pyconca:templates/sponsors/vmfarms.mako" args="img_class='black-and-white'"/>
        </div>
      </div>
    </div>
    <p>${_(u"Interested in a sponsorship opportunity?")} <a href="${request.application_url}/sponsors">${_(u"Learn more")}</a>.</p>
  </div>
</div>

<div id="Blurbs">
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
</div>
  </div>

<script>
  $(function() {
    $('.carousel').carousel({interval: 2500});
  });
</script>

<script type="text/javascript" src="http://guestlistapp.com/javascripts/guestlist-embed.js"></script>

</%block>
