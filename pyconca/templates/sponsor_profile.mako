<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">

<div class="row-fluid">
  <div class="span12 sub-header-container">
    <div class="row-fluid sub-header-image">
      <div class="span12 top-row">
        <h1 class="header-main-text"><%block name="title"/></h1>
        <h2 class="header-sub-text">${_(u"PyCon Canada 2012")}</h2>
        <h2 class="header-sub-text">${_(u"Toronto, November 9th - 13th")}</h2>
      </div>
    </div>
  </div>
</div>

<div class="row-fluid content-section">
      <div class="span12">
        <div class="content-holder">
            <%block name="info"/>
        </div>
  </div>
</div>

</%block>
