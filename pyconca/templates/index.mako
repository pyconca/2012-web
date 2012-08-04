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
        <a href="#" class="btn btn-warning btn-large">Register</a>
        <a href="#" class="btn btn-large">Sponsor</a>
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
        <div id="myCarousel" class="carousel slide">
          <h6>Sponsors</h6>
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

<div id="about-row" class="row-fluid">
  <div class="span12 main-row">
    <div class="circle">
       About
    </div>

    <p>
    You're invited to a kickoff conference, getting us warmed up for the first 
    PyCon outside the US—Montréal in 2014 and 2015! And when that's done, we 
    want to keep the momentum going to maintain a vibrant community.
    </p>

    <div class="pull-right">
      <a href="${request.application_url}/about" class="btn">More >></a>
    </div>
  </div>
</div>

<div id="speakers-row" class="row-fluid">
  <div class="span12 main-row">
    <div class="circle">
      Speakers
    </div>

    <p>
    Share your knowledge and cool ideas. Submit your proposal for a talk or 
    tutorial by October 1st to organizers@pycon.ca. We'll be sprinting at the 
    conference too, so you can also send us sprint ideas.
    </p>

    <div>
      <a href="${request.application_url}/about" class="btn">More >></a>
    </div>
  </div>
</div>

<div id="sponsors-row" class="row-fluid">
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
      <a href="${request.application_url}/about" class="btn">More >></a>
    </div>
  </div>
</div>

<div id="venue-row" class="row-fluid">
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

<div id="schedule-row" class="row-fluid">
  <div class="span12 main-row">
    <div class="circle">
      Schedule
    </div>

    <p>
    Start the fun Friday evening with a mix and mingle. Feed your brain at 
    talks on Saturday, and if your sprint team is eager, you can start that 
    night. Code with the sprinters or attend tutorials on Sunday.
    </p>

    <div class="pull-right">
      <a href="${request.application_url}/about" class="btn">More >></a>
    </div>
  </div>
</div>

</div>

<script>
    $(function() {
      $('.carousel').carousel();
    });
</script>

</%block>
