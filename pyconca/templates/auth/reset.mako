<%inherit file="pyconca:templates/generic.mako"/>

<%block name="head_title">
  ${_(u"Reset Your Password")}
</%block>

<%block name="title">
  ${_(u"Reset Your Password")}
</%block>

<%block name="form">
  <form class="form-horizontal" action="${request.application_url}/reset" method="POST">

    <input type="hidden" id="username" name="username" value="${user.username}" />
    <input type="hidden" id="code" name="code" value="${user.activation.code}" />

    <div class="control-group">
      <label class="control-label form-label" for="password1">New Password</label>
      <div class="controls">
        <input type="password" maxlength="100" name="password1" id="password1" value="">
      </div>
    </div>

    <div class="control-group">
        <label class="control-label form-label" for="password2">Re-type Password</label>
      <div class="controls">
        <input type="password" maxlength="100" name="password2" id="password2" value="">
      </div>
    </div>

    <div class="controls">
      <input class="btn btn-success" type="submit" name="reset.submit" value="Reset"/>
    </div>

  </form>
</%block>
