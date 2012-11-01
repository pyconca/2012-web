<%inherit file="pyconca:templates/generic.mako"/>

<%block name="head_title">
    ${_(u"Talks")}
</%block>

<%block name="title">
    ${_(u"Talks")}
</%block>

<%block name="header_right">
    <a class="btn btn-info"
       href="${request.route_url('talk_create')}">
       New Talk
    </a>
</%block>

<%block name="form">

<p><em>Note: Click on a table header to sort by that column!</em></p>

<div id="talk-index-result"></div>

<script id="talk-index-template" type="text/x-handlebars-template">
    <table id="talk-index-table" class="table table-striped table-bordered">
        <tr>
            <th>Title</th>
            <th>Speaker</th>
            <th>Type</th>
            <th>Level</th>
            <th>When</th>
            <th>Code</th>
            <th>Where</th>
        </tr>
        {{#talk_list}}
        <tr>
          <td>
            <a href="${request.route_url('talk_index')}/{{id}}">
                {{title}}
            </a>
          </td>
          <td>{{speaker_first_name}} {{speaker_last_name}}</td>
          <td>{{type}}</td>
          <td>{{level}}</td>
          <td>{{pycon_time start duration}}</td>
          <td>{{schedule_code}}</td>
          <td>{{room}}</td>
        </tr>
        {{/talk_list}}
    </table>
</script>

<script type="text/javascript">
    function render_templates(response) {
        var layout = $("#talk-index-template").html();
        var template = Handlebars.compile(layout);
        $("#talk-index-result").html(template(response["data"]));
        sorttable.makeSortable($("#talk-index-table")[0]);
    }

    $(document).ready(function() {
        var url = "${request.route_url('api_talk_index')}";
        $.getJSON(url, function(response) {
            render_templates(response);
        });
    });
</script>

<script src="${request.static_url("pyconca:static/libs/sorttable.js")}"></script>

</%block>

