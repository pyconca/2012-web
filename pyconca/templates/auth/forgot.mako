<%inherit file="pyconca:templates/generic.mako"/>

<%block name="head_title">
  ${_(u"Password Reset")}
</%block>

<%block name="title">
  ${_(u"Password Reset")}
</%block>

<%block name="form">

    <div class="note">
        <p>To reset your password, please submit your email address you used to
            register in the form below and a reset link will be emailed to you.</p>
    </div>

    <form class="form-horizontal" action="${request.application_url}/forgot" method="POST">
        <div class="control-group">
            <label class="control-label" for="email">Email</label>
            <div class="controls">
                <input type="email" maxlength="100" name="email" value="${email}">
            </div>
        </div>

      <div class="controls">
        <input class="btn btn-success" type="submit" name="forgot.submit" value="Reset"/>
      </div>
    </form>
</%block>
