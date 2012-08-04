<%inherit file="pyconca:templates/generic.mako"/>

<%block name="title">
    Login
</%block>

<%block name="header">
    Forgot Password
</%block>

<%block name="form">

    <form class="form-horizontal" action="${request.application_url}/forgot" method="POST">
        <div class="control-group">
            <label class="control-label" for="username">Username</label>
            <div class="controls">
                <input type="text" maxlength="100" name="username" value="${username}">
            </div>
        </div>

        <input class="btn btn-inverse" type="submit" name="forgot.submit" value="Reset"/>
    </form>

</%block>
