<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">

<div class="row-fluid">
    <div class="span12">
        <div id="breadcrumbs-result"></div>
        <div id="user-get-result"></div>
        <br>
        <br>
        <form id="delete-form" method="POST">
            <a class="btn btn-primary" href="${user_update_url}${id}">
               Edit
            </a>
            <input class="btn" type="submit" value="Delete"/>
        </form>
    </div>
</div>

<script id="breadcrumbs-template" type="text/x-handlebars-template">
    <br>
    <h1>
        <a href="${user_index_url}">users</a>
        <span> / {{user.username}}</span>
    </h1>
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
        $("#user-get-result").html(template(response['data']));

        var layout = $("#breadcrumbs-template").html();
        var template = Handlebars.compile(layout);
        $("#breadcrumbs-result").html(template(response['data']));
    }

    $(document).ready(function() {
        $.getJSON("${user_get_url}${id}.json", function(response) {
            render_templates(response);
        });
    });

    $("#delete-form").submit(function(event) {
        event.preventDefault(); 
        $.post("${user_delete_url}${id}.json")
            .success(function() {
                window.location.href = "${user_index_url}";
             })
            .error(function() {
                alert("error");
             })
        ;
    });
</script>

</%block>
