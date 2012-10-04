<%inherit file="pyconca:templates/generic.mako"/>

<%block name="header">
    User Profile
</%block>

<%block name="form">

<div id="breadcrumbs-result"></div>

<div id="user-get-result"></div>

<br>

<form id="delete-form" method="POST">
    <a class="btn btn-inverse" 
       href="${request.route_url('user_update', id=id)}">
       Edit
    </a>
    <a class="btn btn-inverse" 
       href="${request.route_url('pwd_change')}">
       Change your password
    </a>
    % if is_admin:
      <input class="btn" type="submit" value="Delete"/>
    % endif
</form>

<script id="breadcrumbs-template" type="text/x-handlebars-template">
    <ul class="breadcrumb">
        % if is_admin:
          <li><a href="${request.route_url('user_index')}"}>users</a></li>
        % else:
          <li>users</li>
        % endif
        <span class="divider">/</span>
        <li>{{user.username}}</li>
    </ul>
    <hr>
</script>

<script id="user-get-template" type="text/x-handlebars-template">
    <strong>Name:</strong>
    <span>{{user.first_name}}</span>
    <span>{{user.last_name}}</span>

    <br>
    <strong>Email Address:</strong>
    <span>{{user.email}}</span>

    <br>
    <strong>Username:</strong>
    <span>{{user.username}}</span>
</script>

<script type="text/javascript">
    function render_templates(response) {
        var layout = $("#user-get-template").html();
        var template = Handlebars.compile(layout);
        $("#user-get-result").html(template(response["data"]));

        var layout = $("#breadcrumbs-template").html();
        var template = Handlebars.compile(layout);
        $("#breadcrumbs-result").html(template(response["data"]));
    }

    $(document).ready(function() {
        var url = "${request.route_url('api_user_get', id=id)}";
        $.getJSON(url, function(response) {
            render_templates(response);
        });
    });

    $("#delete-form").submit(function(event) {
        event.preventDefault();
        var url = "${request.route_url('api_user_delete', id=id)}"; 
        $.post(url)
            .success(function() {
                var goto_url = "${request.route_url('user_index')}";
                window.location.href = goto_url;
             })
            .error(function() {
                alert("error");
             })
        ;
    });
</script>

</%block>
