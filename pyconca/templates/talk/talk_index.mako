<%inherit file="pyconca:templates/generic.mako"/>

<%block name="header">
    Talks
</%block>

<%block name="header_right">
    <a class="btn btn-inverse pull-right"
       href="${request.route_url('talk_create')}">
       New Talk
    </a>
</%block>

<%block name="form">

<div id="talk-index-result"></div>

<script id="talk-index-template" type="text/x-handlebars-template">
    <table class="table table-striped table-bordered">
        <tr>
            <th>Title</th>
            <th>User</th>
            <th>Type</th>
            <th>Level</th>
        </tr>
        {{#talk_list}}
        <tr>
          <td>
            <a href="${request.route_url('talk_index')}/{{id}}">
                {{title}}
            </a>
          </td>
          <td>{{user.first_name}} {{user.last_name}}</td>
          <td>{{type}}</td>
          <td>{{level}}</td>
        </tr>
        {{/talk_list}}
    </table>
</script>

<script type="text/javascript">
    function render_templates(response) {
        var layout = $("#talk-index-template").html();
        var template = Handlebars.compile(layout);
        $("#talk-index-result").html(template(response["data"]));
    }

    $(document).ready(function() {
        var url = "${request.route_url('api_talk_index')}";
        $.getJSON(url, function(response) {
            render_templates(response);
        });
    });
</script>

</%block>

