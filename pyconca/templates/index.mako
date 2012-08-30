<%inherit file="base.mako"/>
<%block name="content">

<div class="row-fluid main-header-image">
  <div class="span12">

    <div class="row-fluid">
      <br>
    </div>

    <div class="row-fluid">
      <div class="span12 top-row main-row overlay">
        <h1 class="header-main-text">PyCon Canada</h1>
        <h2 class="header-sub-text">Toronto, November 9th - 11th 2012</h2>
        <br />
        <div class="visible-desktop">
            <a href="http://guestlistapp.com/events/116013" class="btn btn-warning btn-large guestlist-event-116013">Register</a>
            <a href="${request.application_url}/sponsors" class="btn btn-large">Sponsor</a>
        </div>
        <div class="hidden-desktop">
            <a href="http://guestlistapp.com/events/116013" class="btn btn-warning btn-large">Register</a>
            <a href="${request.application_url}/sponsors" class="btn btn-large">Sponsor</a>
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
          <h6>Sponsors</h6>
          <div class="carousel-inner" style="opacity: 0.6; height: 100px;">

            <div class="active item">
              <a href="http://500px.com/">
                <img src="${request.static_url("pyconca:static/500px_logo_color.png")}"
                     width="200px;" height="100px;" class="black-and-white" alt="">
              </a>
            </div>

            <div class="item">
             <a href="http://www.freshbooks.com/">
                <img src="${request.static_url("pyconca:static/freshbooks.gif")}"
                  width="200px;" height="100px;" class="black-and-white" alt="">
             </a>
            </div>

            <div class="item">
              <a href="http://waveaccounting.com/">
                <img src="${request.static_url("pyconca:static/thumb-logo-wave-accounting.png")}"
                     class="black-and-white" alt="">
              </a>
            </div>

            <div class="item">
              <a href="http://www.python.org/psf/">
                <img src="${request.static_url("pyconca:static/psf-logo-317x71-alpha.png")}"
                     width="317px;" height="71px;" class="black-and-white" alt="">
              </a>
            </div>

            <div class="item">
             <a href="http://vmfarms.com/">
                <img src="${request.static_url("pyconca:static/vmfarms-logo.png")}"
                  width="200px;" height="100px;" class="black-and-white" alt="">
             </a>
            </div>
            
            <div class="item">
              <a href="http://heroku.com">
                <img src="${request.static_url("pyconca:static/heroku-logo-light-234x60.png")}"
                     class="black-and-white" alt="">
              </a>
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
    You're invited to a kickoff conference, Nov 9-11 2012, in Toronto, 
    getting us warmed up for the first 
    <a href="http://us.pycon.org/">PyCon North America</a> conference outside the US — 
    <a href="http://www.newswire.ca/en/story/731987/montreal-chosen-to-welcome-over-1-500-python-programmers-for-the-world-s-most-important-conference-on-the-subject/">
    Montréal in 2014 and 2015!</a>
    And when that's done, let's keep the momentum going with an annual PyCon 
    in Canada.
    </p>

    <div class="pull-right">
      <a href="${request.application_url}/about" class="btn">More >></a>
    </div>
    <div class="clearfix"></div>
  </div>
</div>

<div class="row-even row-fluid">
  <div class="span12 main-row">
    <div class="circle">
      Speak
    </div>

    <p>
    Share your knowledge and cool ideas. Submit your proposal for a talk or 
    tutorial by October 1st to organizers@pycon.ca. We'll be sprinting at the 
    conference too, so you can also send us sprint ideas.
    </p>

    <div>
      <a href="${request.application_url}/speakers" class="btn">More >></a>
    </div>
  </div>
</div>

<div class="row-odd row-fluid">
  <div class="span12 main-row">
    <div class="circle">
      Learn
    </div>

    <p>
    One of PyCon Canada's goals is to bring experts from the greater Python 
    community to Canada; giving you the opportunity to be inspired and learn 
    from the best! To get you excited, we'll be announcing our featured 
    speakers, one by one, over the coming weeks. Check them out:
    </p>

    <div class="pull-right">
      <a href="${request.application_url}/learn" class="btn">More >></a>
    </div>
    <div class="clearfix"></div>
  </div>
</div>

<div class="row-even row-fluid">
  <div class="span12 main-row">
    <div class="circle">
      Venue
    </div>

    <p>
    Be there November 9-11, 2012 at Beverley Halls in downtown Toronto. A short 
    walk from the subway, so when you aren't busy coding or chatting with your 
    colleagues you've got lots of stuff to explore nearby.
    </p>

    <div>
      <a href="${request.application_url}/venue" class="btn">More >></a>
    </div>
  </div>
</div>

<div class="row-odd row-fluid">
  <div class="span12 main-row">
    <div class="circle">
      Schedule
    </div>

    <p>
    Start the fun Friday evening with a mix and mingle. Feed your brain at 
    talks on Saturday, and if your sprint team is eager, you can start that 
    night. Sprint or attend talks and tutorials on Sunday.
    </p>

    <div class="pull-right">
      <a href="${request.application_url}/schedule" class="btn">More >></a>
    </div>
    <div class="clearfix"></div>
  </div>
</div>

<div class="row-even row-fluid">
  <div class="span12 main-row">
    <div class="circle">
        Sponsors
    </div>

    <p>
    Support the Canadian Python community and get recognition, promotion, and 
    good karma for helping to increase the expertise and visibility of 
    developers across Canada. Various sponsorship options are available.
    </p>

    <div class="pull-right">
      <a href="${request.application_url}/sponsors" class="btn">More >></a>
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

<script type="text/javascript"
        src="http://guestlistapp.com/javascripts/guestlist-embed.js">
</script>

</%block>
