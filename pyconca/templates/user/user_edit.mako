<%inherit file="pyconca:templates/generic.mako"/>

<%block name="header">
    % if is_create:
      Sign Up
    % else:
      Edit Profile
    % endif
</%block>

<%block name="form">

<div id="breadcrumbs-result"></div>

<form id="edit-form" method="POST" class="form-horizontal">
    <div id="user-edit-result"></div>
    <input class="btn btn-inverse" type="submit" value="Save"/>
    <a class="btn" type="submit" 
       href="${request.route_url('user_index')}">
       Cancel
    </a>
</form>

<script id="breadcrumbs-template" type="text/x-handlebars-template">
    <ul class="breadcrumb">
        % if is_admin:
          <li><a href="${request.route_url('user_index')}"}>users</a></li>
        % else:
          <li>users</li>
        % endif
        <span class="divider">/</span>
        % if is_create:
            <li>create</li>
        % else:
            <li>edit</li>
            <span class="divider">/</span>
            <li>{{user.username}}</li>
        % endif
    </ul>
    <hr>
</script>

<script id="user-edit-template" type="text/x-handlebars-template">
    <div class="control-group">
        <label class="control-label" for="first_name">First Name</label>
        <div class="controls">
            <input type="text" maxlength="100" 
                   name="first_name" value="{{user.first_name}}">
            <div class="help-block" style="display: inline;" id="first_name_error">&nbsp;</div>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="last_name">Last Name</label>
        <div class="controls">
            <input type="text" maxlength="100" 
                   name="last_name" value="{{user.last_name}}">
            <div class="help-block" style="display: inline;" id="last_name_error">&nbsp;</div>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="username">Username</label>
        <div class="controls">
            <input type="text" maxlength="30" 
                   name="username" value="{{user.username}}">
            <div class="help-block" style="display: inline;" id="username_error">&nbsp;</div>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="email">Email Address</label>
        <div class="controls">
            <input type="text" maxlength="100" 
                   name="email" value="{{user.email}}">
            <div class="help-block" style="display: inline;" id="email_error">&nbsp;</div>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="password">Password</label>
        <div class="controls">
            <input type="password" maxlength="50" 
                   name="password" value="">
            <div class="help-block" style="display: inline;" id="password_error">&nbsp;</div>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="password_confirm">
            Confirm Password
        </label>
        <div class="controls">
            <input type="password" maxlength="50" 
                   name="password_confirm" value="">
            <div class="help-block" style="display: inline;" id="password_confirm_error">&nbsp;</div>
        </div>
    </div>
</script>

<script type="text/javascript">
    function render_templates(response) {
        var layout = $("#user-edit-template").html();
        var template = Handlebars.compile(layout);
        $("#user-edit-result").html(template(response["data"]));

        var layout = $("#breadcrumbs-template").html();
        var template = Handlebars.compile(layout);
        $("#breadcrumbs-result").html(template(response["data"]));
    }

    $(document).ready(function() {
        % if is_create:
            var empty_user = {
                first_name: "",
                last_name: "",
                username: "",
                email: ""
            };
            var response = {data: {user: empty_user}};
            render_templates(response);
        % else:
            var url = "${request.route_url('api_user_get', id=id)}";
            $.getJSON(url, function(response) {
                render_templates(response);
            });
        % endif:
    });

    $("#edit-form").submit(function(event) {
        event.preventDefault();
        var form_values = $("#edit-form").serializeArray();
        var user = {};
        for (var i in form_values) {
            user[form_values[i].name] = form_values[i].value;
        }
        var request = JSON.stringify({user: user});

        % if is_create:
            var url = "${request.route_url('api_user_create')}";
        % else:
            var url = "${request.route_url('api_user_update', id=id)}";
        % endif

        $.post(url, request)
            .success(function() {
                var goto_url = "${request.route_url('user_index')}";
                window.location.href = goto_url;
             })
            .error(function(xhr) {
                $('.warning').each(function() {
                    $(this).removeClass('warning');
                });
                $('.help-block').each(function() {
                    $(this).hide();
                });
                response = $.parseJSON(xhr.responseText);
                var layout = $("#validation-errors-template").html();
                var template = Handlebars.compile(layout);
                $.each(response.errors, function() {
                   var error_slot_id = '#' + this.field + '_error';
                   $(error_slot_id).html(this.message).fadeIn();
                   $(error_slot_id).parents('.control-group').addClass('warning');
                });
             })
        ;
    });
</script>

</%block>
