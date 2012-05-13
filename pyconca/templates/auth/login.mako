<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">

<div class="row-fluid">
    <div class="span12">
        <br>
        <h1>Login</h1>
        <hr>

        <form action="${request.application_url}/login" method="POST">
            <input type="hidden" name="came_from" value="${came_from}"/>
            <input type="text" name="login" value="${login}"/><br/>
            <input type="password" name="password"
                   value="${password}"/><br/>
            <input class="btn" type="submit" name="login.submit" value="Login"/>
        </form>

    </div>
</div>

</%block>
