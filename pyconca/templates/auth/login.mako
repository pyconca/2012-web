<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">

<div class="row-fluid">
    <div class="span12">
        <br>
        <h1>Login</h1>
        <hr>

        % if message:
            <div class="alert alert-error">
              ${message}
              <br/>
            </div>
        % endif

        <form class="form-horizontal" action="${request.application_url}/login" method="POST">
            <input type="hidden" name="came_from" value="${came_from}"/>

            <div class="control-group">
                <label class="control-label" for="username">Username</label>
                <div class="controls">
                    <input type="text" maxlength="100" name="username" value="${username}">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="password">Password</label>
                <div class="controls">
                    <input type="text" maxlength="100" name="password">
                    <br>
                    <br>
                    <a href="${request.application_url}/forgot">Forgot your password?</a>
                </div>
            </div>

            <input class="btn" type="submit" name="login.submit" value="Login"/>
        </form>


    </div>
</div>

</%block>
