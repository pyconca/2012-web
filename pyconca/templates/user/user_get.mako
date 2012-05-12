<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">

<div class="row-fluid">
    <div class="span12">
        <br>
        <h1><a href=${index_url}>users</a> / <span>${user.username}</span></h1>
        <hr>

        <strong>Name:</strong>
        <span>${user.first_name}</span>
        <span>${user.last_name}</span>

        <br>
        <strong>Email Address:</strong>
        <span>${user.email}</span>

        <br>
        <strong>Username:</strong>
        <span>${user.username}</span>

        <br>
        <br>
        <form action="${user.delete_url}" method="POST">
            <a class="btn btn-primary" href='${user.update_url}'>Edit</a>
            <input class="btn" type="submit" value="Delete"/>
        </form>
    </div>
</div>

</%block>
