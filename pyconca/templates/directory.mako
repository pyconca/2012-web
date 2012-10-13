<%inherit file="event.mako"/>

<%block name="head_title">${_("Independent Sponsors")}</%block>
<%block name="body_class">sponsors-section</%block>
<%block name="title">${_("Independent Sponsors")}</%block>

<%block name="info">
  <article>
    <h2>Element 34</h2>
    <a href="http://element34.ca" style="border-bottom: none;">
        <img src="${request.static_url("pyconca:static/sponsors/e34-logo_sm.png")}"
            height="100"
            align="left"
            style="margin: 20px;"
            alt="Element 34">
    </a>
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
  </article>

  <article>
    <h2>Kingston Web Design</h2>
    <a href="http://webdesign.danols.com/" style="border-bottom: none;">
        <img src="${request.static_url("pyconca:static/sponsors/danols-web-engineering-logo-square_reasonably_small_sm.png")}"
             height="100"
             align="left"
             style="margin: 20px;"
             alt="Kingston Web Design">
    </a>
    <p>
     <a href="http://webdesign.danols.com/">Danols Web Engineering</a>: 
     Delivering your ideas out of realm of possibility into reality.
    </p>
    <p>
     From entry web site presence to multinational e-commerce site, the next 
     social craze or a viral app; it will be built, it will be web engineered, 
     they will come and you will prosper.
    </p>
  </article>

  <article>
    <h2>Albert O'Connor Web Developer</h2>
    <a href="http://albertoconnor.ca/" style="border-bottom: none;">
        <img src="${request.static_url("pyconca:static/sponsors/albertoconnor_logo_sm.png")}"
             width="250"
             align="left"
             style="margin: 20px;"
             alt="Albert O'Connor Web Developer">
    </a>
    <p>
     Albert O'Connor, python/django web 
     <a href="http://albertoconnor.ca/projects/">consultant</a>, 
     co-founder of the <a href="http://watpy.ca/">Waterloo Region Python Group</a>, and 
     founder of <a href="http://wildernesslabs.ca/">Wilderness Labs</a>: 
     Bringing together awesome people for a weekend of collaborative creation.
  </article>
</%block>
