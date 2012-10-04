<%inherit file="pyconca:templates/generic.mako"/>

<%block name="header">
    Password Reset
</%block>

<%block name="form">

    <div class="note">
        <p>To reset your password, please submit your email address you used to
            when registering in the form below and a reset link will be emailed to you.</p>
    </div>

    <form class="form-horizontal" action="${request.application_url}/forgot" method="POST">
        <div class="control-group">
            <label class="control-label" for="email">Email</label>
            <div class="controls">
                <input type="email" maxlength="100" name="email" value="${email}">
            </div>
        </div>

        <input class="btn btn-inverse" type="submit" name="forgot.submit" value="Reset"/>
    </form>
</%block>
