<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">

<div class="row-fluid">
    <div class="span12">
        <br>
        % if validation_dict:
            <div class="alert alert-error">
                % for key in validation_dict:
                    <span>
                      ${validation_dict[key].msg}: ${key}
                      <br/>
                    </span>
                % endfor
            </div>
        % endif
        <div id="breadcrumbs-result"></div>
        <form id="edit-form" method="POST" class="form-horizontal">
            <div id="user-edit-result"></div>
            <input class="btn btn-primary" type="submit" value="Save"/>
            <a class="btn" type="submit" href="${user_index_url}">Cancel</a>
        </form>
     </div>
</div>

<script id="breadcrumbs-template" type="text/x-handlebars-template">
    <h1>
        <a href=${user_index_url}>users</a> /
        % if id:
            <span>{{user.username}}</span>
        % else:
            <span>create</span>
        % endif
    </h1>
    <hr>
</script>

<script id="user-edit-template" type="text/x-handlebars-template">
    <div class="control-group">
        <label class="control-label" for="first_name">First Name</label>
        <div class="controls">
            <input type="text" maxlength="100" 
                   name="first_name" value="{{user.first_name}}">
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="last_name">Last Name</label>
        <div class="controls">
            <input type="text" maxlength="100" 
                   name="last_name" value="{{user.last_name}}">
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="username">Username</label>
        <div class="controls">
            <input type="text" maxlength="30" 
                   name="username" value="{{user.username}}">
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="email">Email Address</label>
        <div class="controls">
            <input type="text" maxlength="100" 
                   name="email" value="{{user.email}}">
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="password">Password</label>
        <div class="controls">
            <input type="password" maxlength="50" 
                   name="password" value="">
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="password_confirm">Confirm Password</label>
        <div class="controls">
            <input type="password" maxlength="50" 
                   name="password_confirm" value="">
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
        % if id:
            $.getJSON("${user_get_url}${id}.json", function(response) {
                render_templates(response);
            });
        % else:
            var empty_user = {
                first_name: "",
                last_name: "",
                username: "",
                email: ""
            };
            var response = {data: {user: empty_user}};
            render_templates(response);
        % endif:
    });

    $("#edit-form").submit(function(event) {
        event.preventDefault();
        form_values = $("#edit-form").serializeArray();
        user = {};
        for (var i in form_values) {
            user[form_values[i].name] = form_values[i].value;
        }
        request = {user: user};
        $.post("${user_save_url}.json", JSON.stringify(request))
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
