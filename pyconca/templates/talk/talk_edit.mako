<%inherit file="pyconca:templates/generic.mako"/>

<%block name="header">
    Talks
</%block>

<%block name="form">

<div id="breadcrumbs-result"></div>

<form id="edit-form" method="POST" class="form-horizontal">
    <div id="talk-edit-result"></div>
    <input class="btn btn-inverse" type="submit" value="Save"/>
    <a class="btn" type="submit"
       href="${request.route_url('talk_index')}">
       Cancel
    </a>
</form>

<script id="breadcrumbs-template" type="text/x-handlebars-template">
    <ul class="breadcrumb">
        <li><a href="${request.route_url('talk_index')}"}>talks</a></li>
        <span class="divider">/</span>
        % if is_create:
            <li>create</li>
        % else:
            <li>edit</li>
            <span class="divider">/</span>
            <li>{{talk.title}}</li>
        % endif
    </ul>
    <hr>
</script>

<script id="talk-edit-template" type="text/x-handlebars-template">
    <div class="control-group">
        <label class="control-label" for="title">Title</label>
        <div class="controls">
            <input type="text" maxlength="100"
                   name="title" value="{{talk.title}}">
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="type">Type</label>
        <div class="controls">
          <label>
            <input type="radio" name="type" value="talk"
            {{#if_eq talk.type compare="talk"}}checked="checked"{{/if_eq}}>
            20 mins talk
          </label>
          <label>
            <input type="radio" name="type" value="tutorial"
            {{#if_eq talk.type compare="tutorial"}}checked="checked"{{/if_eq}}>
            3 hours tutorial
          </label>
          <label>
            <input type="radio" name="type" value="other"
            {{#if_eq talk.type compare="other"}}checked="checked"{{/if_eq}}>
            Other
          </label>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="level">Difficulty Level</label>
        <div class="controls">
          <label>
            <input type="radio" name="level" value="novice"
              {{#if_eq talk.level compare="novice"}}checked="checked"{{/if_eq}}>
            Novice
          </label>
          <label>
            <input type="radio" name="level" value="novice"
              {{#if_eq talk.level compare="novice"}}checked="checked"{{/if_eq}}>
            Experienced
          </label>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="abstract">Abstract</label>
        <div class="controls">
            <textarea rows=5 name="abstract">{{talk.abstract}}</textarea>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="outline">Outline</label>
        <div class="controls">
            <textarea rows=10 name="outline">{{talk.outline}}</textarea>
        </div>
    </div>

  % if is_admin:
    <div class="control-group">
        <label class="control-label" for="reviewer_notes">Reviewer Notes</label>
        <div class="controls">
            <textarea rows=10 name="reviewer_notes">{{talk.reviewer_notes}}
            </textarea>
        </div>
    </div>
  % endif
</script>

<script type="text/javascript">

    function render_templates(response) {
        var layout = $("#talk-edit-template").html();
        var template = Handlebars.compile(layout);
        $("#talk-edit-result").html(template(response["data"]));

        var layout = $("#breadcrumbs-template").html();
        var template = Handlebars.compile(layout);
        $("#breadcrumbs-result").html(template(response["data"]));
    }

    $(document).ready(function() {
        Handlebars.registerHelper('if_eq', function(context, options) {
            if (context == options.hash.compare) return options.fn(this);
          return options.inverse(this);
        });

        % if is_create:
            var empty_talk = {
                title: "",
                type: "",
                level: "",
                abstract: "",
                outline: "",
                reviewer_notes: "",
            };
            var response = {data: {talk: empty_talk}};
            render_templates(response);
        % else:
            var url = "${request.route_url('api_talk_get', id=id)}";
            $.getJSON(url, function(response) {
                render_templates(response);
            });
        % endif:
    });

    $("#edit-form").submit(function(event) {
        event.preventDefault();
        var form_values = $("#edit-form").serializeArray();
        var talk = {};
        for (var i in form_values) {
            talk[form_values[i].name] = form_values[i].value;
        }
        var request = JSON.stringify({talk: talk});

        % if is_create:
            var url = "${request.route_url('api_talk_create')}";
        % else:
            var url = "${request.route_url('api_talk_update', id=id)}";
        % endif

        $.post(url, request)
            .success(function() {
                var goto_url = "${request.route_url('talk_index')}";
                window.location.href = goto_url;
             })
            .error(function(xhr) {
                response = $.parseJSON(xhr.responseText);
                var layout = $("#validation-errors-template").html();
                var template = Handlebars.compile(layout);
                $("#validation-errors-result").html(template(response));
             })
        ;
    });
</script>

</%block>

