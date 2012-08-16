<%inherit file="event.mako"/>

<%block name="title">
    ${_(u"Speakers")}
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">${_(u"Speakers")}</h1>
        <p>
            ${_(u"The schedule for PyCon 2012 includes talks, tutorials, and sprints"
            u"over Saturday and Sunday.")}
        </p>

        <p>
            ${_(u"We welcome <em>everyone</em> in the Canadian Python community to"
            u"come and share your ideas, experiences, and expertise. Whether"
            u"you're new to Python or a seasoned expert, if you've got something"
            u"interesting to share, we want to hear about it. A conference with a"
            u"diverse set of good topics will give everyone the opportunity to"
            u"learn something new and cool.")}
        </p>

        <p>
            ${_(u"Nervous about your lack of presenter experience? We'll work to"
            u"connect you with resources and people to help you prepare. You"
            u"might also consider co-presenting with a more experienced"
            u"presenter. And once you've rocked PyCon Canada 2012, you can take"
            u"that experience to help you gear up for the main PyCon conference"
            u"in Montreal.")}
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">${_(u"Submitting a Talk or Tutorial")}</h1>
        <p>
            ${_(u"We would prefer 20 minute talks, although 45 minute talks will also"
            u"be considered. Tutorials are 3 hours. We also welcome ideas for"
            u"sprints.")}
        </p>

        <p>
          ${_(u"Submit your talk <a href='/new/talk'>here</a> if you are logged in."
          u" Alternatively, you can send talk and tutorial proposals to"
          u" <a href='mailto:organizers@pycon.ca'>organizers@pycon.ca</a>. Include"
          u" the following information in talk and tutorial proposals:")}
        </p>

        <ul>
          <li>${_(u"Name of the talk or tutorial")}</li>
          <li>${_(u"Length of the talk/tutorial")}</li>
          <li>${_(u"Intended audience (assumed level of knowledge)")}</li>
          <li>${_(u"Abstract for the talk/tutorial - 200 chars max")}</li>
          <li>${_(u"Outline of the talk/tutorial")}</li>
          <li>${_(u"Additional notes for the proposal reviewers. This can include")}
              u" additional background information such as links to other"
              u" presentations you have done, or links to blog posts, articles,"
              u" or code related to your presentation.")}</li>
        </ul>
    </div>
</%block>
