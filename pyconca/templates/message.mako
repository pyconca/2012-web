% for queue in ['success', 'alert', 'error']:
    % if request.session.peek_flash(queue):
        <div id="flash" class="alert alert-${queue}">
            % for flash in request.session.pop_flash(queue):
                % if flash:
                    ${flash}
                    <br>
                % endif
            % endfor
        </div>
   % endif
% endfor