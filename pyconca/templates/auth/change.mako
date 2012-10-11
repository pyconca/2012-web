<%inherit file="pyconca:templates/generic.mako"/>

<%block name="head_title">
  ${_(u"Change Your Password")}
</%block>

<%block name="title">
  ${_(u"Change Your Password")}
</%block>

<%block name="form">
    <form id="edit-form" class="form-horizontal" action="${request.application_url}/change" method="POST">

      <div class="control-group">
        <label class="control-label" for="current_password">Current Password</label>
        <div class="controls">
          <input type="password" maxlength="100" name="current_password" id="current_password" value="">
        </div>
      </div>
      <br>

      <div class="control-group">
        <label class="control-label" for="password1">New Password</label>
        <div class="controls">
          <input type="password" maxlength="100" name="password1" id="password1" value="">
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="password2">Re-type Password</label>
        <div class="controls">
          <input type="password" maxlength="100" name="password2" id="password2" value="">
        </div>
      </div>

    <div class="controls">
      <input class="btn btn-success" type="submit" name="change.submit" value="Change"/>
    </div>

    </form>
</%block>
