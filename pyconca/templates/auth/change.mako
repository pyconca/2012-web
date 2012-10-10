<%inherit file="pyconca:templates/generic.mako"/>

<%block name="header">
    Change your password
</%block>

<%block name="form">
    <form class="form-horizontal" action="${request.application_url}/change" method="POST">

      <div class="control-group">
        <label class="control-group form-label" for="current_password">Current Password</label>
        <div class="controls">
          <input type="password" maxlength="100" name="current_password" id="current_password" value="">
        </div>
        <br>

        <label class="control-label form-label" for="password1">New Password</label>
        <div class="controls">
          <input type="password" maxlength="100" name="password1" id="password1" value="">
        </div>

        <label class="control-label form-label" for="password2">Re-type Password</label>
        <div class="controls">
          <input type="password" maxlength="100" name="password2" id="password2" value="">
        </div>
      </div>

      <input class="btn btn-inverse" type="submit" name="change.submit" value="Change"/>

    </form>
</%block>
