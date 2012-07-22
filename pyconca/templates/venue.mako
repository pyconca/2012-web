<%inherit file="base.mako"/>

<%block name="content">

  <div class="row-fluid">
    <div class="span9">
      <br /><br />
      <h1 class="header" id="directions">How to get here</h1>
      <iframe width="760" height="360" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Beverley+Halls+SPK,+206+Beverley,+Toronto,+ON,+Canada&amp;aq=0&amp;oq=beverley+halls&amp;sll=43.65638,-79.402763&amp;sspn=0.00902,0.022724&amp;ie=UTF8&amp;hq=Beverley+Halls+SPK,+206+Beverley,+Toronto,&amp;hnear=Canada&amp;t=m&amp;ll=43.66188,-79.390812&amp;spn=0.011177,0.032659&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Beverley+Halls+SPK,+206+Beverley,+Toronto,+ON,+Canada&amp;aq=0&amp;oq=beverley+halls&amp;sll=43.65638,-79.402763&amp;sspn=0.00902,0.022724&amp;ie=UTF8&amp;hq=Beverley+Halls+SPK,+206+Beverley,+Toronto,&amp;hnear=Canada&amp;t=m&amp;ll=43.66188,-79.390812&amp;spn=0.011177,0.032659&amp;z=15&amp;iwloc=A" style="color:#0000FF;text-align:left">View Larger Map</a></small>
      <hr>

      <h1 class="header" id="venue-info">Venue information</h1>
        <p>
          ... some info here ...
        </p>
        <p>
          See the official website here: 
          <a target="_blank" href="http://www.beverleyhalls.com/">http://www.beverleyhalls.com/</a>
        </p>
      <hr>
      <h1 class="header" id="food-and-drink">Food and drink</h1>
      <table class="table table-striped">
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
    </div>

    <div class="span3">
      <br /><br />
      <ul class="nav nav-pills nav-stacked" id="venue-sidenav">
      </ul>
    </div>
  </div>

  <script>
    function createSidenav() {
      $(".header").each(function() {
        var navItemHolder = $("<li></li>");
        var navItem = $("<a></a>");
        navItem
          .text($(this).text())
          .addClass("nav-item")
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
