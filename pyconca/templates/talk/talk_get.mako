<%inherit file="pyconca:templates/generic.mako"/>

<%block name="header">
    Talk Overview
</%block>

<%block name="form">

<div id="breadcrumbs-result"></div>

<div id="talk-get-result"></div>

<br>

<form id="delete-form" method="POST">
    <a class="btn btn-info"
       href="${request.route_url('talk_update', id=id)}">
       Edit
    </a>
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
        <strong>User:</strong>
        <span>{{talk.user.first_name}} {{talk.user.last_name}}</span>
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
        <legend><strong>Outline</strong></legend>
        <p>{{nl2br talk.outline}}</p>
    </fieldset>

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

</%block>

