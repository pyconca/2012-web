<%inherit file="base.mako"/>

<%block name="content">

  <div class="row-fluid row-top">

    <div class="span3 logo">
      <img height="220" width="220" 
        src="${request.static_url('pyconca:static/pyconlogo.png')}" 
        alt="PyCon Canada Logo">
    </div>

    <div class="span9 headline">
      <h1>
        Working together to showcase Canadian talent at 
        PyCon in Montréal in 2014 and 2015.
      </h1>
    </div>
  </div>

  <div class="row-fluid row-feature">

    <div class="feature-left">

      <h1>
        Interested in speaking at PyCon Canada 2012?
      </h1>

      <p>
        This year's event with be held during the 
        <strong>first weekend of October</strong>. 
        The location is TBA. 
      </p>

      <p>
        The submission deadline is <strong>June 1st,
        2012</strong>.
      </p>
    </div>

    <img height="331" width="500"
      class="feature-img"
      src="${request.static_url('pyconca:static/csi-main.jpg')}"
      alt="CSI main floor">
  </div>

  <div class="row-fluid row-content">
    <div class="span9">
      <div class="row-fluid">

        <div class="span6 join-us">
          <h2>Join Us</h2>
          <p>
            Be a part of the fun! Developer or not, there are 
            lots of ways you can help, from PyCon Canada 
            planning and coordination to developing and 
            maintaining this web site. It's a great way to 
            learn, share knowledge, and network with others 
            across Canada.
          </p>
        </div>

        <div class="span6 sponsor-us">
          <h2>Sponsor Us</h2>

          <p>
            PyCon Canada is a volunteer effort. 
            We'll need spaces to practice presentations, and 
            help to cover costs such as web hosting for the 
            PyCon Canada site. Show your support, and we'll 
            promote your company here!
          </p>
        </div>
      </div>
    </div>

    <div class="span3 contact-us">

      <h2>Contact Us</h2>

      <dl class="contact-info">
        <dt>Twitter</dt>
        <dd><a href="https://twitter.com/pyconca">@pyconca</a></dd>

        <dt>Email</dt>
        <dd>pyconca at gmail dot com</dd>

        <dt>Github</dt>
        <dd><a href="https://github.com/pyconca">https://github.com/pyconca</a></dd>
      </dl>
    </div>

  </div> <!-- row-content -->

</%block>

