<%inherit file="event.mako"/>

<%block name="head_title">${_("Independent Sponsors")}</%block>
<%block name="body_class">sponsors-section</%block>
<%block name="title">${_("Independent Sponsors")}</%block>

<%block name="info">
  <article>
    <h2>Element 34</h2>
    <div class="row-fluid">
     <div class="span4">
        <a href="http://element34.ca" style="border-bottom: none;">
            <img src="${request.static_url("pyconca:static/sponsors/e34-logo_sm.png")}"
                height="100"
                align="left"
                style="margin: 20px;"
                alt="Element 34">
        </a>
     </div>
     <div class="span8">
      <p>
      <a href="http://element34.ca">Element 34</a> 
      provides Selenium/WebDriver and custom test automation in 
      Python [and PHP and Ruby] with a dab of Continuous Delivery and training 
      for testers new to programming / automation thrown in for good measure.
      </p>
      <p>
      Adam Goucher is the creator of the Open Source 
      <a href="http://element34.ca/products/saunter">Saunter</a> 
      automation framework, maintainer of PHP-WebDriver and former maintainer 
      of Selenium-IDE.
      </p>
     </div>
    </div>
  </article>

  <article>
    <h2>Kingston Web Design</h2>
    <div class="row-fluid">
      <div class="span4">
        <a href="http://webdesign.danols.com/" style="border-bottom: none;">
            <img src="${request.static_url("pyconca:static/sponsors/danols-web-engineering-logo-square_reasonably_small_sm.png")}"
                 height="100"
                 align="left"
                 style="margin: 20px;"
                 alt="Kingston Web Design">
        </a>
      </div>
      <div class="span8">
       <p>
       <a href="http://webdesign.danols.com/">Danols Web Engineering</a>: 
       Delivering your ideas out of realm of possibility into reality.
       </p>
       <p>
       From entry web site presence to multinational e-commerce site, the next 
       social craze or a viral app; it will be built, it will be web engineered, 
       they will come and you will prosper.
       </p>
      </div>
    </div>
  </article>

  <article>
    <h2>Albert O'Connor Web Developer</h2>
    <div class="row-fluid">
      <div class="span4">
        <a href="http://albertoconnor.ca/" style="border-bottom: none;">
            <img src="${request.static_url("pyconca:static/sponsors/albertoconnor_logo_sm.png")}"
                 width="200"
                 align="left"
                 style="margin: 20px;"
                 alt="Albert O'Connor Web Developer">
        </a>
      </div>
      <div class="span8">
       <p>
        Albert O'Connor, python/django web 
        <a href="http://albertoconnor.ca/projects/">consultant</a>, 
        co-founder of the <a href="http://watpy.ca/">Waterloo Region 
        Python Group</a>, and founder of 
        <a href="http://wildernesslabs.ca/">Wilderness Labs</a>: 
        Bringing together awesome people for a weekend of collaborative 
        creation.
       </p>
      </div>
    </div>
  </article>

  <article>
    <h2>Amelanche</h2>
    <div class="row-fluid">
     <div class="span4">
        <a href="http://amelanche.com/" style="border-bottom: none;">
            <img src="${request.static_url("pyconca:static/sponsors/amelanche-logo.png")}"
                 width="200"
                 align="left"
                 style="margin: 20px;"
                 alt="Amelanche">
        </a>
     </div>
     <div class="span8">
      <p>
      <a href="http://amelanche.com/">Amelanche</A> is a provider of modeling 
      and computing solutions to the financial sector. Amelanche offers 
      consulting and custom software development for modeling, analytics, 
      pricing and market and credit risk management, combining the expertise 
      in stochastic modeling, numerical methods, high-performance computing 
      and quality software engineering.
      </p>
     </div>
    </div>
   </article>

  <article>
    <h2>Montréal-Python</h2>
    <div class="row-fluid">
     <div class="span4">
        <a href="http://montrealpython.org/" style="border-bottom: none;">
            <img src="${request.static_url("pyconca:static/sponsors/MontrealPythonLogo.png")}"
                 width="175"
                 align="left"
                 style="margin: 20px;"
                 alt="Montréal-Python">
        </a>
    </div>
    <div class="span8">
     <p>
     <a href="http://montrealpython.org/">Montréal-Python</a>, 
     a vibrant Python community started in 2008, is 
     proudly representing over 250 members from all around Québec. 
     Montréal-Python's monthly meetings steadily attract upwards of 60 
     passionate hackers. In addition to presentation-oriented meetings, 
     Montréal-Python propagates Python skills with coding sprints and an 
     ongoing series of tutorials and workshops geared toward university 
     students, and supports other groups and initiatives like PyCon Canada 
     with announcements, translations and participation. But this is all a 
     pale shadow compared to its proudest achievement: bringing PyCon North 
     of the border in 2014 and 2015!
     </p>
    </div>
   </div>
  </article>

  <article>
    <h2>Verso Furniture</h2>
    <div class="row-fluid">
     <div class="span4">
        <a href="http://versofurniture.com">
            <img src="${request.static_url("pyconca:static/sponsors/VersoLogo_27Oct2012.png")}"
                 width="175"
                 align="left"
                 style="margin: 20px;"
                 alt="Verso Furniture">
        </a>
    </div>
    <div class="span8">
     <p>
     <a href="http://versofurniture.com">Verso Furniture</a> is making 
     custom furniture easy and affordable. We are developing an intuitive 
     web-based interface that enables unskilled users to quickly create 
     one-of-a-kind furniture, which is manufactured in our fast, low-cost 
     production systems. Launch is scheduled for 2013, and we are actively 
     seeking to grow our programming team.
     </p>
    </div>
   </div>
  </article>
</%block>
