<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">

<div class="row-fluid">

  <%include file="pyconca:templates/message.mako"/>

  <div class="content-holder">
    <div class="row-fluid">
      <div class="content-section" style="padding-bottom:300px;">

        <h1>Login</h1>

          <form class="form-horizontal" action="${request.application_url}/login" method="POST">
              <input type="hidden" name="came_from" value="${came_from}"/>

              <div class="control-group">
                  <label class="control-label form-label" for="username">Username</label>
                  <div class="controls">
                    <input type="text" maxlength="100" name="username" value="${username}">
                  </div>
              </div>

              <div class="control-group">
                  <label class="control-label form-label" for="password">Password</label>
                  <div class="controls">
                      <input type="password" maxlength="100" name="password">
                      <br>
                      <br>
                      <a href="${request.application_url}/forgot">Forgot your password?</a>
                  </div>
              </div>

              <input class="btn btn-success" type="submit" name="login.submit" value="Login"/>
          </form>

      </div>
    </div>
  </div>
</div>

</%block>
