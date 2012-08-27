<%inherit file="event.mako"/>

<%block name="title">
    ${_(u"Speakers")}
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">${_(u"Speakers")}</h1>
        <p>
          <%block filter="gettext">
            The schedule for PyCon 2012 includes talks, tutorials, and sprints
            over Saturday and Sunday.
          </%block>
        </p>

        <p>
          <%block filter="gettext">
            We welcome <em>everyone</em> in the Canadian Python community to
            come and share your ideas, experiences, and expertise. Whether
            you're new to Python or a seasoned expert, if you've got something
            interesting to share, we want to hear about it. A conference with a
            diverse set of good topics will give everyone the opportunity to
            learn something new and cool.
          </%block>
        </p>

        <p>
          <%block filter="gettext">
            Nervous about your lack of presenter experience? We'll work to
            connect you with resources and people to help you prepare. You
            might also consider co-presenting with a more experienced
            presenter. And once you've rocked PyCon Canada 2012, you can take
            that experience to help you gear up for the main PyCon conference
            in Montreal.
          </%block>
        </p>
    </div>

    <div class="row-fluid content-section">
        <h1 class="header">${_(u"Submitting a Talk or Tutorial")}</h1>
        <p>
          <%block filter="gettext">
            We would prefer 20 minute talks, although 45 minute talks will also
            be considered. Tutorials are 3 hours. We also welcome ideas for
            sprints.
          </%block>
        </p>

        <p>
          <%block filter="gettext">
            Submit your talk <a href='/new/talk'>here</a> if you are logged in.
            Alternatively, you can send talk and tutorial proposals to
            <a href='mailto:organizers@pycon.ca'>organizers@pycon.ca</a>. Include
            the following information in talk and tutorial proposals:
          </%block>
        </p>

        <ul>
          <li>${_(u"Name of the talk or tutorial")}</li>
          <li>${_(u"Length of the talk/tutorial")}</li>
          <li>${_(u"Intended audience (assumed level of knowledge)")}</li>
          <li>${_(u"Abstract for the talk/tutorial - 200 chars max")}</li>
          <li>${_(u"Outline of the talk/tutorial")}</li>
          <li>
            <%block filter="gettext">
              Additional notes for the proposal reviewers. This can include
              additional background information such as links to other
              presentations you have done, or links to blog posts, articles
              or code related to your presentation.
            </%block>
          </li>
        </ul>
    </div>
</%block>
