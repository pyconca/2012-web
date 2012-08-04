<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">

<div class="content-holder">

<div class="row-fluid">
    <div class="span9">
        <br>
        <h1>Users</h1>
        <br>
    </div>
    <div class="span3">
        <br>
        <a class="btn btn-inverse pull-right" 
           href="${request.route_url('user_create')}">
           New User
        </a>
    </div>
    <hr>
</div>

<div class="row-fluid">
    <div class="span12">
        <div id="user-index-result"></div>
    </div>
</div>

</div>

<script id="user-index-template" type="text/x-handlebars-template">
    <table class="table table-striped table-bordered">
        <tr>
            <th>Name</th>
            <th>Username</th>
            <th>Email</th>
        </tr>
        {{#user_list}}
        <tr>
          <td>
            <a href="${request.route_url('user_index')}/{{id}}">
                {{first_name}} {{last_name}}
            </a>
          </td>
          <td>{{username}}</td>
          <td>{{email}}</td>
        </tr>
        {{/user_list}}
    </table>
</script>

<script type="text/javascript">
    function render_templates(response) {
        var layout = $("#user-index-template").html();
        var template = Handlebars.compile(layout);
        $("#user-index-result").html(template(response["data"]));
    }

    $(document).ready(function() {
        var url = "${request.route_url('api_user_index')}";
        $.getJSON(url, function(response) {
            render_templates(response);
        });
    });
</script>

</%block>
