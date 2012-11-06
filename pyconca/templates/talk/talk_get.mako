<%inherit file="pyconca:templates/generic.mako"/>

<%block name="head_title">
    ${_(u"Talk Overview")}
</%block>

<%block name="title">
    ${_(u"Talk Overview")}
</%block>

<%block name="form">

<div id="breadcrumbs-result"></div>

<div id="talk-get-result"></div>

<br>

<form id="delete-form" method="POST">
    % if is_admin or is_talk_owner:
      <a class="btn btn-info"
         href="${request.route_url('talk_update', id=id)}">
         Edit
      </a>
    % endif

    % if is_admin:
      <input class="btn" type="submit" value="Delete"/>
    % endif
</form>

<script id="breadcrumbs-template" type="text/x-handlebars-template">
    <ul class="breadcrumb">
        <li><a href="${request.route_url('talk_index')}">talks</a></li>
        <span class="divider">/</span>
        <li>{{talk.title}}</li>
    </ul>
    <hr>
</script>

<script id="talk-get-template" type="text/x-handlebars-template">
    <fieldset>
        <legend><strong>{{talk.title}}</strong></legend>
        <strong>Speaker: </strong>
        <span>{{talk.speaker_first_name}} {{talk.speaker_last_name}}</span>
        <br>
        <strong>Video Release:</strong>
        <span>
          {{#if_eq talk.video_release compare=true}}yes{{/if_eq}}
          {{#if_eq talk.video_release compare=false}}no{{/if_eq}}
        </span>
        <br>
        <strong>Type:</strong>
        <span>{{talk.type}}</span>
        <br>
        <strong>Level:</strong>
        <span>{{talk.level}}</span>
        <br>
        <strong>When:</strong>
        <span>{{pycon_time talk.start talk.duration}}</span>
        <br>
        <strong>Where:</strong>
        <span>{{talk.room}}</span>
    </fieldset>

    <br>
    <fieldset>
        <legend><strong>Abstract</strong></legend>
        <p>{{nl2br talk.abstract}}</p>
    </fieldset>

    <br>
    <fieldset>
        <legend><strong>Speaker Bio</strong></legend>
        <p>{{nl2br talk.bio}}</p>
    </fieldset>

    % if is_admin or is_talk_owner:
        <br>
        <fieldset>
            <legend><strong>Outline</strong></legend>
            <p>{{nl2br talk.outline}}</p>
        </fieldset>
    % endif

    % if is_admin:
        <br>
        <fieldset>
            <legend><strong>Reviewer Notes</strong></legend>
            <p>{{nl2br talk.reviewer_notes}}</p>
        </fieldset>
    % endif
</script>

<script type="text/javascript">
    function render_templates(response) {
        var layout = $("#talk-get-template").html();
        var template = Handlebars.compile(layout);
        $("#talk-get-result").html(template(response["data"]));

        var layout = $("#breadcrumbs-template").html();
        var template = Handlebars.compile(layout);
        $("#breadcrumbs-result").html(template(response["data"]));
    }

    $(document).ready(function() {
        var url = "${request.route_url('api_talk_get', id=id)}";
        $.getJSON(url, function(response) {
            render_templates(response);
        });
    });

    $("#delete-form").submit(function(event) {
        event.preventDefault();
        var url = "${request.route_url('api_talk_delete', id=id)}"; 
        $.post(url)
            .success(function() {
                var goto_url = "${request.route_url('talk_index')}";
                window.location.href = goto_url;
             })
            .error(function() {
                alert("error");
             })
        ;
    });
</script>

<div id="disqus_thread"></div>
<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
    var disqus_shortname = 'pyconca'; // required: replace example with your forum shortname

    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
<a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>

</%block>

