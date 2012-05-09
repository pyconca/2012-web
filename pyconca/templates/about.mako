<%inherit file="base.mako"/>

<style>
  .about-subheading {
    margin-bottom: 5px;
  }

  .about-content h2 {
    margin: 20px 0;
  }

  .person {
    margin-bottom: 25px;
  }

  .person-info h3 {
    margin-bottom: 5px;
  }

  .person-info h4 {
    margin-bottom: 5px;
  }

  .sm-icon {
    display: inline-block;
    width: 30px;
    height: 30px;
    margin-right: 5px;
  }

  .person-bio p {
    font-size: 14px;
    line-height: 24px;
    vertical-align: middle;
  }

  .committee-list li {
    margin-top: 3px;
  }
</style>

<%block name="content">

    <div class="row-fluid">
      <div class="span12 about-content">
        <h2 class="about-subheading">The PyCon Canada 2012 Organizing Committee</h2>

        <div class="row-fluid person">
          <div class="span2 person-pic">
            <img class="profile-img"
              width="140" 
              src="${request.static_url('pyconca:static/people/diana.jpg')}"
              alt="Nicola Yap">
          </div>

          <div class="span2 person-info">
            <h3>Diana Clarke</h3>
            <h4><a href="https://twitter.com/diana_clarke"><img class="sm-icon" src="${request.static_url('pyconca:static/icons/elegantmediaicons/PNG/twitter.png')}">@diana_clarke</a></h4>
            <a href="http://www.linkedin.com/in/dianajoanclarke"><img class="sm-icon" src="${request.static_url('pyconca:static/icons/elegantmediaicons/PNG/linkedin.png')}"></a>
          </div>

          <div class="span8 person-bio">
            <p>
              Diana is a ninja.
            </p>
          </div>
        </div>

        <div class="row-fluid person">
          <div class="span2 person-pic">
            <img class="profile-img"
              width="140" height="140"
              src="${request.static_url('pyconca:static/people/nicola.png')}"
              alt="Nicola Yap">
          </div>

          <div class="span2 person-info">
            <h3>Nicola Yap</h3>
            <h4><a href="https://twitter.com/ncurious"><img class="sm-icon" src="${request.static_url('pyconca:static/icons/elegantmediaicons/PNG/twitter.png')}">@ncurious</a></h4>
            <a href="http://ca.linkedin.com/in/nicolayap"><img class="sm-icon" src="${request.static_url('pyconca:static/icons/elegantmediaicons/PNG/linkedin.png')}"></a>
          </div>

          <div class="span8 person-bio">
            <p>
              During her undergrad studies, Nicola stumbled on the 
              realization that she could combine her geeky inclinations 
              and love for teaching with a career in information development. 
              She's worked at companies like Symantec, Hummingbird (now OpenText), 
              and Nortel, and currently works at IBM. When she's not working on 
              docs or playing with her son, she renews herself through dance 
              and culinary exploration.
            </p>
          </div>
        </div>

        <div class="row-fluid person">
          <div class="span2 person-pic">
            <img class="profile-img"
              width="140" height="140"
              src="${request.static_url('pyconca:static/people/yiqing.png')}"
              alt="Yi Qing Sim">
          </div>

          <div class="span2 person-info">
            <h3>Yi Qing Sim</h3>
            <h4><a href="https://twitter.com/yiqingsim"><img class="sm-icon" src="${request.static_url('pyconca:static/icons/elegantmediaicons/PNG/twitter.png')}">@yiqingsim</a></h4>
            <a href="http://ysim.wordpress.com"><img class="sm-icon" src="${request.static_url('pyconca:static/icons/elegantmediaicons/PNG/wordpress.png')}"></a>
          </div>

          <div class="span8 person-bio">
            <p>
              Yi Qing is a swordfighter.
            </p>
          </div>

        </div>

        <div class="row-fluid person">
          <div class="span2 person-pic">
            <img class="profile-img"
              width="140" height="140"
              src="${request.static_url('pyconca:static/people/taavi.jpg')}"
              alt="Taavi Burns">
          </div>

          <div class="span2 person-info">
            <h3>Taavi Burns</h3>
            <h4><a href="https://twitter.com/jaaaarel"><img class="sm-icon" src="${request.static_url('pyconca:static/icons/elegantmediaicons/PNG/twitter.png')}">@jaaaarel</a></h4>
            <a href="http://taaviburns.ca/blog/"><img class="sm-icon" src="${request.static_url('pyconca:static/icons/elegantmediaicons/PNG/rss.png')}"></a>
          </div>

          <div class="span8 person-bio">
            <p>
              Defect Poacher, Futurist, and Musician. &ldquo;Jäääärel&rdquo; is an awesome word. He knits continental.
              He also used to work at IBM (which is not where he met Nicola), but now works at FreshBooks (and loving it).
            </p>
          </div>
        </div>

        <div class="row-fluid person">
          <div class="span2 person-pic">
            <img class="profile-img"
              width="140" height="140"
              src="${request.static_url('pyconca:static/people/david.jpg')}"
              alt="David Wolever">
          </div>

          <div class="span2 person-info">
            <h3>David Wolever</h3>
            <h4><a href="https://twitter.com/wolever"><img class="sm-icon" src="${request.static_url('pyconca:static/icons/elegantmediaicons/PNG/twitter.png')}">@wolever</a></h4>
            <a href="http://blog.codekills.net/"><img class="sm-icon" src="${request.static_url('pyconca:static/icons/elegantmediaicons/PNG/rss.png')}"></a>
          </div>

          <div class="span8 person-bio">
            <p>
              David is in a motorcycle gang.
            </p>
          </div>
        </div>

      </div>
    </div>

    <div class="row-fluid row-acknowledgements">
      <div class="span12">
        <h2 class="about-subheading">Acknowledgements</h2>

        <ul>
          <li>
            <a href="${request.static_url('pyconca:static/pyconlogo.png')}">PyCon logo design</a> by <a href="http://jess-sanson.com">Jess Sanson</a> (<a href="http://jess-sanson.com">jess-sanson.com</a>)
          </li>
          <li>
            <a href="http://www.elegantthemes.com/blog/resources/free-social-media-icon-set">Social media icons</a> by <a href="http://www.elegantthemes.com/">Elegant Themes</a>
          </li>
        </ul>

      </div>
    </div>

</%block>
