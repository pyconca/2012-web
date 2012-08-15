% for queue in ["success", "alert", "error"]:
    % if request.session.peek_flash(queue):
        <div id="flash" class="alert alert-${queue}">
            % for flash in request.session.pop_flash(queue):
                % if flash:
                    ${flash|n}
                    <br>
                % endif
            % endfor
        </div>
   % endif
% endfor

<script id="validation-errors-template" type="text/x-handlebars-template">
    <div class="alert alert-warning">
    {{#errors}}
        {{field}} - {{message}}
        <br>
    {{/errors}}
    </div>
</script>

<div id="validation-errors-result"></div>
