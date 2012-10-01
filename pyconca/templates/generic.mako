<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">

<div class="row-fluid">
  <div class="span12 sub-header-container">
    <div class="row-fluid sub-header-image">
      <div class="span12 top-row">
        <br>
        <h1 class="header-main-text">${_(u"PyCon Canada")}</h1>
        <h2 class="header-sub-text">${_(u"Toronto, November 9th - 11th 2012")}</h2>
        <h3 class="header-sub-text">${_(u"Bringing the Python Canada community together")}</h3>
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
