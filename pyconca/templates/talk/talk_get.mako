<%inherit file="pyconca:templates/generic.mako"/>

<%block name="header">
    Talks
</%block>

<%block name="form">

<div id="breadcrumbs-result"></div>

<div id="talk-get-result"></div>

<br>

<form id="delete-form" method="POST">
    <a class="btn btn-inverse" 
       href="${request.route_url('talk_update', id=id)}">
       Edit
    </a>
    <input class="btn" type="submit" value="Delete"/>
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
    <strong>Title:</strong>
    <span>{{talk.title}}</span>

    <br>
    <strong>Type:</strong>
    <span>{{talk.type}}</span>

    <br>
    <strong>Level:</strong>
    <span>{{talk.level}}</span>

    <br>
    <strong>Abstract:</strong>
    <span>{{talk.abstract}}</span>

    <br>
    <strong>Outline</strong>
    <span>{{talk.outline}}</span>

  % if is_admin:
    <br>
    <strong>Reviewer Notes:</strong>
    <span>{{talk.reviewer_notes}}</span>
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

