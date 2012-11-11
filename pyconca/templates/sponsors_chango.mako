<%inherit file="event.mako"/>

<%block name="head_title" filter="gettext">Silver Sponsor • Chango</%block>
<%block name="body_class">about-section</%block>
<%block name="title" filter="gettext">Silver Sponsor • Chango</%block>

<%block name="info">
  <article>
    <h2>${_("Mazdak Rezvani, CTO Chango")}</h2>

<img src="${request.static_url("pyconca:static/sponsors/mazdak.jpg")}"
     alt="Mazdak Rezvani, CTO Chango"
     height="350" 
     align="left" 
     style="margin-right: 20px;">

<h3>
Tell me about you and your cofounders. How did you meet? 
How did you decide to found Chango?
</h3>

<p>
<a href="http://www.chango.com/about/meet-chango/bios/">Chris Sukornyk</a>
founded Chango in 2008. Chris and I were co-founders of a
photo-sharing startup called BubbleShare back in 2005. After selling
BubbleShare to Kaboose, we went our separate ways for a couple of
years and then reunited back in 2010. We were fortunate to hook into
an idea that has subsequently changed how advertising is purchased
online.  The concept of real-time bidding (RTB) has allowed companies
like Chango to create new powerful solutions, like search
retargeting, for marketers.
</p>

<h3>
What other companies have you founded? How did that experience help
you at Chango?
</h3>

<p>
Chris Sukornyk founded or co-founded a number of other tech
companies including BubbleShare, Fivelimes &amp; X-Stream.  Chris and I
were co-founders at BubbleShare. I was the "co-founder" of the Toronto
chapter of Tall Tree Games, a top 20 Facebook game developer. There
have been too many other little experiments to list here! Every
experience is different and every one teaches you something new about
yourself and how to setup the next business. It sounds cliche, but I
think the biggest lesson is to listen to your customers and make sure
you have a solution rather than a piece of technology.  It's easy to
get enamoured by a new technology, but you have to make sure it solves
a real customer problem.
</p>

<h3>Why did you choose to start a company in Toronto?</h3>

<p>
Toronto's is a great place to launch a startup.  From a lifestyle
point of view, it's a great city to live and raise a family.  I
think that Toronto's diversity gives you a more worldly view - which
translates into products and solutions that are suited for the world
stage.  Access to talent and government support are other benefits of
locating in Toronto.   And, of course, you can't ignore the benefits of
our maple syrup powered, igloo-cooled server farms!
</p>

<a href="http://Chango.com/" style="border-bottom: none;">
    <img src="${request.static_url("pyconca:static/sponsors/chango.png")}"
         height="90" align="right" alt="Chango">
</a>

<h3>In your own words, what is Chango's mission?</h3>

<p>
Chango's mission is to help marketers succeed in a world where advertising and decisions
happen in real-time.  Gone are the days of running a marketing plan
and then waiting a few months to see if it worked.   The future of
marketing will increasingly rely on processing huge quantities of data
in real-time.  I see a day, not too far in the future, where marketing
campaigns are literally programmed - and that marketing campaigns and
tactics are seen as intellectual property and integral to the
success of a company.
</p>


<h3>
What do you see as your biggest technological challenges in the next 1-2 years?
</h3>

<p>
I'd say the largest challenge is to pour over huge quantities of data,
looking for a strong signal that indicates a valuable audience or
opportunity.  Processing large volumes of data isn't necessarily a new
thing - large super computers are doing it all the time.  However, our
challenge is to process data in near real-time while keeping the costs
down.
</p>

<h3>
Tell us a bit about the technologies / platform you're using now.
</h3>

<p>
We're almost entirely Python based. We use a lot of Open Source
technologies to power our infrastructure, along with top-of-the-line
commercial products that help us achieve our crazy scale of 300,000
requests per second! Our real challenge is that we're pushing the
limits of what Python can do because of the real time nature of the
product. That said, we keep on coming up with innovative architectures
and ideas that push a vanilla Python 2.7 installation to new limits.
</p>

<h3>
Why did you choose to sponsor PyCon Canada?
</h3>

<p>
We love Python. We love to support the Python community in Toronto and
give back to the language and community that has provided a ton of
great tools and libraries that help us run our business. We've
released our own "big data" processing library, called 
<a href="https://inferno.readthedocs.org/en/latest/index.html">Inferno</a>, 
to the Open Source community as well.</p>

<h3>
What other things are you passionate about besides your mission at Chango?
</h3>

<p>
Lots - I am a film buff who wishes he had more time to attend the
Toronto Film Festival. I am also an an avid buyer of Apple products.
Chris, our CEO, is currently playing around 3D printing.  Hype aside -
it's pretty amazing what you can create and print in 3D these days.
We've been experimenting with great services like 
<a href="http://www.shapeways.com/">shapeways.com</a>.
</p>

</article>
</%block>
