<%inherit file="base.mako"/>

<%block name="content">

<div class="row-fluid sub-header-image">
  <div class="span12 top-row">
        <h1 class="header-main-text"><%block name="title"/></h1>
        <h2 class="header-sub-text">PyCon Canada 2012</h2>
        <h2 class="header-sub-text">Toronto, November 9th - 11th</h2>
  </div>
</div>

<div class="row-fluid">
  <div class="content-holder">

    <div class="row-fluid">
        <div class="span9">
            <br>
            <h1><%block name="header"/></h1>
            <br>
        </div>
        <div class="span3">
            <br>
            <%block name="header_right"/>
        </div>
        <hr>
    </div>

    <div class="row-fluid">
      <div class="span12">
        <%include file="pyconca:templates/message.mako"/>
        <%block name="form"/>
      </div>
    </div>

  </div>
</div>

</%block>
