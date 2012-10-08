<%inherit file="event.mako"/>

<%block name="head_title" filter="gettext">Silver Sponsor • FreshBooks</%block>
<%block name="body_class">about-section</%block>
<%block name="title" filter="gettext">Silver Sponsor • FreshBooks</%block>

<%block name="info">
  <article>
    <h2>${_("Mike McDerment, CEO FreshBooks")}</h2>

<img src="${request.static_url("pyconca:static/sponsors/mike.jpeg")}"
     alt="Mike McDerment, CEO FreshBooks", 
     height="275" 
     align="left" 
     style="margin-right: 20px;">

<h3>
Tell me about you and your cofounders. How did you meet? 
How did you decide to found FreshBooks?
</h3>

<p>
I have two co-founders, Joe and Levi. I met Joe on a dark and cold Canadian 
night, playing disc golf in January. Joe opened up the door to do some work 
together and I ended up calling him a week later to do some contract work for 
my design firm. He introduced me to Levi and, about a year later, Levi quit 
his job and he and I basically did FreshBooks full time.
</p>

<h3>
What other companies have you founded? How did that experience help
you at FreshBooks?
</h3>

<p>
I started a few other businesses, including a small sports league - a truly 
ambitious sporting event that ran annually. I've run a design consultancy, 
and after founding FreshBooks, a conference called Mesh.
</p>
 
<p>
The consulting business is the one that impacted FreshBooks the most because 
that’s where I learned how to do internet marketing. It also taught me how to 
work in a sustainable way because, left to my own devices, I would not stop 
working. I had to teach myself the importance of taking breaks and 
separating my work life and my personal life, and that’s proved invaluable 
in the ten years that we’ve been doing FreshBooks because I could have easily 
burnt myself out a long time ago.
</p>

<h3>Why did you choose to start a company in Toronto?</h3>

<p>
We started FreshBooks in Toronto because that’s where we're living. 
My family’s here. It’s a great place to be; there are lots of universities 
and lots of smart people. 
</p>

<a href="http://FreshBooks.com/" style="border-bottom: none;">
    <img src="${request.static_url("pyconca:static/sponsors/freshbooks.png")}"
         height="125" align="right" alt="FreshBooks">
</a>

<h3>In your own words, what is FreshBooks's mission?</h3>

<p>
I’m going to give you both a vision and a mission. Our vision is to execute 
on extraordinary experiences every day for small business owners because 
they deserve it and we believe it’s the right thing to do.
</p>
 
<p>
Our mission is that all small business owners everywhere use FreshBooks 
to run their business better so they can focus on what they love to do.  
<strong>In the process, we are going to build a world class global technology 
from Toronto.</strong>
</p>

<h3>
Tell us a bit about the technologies / platform you're using now.
</h3>

<p>
FreshBooks is built on a mix of PHP, Python and Javascript, using 
open-source frameworks like Flask, Pylons, JQuery and Twig. We have a 
custom data access layer built in Python that operates via HTTP and we 
use a RabbitMQ messaging queue for asynchronous operations. Our database 
is MySQL/Percona and the whole thing runs on Linux.
</p>

<h3>
What do you see as your biggest technological challenges in the next 1-2 years?
</h3>

<p>
<a href="http://www.freshbooks.com/careers/">Hiring</a>. 
FreshBooks is a rapidly growing company in Toronto. We have 
figured out how to do things, like process 10 million events in a day, 
through our technology and now our challenge is how to continue to hire 
world-class engineers. The fact is, the best people only want to work with 
the best people, so we want to continue finding the best people and have 
them join the team. That’s really hard, but really rewarding when we find 
them and exciting for the people who get to join FreshBooks.
</p>

<h3>
Why did you choose to sponsor PyCon Canada?
</h3>

<p>
It’s really important for FreshBooks to give back to the community. We’ve 
had this wonderful opportunity to build our business on these amazing open 
source technologies, of which Python is one. FreshBooks recognizes this 
amazing open source opportunity and we want to ensure that the Python 
community remains strong and that the technologies advance for the good 
of everyone.
</p>
 
<p>
We’ve made various contributions to Python and this is our fourth year 
at PyCon. We find that attending PyCon and meeting people to be extremely 
rewarding. We at FreshBooks are grateful to be able to help sponsor PyCon 
Canada because we believe in supporting, developing and contributing to 
open source projects. Python is a big part of our future and we’re c
omitted to our continuing support of Python and its communities.
</p>

<h3>
What other things are you passionate about besides your mission at FreshBooks?
</h3>

<p>
I’m quite passionate about seeing Canada – more specifically Toronto - 
in order to be better recognized as technology leaders and to put Canada 
on the technology world stage. That’s been my whole reason for co-founding 
the <a href="http://meshconference.com/">Mesh Conference</a>. 
The point of Mesh is to get smart people together 
and get them organized around what’s next. FreshBooks is aiming to be a 
pillar in the community and leading example of how to build a global 
technology company in Toronto.
</p>

</article>
</%block>
