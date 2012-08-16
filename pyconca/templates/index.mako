<%inherit file="base.mako"/>
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
        <br />
        <a href="http://guestlistapp.com/events/116013" class="btn btn-warning btn-large guestlist-event-116013">${_(u"Register")}</a>
        <a href="${request.application_url}/sponsors" class="btn btn-large">${_(u"Sponsor")}</a>
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
          <h6>${_(u"Sponsors")}</h6>
          <div class="carousel-inner" style="opacity: 0.6;">
            <div class="active item">
             <img src="${request.static_url("pyconca:static/vmfarms-logo.png")}"
                  width="200px;" height="100px;" class="black-and-white" alt="">
            </div>
            <div class="item">
             <img src="${request.static_url("pyconca:static/freshbooks.gif")}"
                  width="200px;" height="100px;" class="black-and-white" alt="">
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
       About
    </div>

    <p>
    ${_(u"You're invited to a kickoff conference, getting us warmed up for the first"
    u"<ua href='http://us.pycon.org/'>PyCon North America</a> conference outside the US -"
    u"<a href='http://www.villagegamer.net/2011/04/11/montreal-looking-forward-to-hosting-pycon/'>"
    u"Montreal in 2014 and 2015!</a>"
    u"And when that's done, let's keep the momentum going with an annual PyCon"
    u"in Canada.")}
    </p>

    <div class="pull-right">
      <a href="${request.application_url}/about" class="btn">${_(u"More >")}></a>
    </div>
    <div class="clearfix"></div>
  </div>
</div>

<div class="row-even row-fluid">
  <div class="span12 main-row">
    <div class="circle">
      ${_(u"Speakers")}
    </div>

    <p>
    ${_(u"Share your knowledge and cool ideas. Submit your proposal for a talk or"
    "tutorial by October 1st to organizers@pycon.ca. We'll be sprinting at the"
    "conference too, so you can also send us sprint ideas.")}
    </p>

    <div>
      <a href="${request.application_url}/speakers" class="btn">${_(u"More >>")}</a>
    </div>
  </div>
</div>

<div class="row-odd row-fluid">
  <div class="span12 main-row">
    <div class="circle">
        ${_(u"Sponsors")}
    </div>

    <p>
    ${_(u"Support the Canadian Python community and get recognition, promotion, and"
    u"good karma for helping to increase the expertise and visibility of"
    u"developers across Canada. Various sponsorship options are available.")}
    </p>

    <div class="pull-right">
      <a href="${request.application_url}/sponsors" class="btn">${_(u"More >>")}</a>
    </div>
    <div class="clearfix"></div>
  </div>
</div>

<div class="row-even row-fluid">
  <div class="span12 main-row">
    <div class="circle">
      ${_(u"Venue")}
    </div>

    <p>
    ${_(u"Be there November 9-11, 2012 at Beverley Halls in downtown Toronto. A short"
    u"walk from the subway, so when you aren't busy coding or chatting with your"
    u"colleagues you've got lots of stuff to explore nearby.")}
    </p>

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

    <p>
    ${_(u"Start the fun Friday evening with a mix and mingle. Feed your brain at"
    u"talks on Saturday, and if your sprint team is eager, you can start that"
    u"night. Sprint or attend talks and tutorials on Sunday.")}
    </p>

    <div class="pull-right">
      <a href="${request.application_url}/schedule" class="btn">${_(u"More >>")}</a>
    </div>
    <div class="clearfix"></div>
  </div>
</div>

</div>

<script>
    $(function() {
      $('.carousel').carousel();
    });
</script>

<script type="text/javascript" src="http://guestlistapp.com/javascripts/guestlist-embed.js"></script>

</%block>
