<%inherit file="pyconca:templates/generic.mako"/>

<%block name="head_title">
    % if is_create:
      ${_(u"Submit Talk")}
    % else:
      ${_(u"Edit Talk")}
    % endif
</%block>


<%block name="title">
    % if is_create:
      ${_(u"Submit Talk")}
    % else:
      ${_(u"Edit Talk")}
    % endif
</%block>


<%block name="form">

<div id="breadcrumbs-result"></div>

<form id="edit-form" method="POST" class="form-horizontal">
    <div id="talk-edit-result"></div>
    <div class="controls">
      <input class="btn btn-success" type="submit" value="Save"/>
      <a class="btn" type="submit"
         href="${request.route_url('talk_index')}">
         Cancel
      </a>
    </div>
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
        <label class="control-label" for="owner_id">User</label>
        <div class="controls">
        % if is_admin:
            <select name="owner_id">
              <option value=""></option>
              {{#user_list}}
                <option value="{{id}}"{{selected ../talk.user.id id}}>
                  {{first_name}} {{last_name}}
                </option>
              {{/user_list}}
            </select>
        % else:
            <input type="hidden" name="owner_id" value="${request.user.id}">
            <input type="text"
                   name="user_full_name"
                   value="${request.user.first_name} ${request.user.last_name}"
                   disabled>
        % endif
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="title">Title</label>
        <div class="controls">
            <input type="text" maxlength="100" name="title" value="{{talk.title}}">
            <div class="help-block" style="display: inline;" id="title_error">&nbsp;</div>
        </div>
    </div>

    % if is_admin:
    <div class="control-group">
        <label class="control-label" for="schedule_slot_id">Schedule Slot</label>
        <div class="controls">
          <select name="schedule_slot_id" id="schedule_slot_id_select">
            <option value="-1">(not scheduled)</option>
          </select>
        </div>
        <div class="help-block" style="display: inline;" id="schedule_slot_id_error">&nbsp;</div>
    </div>
    % endif

    <div class="control-group">
        <label class="control-label" for="video_release">Video Release</label>
        <div class="controls">
          <div class="help-block" style="display: inline;" id="video_release_error">&nbsp;</div>
          <label>
            <input type="radio" name="video_release" value="1"
            {{#if_eq talk.video_release compare=true}}checked="checked"{{/if_eq}}>
            Yes
          </label>
          <label>
            <input type="radio" name="video_release" value="0"
            {{#if_eq talk.video_release compare=false}}checked="checked"{{/if_eq}}>
            No
          </label>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="type">Type</label>
        <div class="controls">
          <div class="help-block" style="display: inline;" id="type_error">&nbsp;</div>
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
          <div class="help-block" style="display: inline;" id="level_error">&nbsp;</div>
          <label>
            <input type="radio" name="level" value="novice"
              {{#if_eq talk.level compare="novice"}}checked="checked"{{/if_eq}}>
            Novice
          </label>
          <label>
            <input type="radio" name="level" value="experienced"
              {{#if_eq talk.level compare="experienced"}}checked="checked"{{/if_eq}}>
            Experienced
          </label>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="bio">Speaker Bio</label>
        <div class="controls">
            <textarea rows="5" class="field span10" name="bio" maxlength="500">{{talk.bio}}</textarea>
            <div class="help-block" style="display: inline;" id="bio_error">&nbsp;</div>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="abstract">Abstract</label>
        <div class="controls">
            <textarea rows="5" class="field span10" name="abstract" maxlength="400">{{talk.abstract}}</textarea>
            <div class="help-block" style="display: inline;" id="abstract_error">&nbsp;</div>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="outline">Outline</label>
        <div class="controls">
            <textarea rows="10" class="field span10" name="outline">{{talk.outline}}</textarea>
            <div class="help-block" style="display: inline;" id="outline_error">&nbsp;</div>
        </div>
    </div>

    % if is_admin:
        <div class="control-group">
            <label class="control-label" for="reviewer_notes">Reviewer Notes</label>
            <div class="controls">
                <textarea rows="10" class="field span10" name="reviewer_notes">{{talk.reviewer_notes}}</textarea>
                <div class="help-block" style="display: inline;" id="reviewer_notes_error">&nbsp;</div>
            </div>
        </div>
    % endif:
</script>

<script type="text/javascript">

    function render_templates(response, user_list) {
        var context = response["data"];
        context["user_list"] = user_list;

        var layout = $("#talk-edit-template").html();
        var template = Handlebars.compile(layout);
        $("#talk-edit-result").html(template(context));

        var layout = $("#breadcrumbs-template").html();
        var template = Handlebars.compile(layout);
        $("#breadcrumbs-result").html(template(context));
    }

    function get_user_list() {
        var user_list = []

        % if is_admin:
            var url = "${request.route_url('api_user_index')}";
            $.ajax({  
                url: url,
                dataType: 'json',
                async: false,
                success: function(response) {
                        user_list = response["data"]["user_list"];
                }
            });
        % endif:

        return user_list;
    }

    $(document).ready(function() {
        user_list = get_user_list();

        % if is_create:
            var empty_talk = {
                title: "",
                type: "",
                level: "",
                bio: "",
                abstract: "",
                outline: "",
                reviewer_notes: "",
            };
            var response = {data: {talk: empty_talk}};
            render_templates(response, user_list);
        % else:
            var url = "${request.route_url('api_talk_get', id=id)}";
            $.getJSON(url, function(response) {
                render_templates(response, user_list);
                % if is_admin:
                    var url = "${request.route_url('api_schedule_slot_index')}";
                    $.getJSON(url, function(schedule_slot_response) {
                        var slots = schedule_slot_response.data.schedule_slot_list;
                        var select = $('select[name=schedule_slot_id]');
                        for (var i in slots) {
                            if (slots[i].talk_id && slots[i].talk_id != ${id}) {
                                continue;
                            }
                            var option = $('<option>').attr(
                                'value', slots[i].id
                            ).text(
                                Handlebars.helpers['pycon_time'](
                                    slots[i].start,
                                    slots[i].duration
                                ) + " in " + slots[i].room
                            );
                            if (slots[i].id == response.data.talk.schedule_slot_id) {
                                option.attr('selected', 'selected');
                            }
                            select.append(option);
                        }
                    });
                % endif
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

        $.ajax({
          url:url,
          type:"POST",
          data:request,
          contentType:"application/json; charset=utf-8",
          dataType:"json",
          success: function(){
              var goto_url = "${request.route_url('talk_index')}";
              window.location.href = goto_url;
          },
          error: function(xhr){
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
          }
        });
    });
</script>

</%block>

