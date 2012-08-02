<%inherit file="base.mako"/>

<%block name="content">

<div class="row-fluid sub-header-image">
  <div class="main-row">
    <div class="top-row-sub">
      <h1 class="header-main-text">Venue</h1>
    </div>
  </div>
</div>

<div class="row-fluid">
  <div class="content-holder">
    <div class="row-fluid">
      <div class="span3">
        <ul id="venue-sidenav" class="nav sidenav"></ul>
      </div>

      <div class="span9 content-column">
        <div class="row-fluid content-section">
            <h1 class="header" id="directions">Address</h1>
              <iframe width="500" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Beverley+Halls+SPK,+206+Beverley,+Toronto,+ON,+Canada&amp;aq=0&amp;oq=beverley+halls&amp;sll=43.65638,-79.402763&amp;sspn=0.00902,0.022724&amp;ie=UTF8&amp;hq=Beverley+Halls+SPK,+206+Beverley,+Toronto,&amp;hnear=Canada&amp;t=m&amp;ll=43.66188,-79.390812&amp;spn=0.011177,0.032659&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe><br />
              <small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Beverley+Halls+SPK,+206+Beverley,+Toronto,+ON,+Canada&amp;aq=0&amp;oq=beverley+halls&amp;sll=43.65638,-79.402763&amp;sspn=0.00902,0.022724&amp;ie=UTF8&amp;hq=Beverley+Halls+SPK,+206+Beverley,+Toronto,&amp;hnear=Canada&amp;t=m&amp;ll=43.66188,-79.390812&amp;spn=0.011177,0.032659&amp;z=15&amp;iwloc=A" style="color:#0000FF;text-align:left">View Larger Map</a></small>
        </div> <!-- content-section -->

        <div class="row-fluid content-section">
            <h1 class="header" id="food-and-drink">Food & Drink</h1>

            <table id="fb-table">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Address</th>
                  <th>Description</th>
                </tr>
              </thead>

              <tbody>
                <tr>
                  <td>Einstein Cafe and Pub</td>
                  <td>229 College Street</td>
                  <td>Student pub</td>
                </tr>

                <tr>
                  <td>Free Times Cafe</td>
                  <td>320 College Street</td>
                  <td>Pub, Middle Eastern</td>
                </tr>

                <tr>
                  <td>O'Grady's Tap and Grill</td>
                  <td>171 College Street</td>
                  <td>Irish pub</td>
                </tr>

                <tr>
                  <td>Sin and Redemption</td>
                  <td>136 McCaul Street</td>
                  <td>Belgian-style pub</td>
                </tr>
              </tbody>
            </table>

        </div> <!-- content section -->
    </div> <!-- content column -->
  </div> <!-- content-holder -->
</div> <!-- row-fluid -->

<script>
  function createSidenav() {
    $(".header").each(function() {
      var navItemHolder = $("<li></li>");
      var navItem = $("<a></a>");

      navItem
        .text($(this).text())
        .addClass("sidenav-item")
        .attr("href", "#" + $(this).attr("id"));

      navItemHolder.append(navItem);
      $("#venue-sidenav").append(navItemHolder);
    });
  };

  $(document).ready(function() {
    createSidenav();
  });
</script>

</%block>
