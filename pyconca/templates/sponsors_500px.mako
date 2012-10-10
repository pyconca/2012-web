<%inherit file="event.mako"/>

<%block name="head_title" filter="gettext">Gold Sponsor • 500px</%block>
<%block name="body_class">about-section</%block>
<%block name="title" filter="gettext">Gold Sponsor • 500px</%block>

<%block name="info">
  <article>
    <h2>${_("Oleg Gutsol, CEO 500px")}</h2>

<img src="${request.static_url("pyconca:static/sponsors/oleg.jpg")}"
     alt="Oleg Gutsol, CEO 500px", 
     height="300" 
     align="left" 
     style="margin-right: 20px;">

<h3>
Tell me about you and your cofounders. 
How did you meet? How did you decide to found 500px?
</h3>

<p>
<a href="http://500px.com/">500px</a> was launched in late 2009 by me and 
Evgeny Tchebotarev. 

The idea goes back to 2004, though, when we launched a blog dedicated to the 
best photography in the world.

At the time, one of the requirements for the photos was a width of 500 pixels,
hence the name.

That requirement has since been dropped, but we kept the name 500px because
it came to be known as <i>the</i> place for great photography.
</p>

<p>
Evgeny and I met in Toronto, quite a while ago, and connected through a
common interest in motorcycles.
</p>

<h3>
What other companies have you founded? 
How did that experience help you at 500px?
</h3>

<p>
Evgeny was hired as the CEO at a Moscow startup called Temarium, which
was a blogging platform. 

Unfortunately, it has since shutdown. 

While studying at Ryerson, I founded GSM Toronto, an online marketplace for 
mobile phones. 

I also got out of that business after my co-founder left the company.
</p>

<p>
I think both of us sort of always knew that we would not be able to
work for someone else or some large corporation, so we had to start
something ourselves. So we did : )
</p>

<h3>Why did you choose to start a company in Toronto?</h3>

<p>
We both lived in Toronto, so we didn't really choose. 

Although in the early days, we considered moving to some place warm and 
cheap - Thailand was the one we discussed - but decided against it.
</p>

<a href="http://500px.com/" style="border-bottom: none;">
    <img src="${request.static_url("pyconca:static/sponsors/500px_logo_color.png")}"
         height="175" align="right" alt="500px">
</a>

<h3>In your own words, what is 500px's mission?</h3>

<p>
500px's mission is to the create the highest quality online photography 
platform in the world.
</p>


<h3>
What do you see as your biggest technological challenges in the next 1-2 years?
</h3>

<p>
I think scalability will always be our biggest challenge: data storage, 
real time retrieval and processing. 

Also, we are looking to address problems like image recognition, 
recommendations, discovery and popularity algorithms.
</p>

<h3>
Tell us a bit about the technologies / platform you're using now.
</h3>

<p>
We are using lots of different things, among them: Ruby, Python, 
Java, Objective-C, Lua, MySQL, MongoDB, Redis, Memcache. Also, we plan to use 
Riak and Hadoop in the future.
</p>

<h3>
Why did you choose to sponsor PyCon Canada?
</h3>

<p>
Because we are a company that uses Python technology, we want to be an active 
member of the Python community in Canada. 

Also, <a href="http://500px.com/jobs">we are looking for great developers</a>,
so PyCon Canada is a great opportunity to connect with the great Python devs.
</p>

<h3>
What other things are you passionate about besides your mission at 500px?
</h3>

<p>
Personally, I am passionate about psychology and creating excellent user 
experiences. I also like things like motorcycles and snowboarding : )
</p>

</article>
</%block>
