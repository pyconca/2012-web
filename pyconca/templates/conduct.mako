<%inherit file="event.mako"/>

<%block name="title" filter="gettext">
    Code of Conduct
</%block>

<%block name="info">
    <div class="row-fluid content-section">
        <h1 class="header header-first">${_("Code of Conduct")}</h1>
        <p>
          <%block filter="gettext">
            PyCon Canada is a community conference intended for networking and
            collaboration in the developer community.
            <br>
            <br>

            We value the participation of each member of the Python community
            and want all attendees to have an enjoyable and fulfilling
            experience. Accordingly, all attendees are expected to show
            <strong>respect</strong> and <strong>courtesy</strong>
            to other attendees throughout the conference and at
            all conference events, whether officially sponsored by PyCon
            Canada or not.
            <br>
            <br>

            To make clear what is expected, all delegates, speakers, exhibitors
            and volunteers at any PyCon Canada event are required to conform
            to the following Code of Conduct. Organizers will enforce this
            code throughout the event.
          </%block>
        </p>

        <h1 class="header">${_("The Short Version")}</h1>
        <p>
          <%block filter="gettext">
            PyCon Canada is dedicated to providing a harassment-free conference
            experience for everyone, regardless of gender, sexual orientation,
            disability, physical appearance, body size, race, religion, or
            choice of text editor. We do not tolerate harassment of conference
            participants in any form.
            <br>
            <br>

            All communication should be appropriate for a professional audience
            including people of many different backgrounds. Sexual language and
            imagery is not appropriate for any conference venue, including talks.
            <br>
            <br>

            <strong>Be kind</strong> to others. Do not insult or put down
            other attendees. Behave professionally. Remember that harassment
            and sexist, racist, or exclusionary jokes are not appropriate for
            PyCon Canada.
            <br>
            <br>

            Attendees violating these rules may be asked to leave the conference
            without a refund at the sole discretion of the conference organizers.
            <br>
            <br>

            Thank you for helping make this a welcoming, friendly event for all.
          </%block>
        </p>

        <h1 class="header">${_("The Longer Version")}</h1>
        <p>
          <%block filter="gettext">
            Harassment includes offensive verbal comments related to gender,
            sexual orientation, disability, physical appearance, body size, race,
            religion, sexual images in public spaces, deliberate intimidation,
            stalking, following, harassing photography or recording, sustained
            disruption of talks or other events, inappropriate physical contact,
            and unwelcome sexual attention.
            <br>
            <br>

            Participants asked to stop any harassing behavior are expected to
            comply immediately.
            <br>
            <br>

            Exhibitors in the expo hall, sponsor or vendor booths, or similar
            activities are also subject to the anti-harassment policy. In
            particular, exhibitors should not use sexualized images, activities,
            or other material. Booth staff (including volunteers) should not use
            sexualized clothing/uniforms/costumes, or otherwise create a
            sexualized environment.
            <br>
            <br>

            Be careful in the words that you choose. Remember that sexist,
            racist, and other exclusionary jokes can be offensive to those
            around you.
            <br>
            <br>

            If a participant engages in behavior that violates this code of
            conduct, the conference organizers may take any action they deem
            appropriate, including warning the offender or expulsion from the
            conference with no refund.
          </%block>
        </p>

        <h1 class="header">${_("Contact Information")}</h1>
        <p>
          <%block filter="gettext">
            If you are being harassed, notice that someone else is being
            harassed, or have any other concerns, please contact a member of
            conference board - Diana Clarke, Nicola Yap, or David Wolever.
            <br>
            <br>

            If the matter is especially urgent, please call/contact any of
            these individuals:
          </%block>
            <br>

            <ul>
                <li><strong>Michael DiBernardo</strong>: +1 (647) 519-3325</li>
                <li><strong>Diana Clarke</strong>: +1 (416) 453-3130</li>
            </ul>
            <%block filter="gettext">
              Conference staff will be happy to help participants contact
              hotel/venue security or local law enforcement, provide escorts,
              or otherwise assist those experiencing harassment to feel safe
              for the duration of the conference. We value your attendance.
            </%block>
        </p>

        <h1 class="header">${_("License")}</h1>
        <p>
          <%block filter="gettext">
            This code of conduct is largely based on the PyCon USA
            <a href="https://us.pycon.org/2013/about/code-of-conduct/">
                Conference Code of Conduct
            </a>.
          </%block>
        </p>
    </div>
</%block>
