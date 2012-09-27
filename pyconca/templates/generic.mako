<%inherit file="pyconca:templates/base.mako"/>

<%block name="content">
<div class="container">
  <div class="row-fluid">
    <section id="MainContent" class="span9">
      <header>
        <hgroup class="clearfix">
          <h1><%block name="header"/></h1>
          <div id="DateAndPlace"><b>${_(u"PyCon Canada 2012")}</b><br>
          ${_(u"November 9 – 11, 2012 • Toronto")}</div>
        </hgroup>
      </header>
      <div class="gutter-top gutter-bottom">
        <%block name="header_right"/>
      </div>
      <%include file="pyconca:templates/message.mako"/>
      <%block name="form"/>
    </section>
  </div>
</div>
</%block>
