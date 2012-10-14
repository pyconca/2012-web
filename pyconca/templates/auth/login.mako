<%inherit file="pyconca:templates/generic.mako"/>

<%block name="head_title">
    ${_(u"Login")}
</%block>

<%block name="title">
    ${_(u"Login")}
</%block>

<%block name="form">

  <form class="form-horizontal" action="${request.application_url}/login" method="POST">
      <input type="hidden" name="came_from" value="${came_from}"/>

      <div class="control-group">
          <label class="control-label form-label" for="username">Username</label>
          <div class="controls">
            <input type="text" maxlength="100" name="username" id="username" value="${username}">
          </div>
      </div>

      <div class="control-group">
          <label class="control-label form-label" for="password">Password</label>
          <div class="controls">
              <input type="password" maxlength="100" name="password" id="password">
              <br>
              <a href="${request.application_url}/forgot" class="small-text">Forgot your password?</a>
          </div>
      </div>

      <div class="controls">
        <input class="btn btn-success" type="submit" name="login.submit" value="Login"/>
      </div>
  </form>
<script>
$(document).ready(function () {
    $('#username').focus();
});
</script>
</%block>
