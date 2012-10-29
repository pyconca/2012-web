<%inherit file="event.mako"/>

<%block name="head_title" filter="gettext">Silver Sponsor • Wave</%block>
<%block name="body_class">about-section</%block>
<%block name="title" filter="gettext">Silver Sponsor • Wave</%block>

<%block name="info">
  <article>
    <h2>${_("Kirk Simpson, CEO Wave")}</h2>

<img src="${request.static_url("pyconca:static/sponsors/KirkSimpson.jpeg")}"
     alt="Kirk Simpson, CEO Wave", 
     height="300" 
     align="left" 
     style="margin-right: 20px;">

<h3>
Tell me about you and your cofounders. 
How did you meet? How did you decide to found Wave?
</h3>

<p>
I’ve known co-founder James Lochrie for 15 years. We originally connected 
through our wives, who went to university together. 

The two of us had a lot of fun and got along well, and had discussed 
starting a business together for a while. 

When we stumbled on this massive market with a clear pain point, we felt 
like we were uniquely qualified to solve it. 

James had 16 years in small business tax and I had felt the pain myself 
as a small business owner. We decided to go after it.
</p>

<p>
I can happily report that James and I are closer now then when we started 
<a href="http://waveaccounting.com/">Wave</a>. 
It’s risky going into business with a friend, but in our case, our 
respect for each other has grown.
</p>

<h3>
What other companies have you founded? 
How did that experience help you at Wave?
</h3>

<p>
When I was in my early 20’s I dropped out of university to start
AdventureLifestyle.com. It was an amazing experience – an MBA the hard way. 
Later I helped start a company called Outdoorsica.
</p>

<p>
These experiences taught me a valuable lesson — you can’t do things part-time 
and expect success. I applied this lesson at Wave, and when we started we 
made it a priority to move quickly to a place where everyone was full-time 
and committed to what we were trying to achieve. It made mortgage payments 
tough but it led to a lot of buy-in and commitment.
</p>

<h3>Why did you choose to start a company in Toronto?</h3>

<p>
My roots are in Toronto, and I’m passionate about inspiring this community 
to aim to build massive, game-changing companies. I want to help the 
entrepreneurial community and at the same time inspire other Torontonians 
to realize they can push harder, change the industry, and dream a lot 
bigger than they’ve been taught to dream.
</p>

<p>
In Canada, we’ve been taught to be humble, to be polite, and to be 
realistic. It’s time to change our definition of realistic and aim bigger. 
We need to swing for the fences and adopt a Silicon Valley mentality in 
this city.
</p>

<a href="http://waveaccounting.com/" style="border-bottom: none;">
    <img src="${request.static_url("pyconca:static/sponsors/wave.png")}"
         width="300" align="right" alt="Wave">
</a>

<h3>In your own words, what is Wave's mission?</h3>

<p>
Our mission at Wave is to liberate you and your small business. We’re here 
to take away the back-office tasks that stress you out and suck up all of 
your time, whatever those things happen to be for you. Wave exists to give 
you back your time so you can focus on making your business successful.
</p>


<h3>
What do you see as your biggest technological challenges in the next 1-2 years?
</h3>

<p>
Understanding the dramatic shift to mobile and how we can be at the forefront.
</p>

<h3>
Tell us a bit about the technologies / platform you're using now.
</h3>

<p>
Wave operates with a diverse development system. Our systems are predominantly
in Python and Django, but also in Ruby on Rails. We communicate between systems
using a versatile RPC layer written in Python (that we plan on open sourcing). This
supports multiple transport layers (including HTTP and AMQP) and multiple cross-
language serializers. We also use Python to develop machine-learning algorithms to
aid in categorization.
</p>

<h3>
Why did you choose to sponsor PyCon Canada?
</h3>

<p>
We chose to sponsor PyCon for two reasons. Primarily, we believe strongly in
supporting the tech and startup communities in Toronto. Secondly, Wave employees
are highly active in the tech community, and it’s important to us to support
initiatives our employees are passionate about. We frequently hold tech and startup
events in our office, and Wave employees can be seen attending events throughout
Canada.
</p>

<h3>
What other things are you passionate about besides your mission at Wave?
</h3>

<p>
I’m passionate about coming to the office each day and getting to work with this
team. We’re working hard, having fun and laughing a lot along the way. That’s really
important to me.
</p>

<p>
Outside of Wave I’m passionate about my young family. Jack is seven, Avery is five
and Myles, my youngest, is two. They’re a handful but help me to keep things in
perspective. As they grow older I’m excited to spend more time with them doing
another thing I love - sailing.
</p>

</article>
</%block>
