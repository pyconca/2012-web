<%inherit file="pyconca:templates/generic.mako"/>

<%block name="header">
    Reset your password
</%block>

<%block name="form">
  <form class="form-horizontal" action="${request.application_url}/reset" method="POST">

      <input type="hidden" id="username" name="username" value="${user.username}" />
      <input type="hidden" id="code" name="code" value="${user.activation.code}" />

    <div class="control-group">
      <label class="control-group form-label" for="password1">New Password</label>
      <div class="controls">
        <input type="password" maxlength="100" name="password1" id="password1" value="">
      </div>
        <label class="control-group form-label" for="password2">Re-type Password</label>
      <div class="controls">
        <input type="password" maxlength="100" name="password2" id="password2" value="">
      </div>
    </div>
    <input class="btn btn-inverse" type="submit" name="reset.submit" value="Reset"/>

  </form>
</%block>
