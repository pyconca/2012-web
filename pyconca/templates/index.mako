<%inherit file="base.mako"/>
<%block name="head_title">PyCon.ca - building your Python Canada Community</%block>
<%block name="head_description">${parent.head_description()}</%block>

<%block name="content">

<div class="row-fluid main-header-image">
  <div class="span12">

    <div class="row-fluid">
      <br>
    </div>

    <div class="row-fluid">
      <div class="span12 top-row main-row overlay">
        <h1 class="header-main-text">${_(u"PyCon Canada")}</h1>
        <h2 class="header-sub-text">${_(u"Toronto, November 9th - 11th 2012")}</h2>
        <h3 class="header-sub-text">${_(u"Bringing the Canadian Python community together")}</h3>
        <br />
        <div class="visible-desktop">
            <a href="http://guestlistapp.com/events/116013" class="btn btn-warning btn-large guestlist-event-116013">${_(u"Register")}</a>
            <a href="${request.application_url}/sponsors" class="btn btn-large">${_(u"Sponsor")}</a>
        </div>
        <div class="hidden-desktop">
            <a href="http://guestlistapp.com/events/116013" class="btn btn-warning btn-large">${_(u"Register")}</a>
            <a href="${request.application_url}/sponsors" class="btn btn-large">${_(u"Sponsor")}</a>
        </div>
      </div>
    </div>

    <div class="row-fluid">
      <div class="span1">
      </div>

      <div class="span4">
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div id="sponsors_carousel" class="carousel slide hidden-phone">
          <h6>${_("Sponsors")}</h6>
          <br>
          <div class="carousel-inner" style="opacity: 0.6; height: 150px; width: 200px;">
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
            <%include file="pyconca:templates/sponsors/crs.mako" args="img_class='black-and-white'"/>
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
            <%include file="pyconca:templates/sponsors/mozilla.mako" args="img_class='black-and-white'"/>
            </div>

            <div class="item">
            <%include file="pyconca:templates/sponsors/agendaless.mako" args="img_class='black-and-white'"/>
            </div>

            <div class="item">
            <%include file="pyconca:templates/sponsors/heroku.mako" args="img_class='black-and-white'"/>
            </div>

            <div class="item">
            <%include file="pyconca:templates/sponsors/trapeze.mako" args="img_class='black-and-white'"/>
            </div>

            <div class="item">
            <%include file="pyconca:templates/sponsors/guru_link.mako" args="img_class='black-and-white'"/>
            </div>

            <div class="item">
            <%include file="pyconca:templates/sponsors/vmfarms.mako" args="img_class='black-and-white'"/>
            </div>

            <div class="item">
            <%include file="pyconca:templates/sponsors/llc.mako" args="img_class='black-and-white'"/>
            </div>

            <div class="item">
            <%include file="pyconca:templates/sponsors/element34.mako" args="img_class='black-and-white'"/>
            </div>

            <div class="item">
            <%include file="pyconca:templates/sponsors/danols.mako" args="img_class='black-and-white'"/>
            </div>

            <div class="item">
            <%include file="pyconca:templates/sponsors/albert_oconnor.mako" args="img_class='black-and-white'"/>
            </div>

          </div>
        </div>
      </div>

      <div class="span7">
      </div>

    </div>

  </div>
</div>

<div class="main-info">

<div class="row-odd row-fluid">
  <div class="span12 main-row">
    <div class="circle">
       ${_("About")}
    </div>

    <p><%block filter="gettext">INDEX_ABOUT_BLURB</%block></p>

    <div class="pull-right">
      <a href="${request.application_url}/about" class="btn">${_(u"More >>")}></a>
    </div>
    <div class="clearfix"></div>
  </div>
</div>

<div class="row-even row-fluid">
  <div class="span12 main-row">
    <div class="circle">
      ${_(u"Speak")}
    </div>

    <p><%block filter="gettext">INDEX_SPEAK_BLURB</%block></p>

    <div>
      <a href="${request.application_url}/speakers" class="btn">${_(u"More >>")}</a>
    </div>
  </div>
</div>

<div class="row-odd row-fluid">
  <div class="span12 main-row">
    <div class="circle">
      ${_("Learn")}
    </div>

    <p><%block filter="gettext">INDEX_LEARN_BLURB</%block></p>

    <div class="pull-right">
      <a href="${request.application_url}/learn" class="btn">${_("More >>")}</a>
    </div>
    <div class="clearfix"></div>
  </div>
</div>

<div class="row-even row-fluid">
  <div class="span12 main-row">
    <div class="circle">
      ${_(u"Venue")}
    </div>

    <p><%block filter="gettext">INDEX_VENUE_BLURB</%block></p>

    <div>
      <a href="${request.application_url}/venue" class="btn">${_(u"More >>")}</a>
    </div>
  </div>
</div>

<div class="row-odd row-fluid">
  <div class="span12 main-row">
    <div class="circle">
      ${_(u"Schedule")}
    </div>

    <p><%block filter="gettext">INDEX_SCHEDULE_BLURB</%block></p>

    <div class="pull-right">
      <a href="${request.application_url}/schedule" class="btn">${_(u"More >>")}</a>
    </div>
    <div class="clearfix"></div>
  </div>
</div>

<div class="row-even row-fluid">
  <div class="span12 main-row">
    <div class="circle">
        ${_("Sponsors")}
    </div>

    <p><%block filter="gettext">INDEX_SPONSORS_BLURB</%block></p>

    <div>
      <a href="${request.application_url}/sponsors" class="btn">${_("More >>")}</a>
    </div>
    <div class="clearfix"></div>
  </div>
</div>

</div>

<script>
    $(function() {
      $('.carousel').carousel({interval: 2500});
    });
</script>

<script type="text/javascript"
        src="http://guestlistapp.com/javascripts/guestlist-embed.js">
</script>

</%block>
