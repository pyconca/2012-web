<%inherit file="base.mako"/>
<%block name="content">

<div class="row-fluid main-header-image">
  <div class="span12">

    <div class="row-fluid">
      <div class="span12 top-row main-row overlay">
        <h1 class="header-main-text">PyCon Canada</h1>
        <h2>Toronto, November 9th - 11th 2012</h2>
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

<div id="about-row" class="row-fluid">
  <div class="span12 main-row">
    <div class="circle">
       About
    </div>

    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <div class="pull-right">
      <a href="${request.application_url}/about" class="btn btn-inverse">More >></a>
    </div>
  </div>
</div>

<div id="speakers-row" class="row-fluid">
  <div class="span12 main-row">
    <div class="circle">
      Speakers
    </div>

    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
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
Beef jowl turducken id, proident elit incididunt rump cillum pastrami pork loin shank shankle et salami. Dolor shoulder incididunt kielbasa. Tail ea do, meatball reprehenderit ut ham hock elit fatback anim deserunt chuck sausage tenderloin. Cow tenderloin short loin jerky fugiat filet mignon andouille sausage ground round beef ribs.
    </p>

    <p>
Incididunt beef culpa, irure pork dolore andouille velit anim drumstick ut. Aliquip exercitation cow pig turkey elit irure. Salami spare ribs strip steak velit labore ad rump sunt dolor reprehenderit in nulla magna t-bone. Excepteur dolore tempor laborum flank jowl consectetur venison. Jowl fugiat swine, nostrud turducken turkey veniam dolor prosciutto proident tenderloin pork chop leberkas dolore. Dolore pig officia eu, prosciutto dolore labore shank spare ribs. Quis tenderloin enim, commodo t-bone ea do labore ut voluptate reprehenderit.
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
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
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
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Maecenas luctus leo ut urna egestas tempor. 
      Mauris volutpat vehicula arcu, ut feugiat diam consequat vitae. 
      Vestibulum ac arcu id justo tristique adipiscing.
    </p>
    <div class="pull-right">
      <a href="${request.application_url}/about" class="btn btn-inverse">More >></a>
    </div>
  </div>
</div>

<script>
    $(function() {
      $('.carousel').carousel();
    });
</script>

</%block>
