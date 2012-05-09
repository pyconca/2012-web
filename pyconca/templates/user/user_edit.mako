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
        <h1>
            <a href=${index_url}>users</a> /
            % if user.id:
                <span> ${user.username} </span>
            % else:
                <span>create</span>
            % endif
        </h1>
        <hr>
        <form class="form-horizontal" action="${user.save_url}" method="POST">

            <div class="control-group">
                <label class="control-label" for="first_name">First Name</label>
                <div class="controls">
                    <input type="text" maxlength="100" name="first_name" value="${user.first_name}">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="last_name">Last Name</label>
                <div class="controls">
                    <input type="text" maxlength="100" name="last_name" value="${user.last_name}">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="username">Username</label>
                <div class="controls">
                    <input type="text" maxlength="30" name="username" value="${user.username}">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="email">Email Address</label>
                <div class="controls">
                    <input type="text" maxlength="100" name="email" value="${user.email}">
                </div>
            </div>

            <input class="btn btn-primary" type="submit" value="Save"/>
            <a class="btn" type="submit" href='${index_url}'>Cancel</a>
        </form>
    </div>
</div>

</%block>
