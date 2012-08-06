<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">

<div class="row-fluid">
  <div class="span12 sub-header-container">
    <div class="row-fluid sub-header-image">
      <div class="span12 top-row">
        <br>
        <h1 class="header-main-text">PyCon Canada</h1>
        <h2 class="header-sub-text">Toronto, November 9th - 11th 2012</h2>
      </div>
    </div>
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
