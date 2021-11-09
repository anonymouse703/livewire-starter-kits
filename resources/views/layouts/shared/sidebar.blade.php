<div class="col-md-3 left_col">
  <div class="left_col scroll-view">
    <div class="navbar nav_title" style="border: 0;">
      <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>TOURIST INN</span></a>
    </div>

    <div class="clearfix"></div>

    <!-- menu profile quick info -->
    <div class="profile clearfix">
      <div class="profile_pic">
        <img src="{{auth()->user()->profile ? asset('/img/'.$user->user) : asset('img/user.png')}}" alt="..." class="img-circle profile_img">
      </div>
      <div class="profile_info">
        <span>Welcome,</span>
        <h2>{{ auth()->user()->name }}</h2>
      </div>
    </div>
    <!-- /menu profile quick info -->

    <br />

    <!-- sidebar menu -->
    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
      <div class="menu_section">
        <h3>BOHOL COOP TOURIST INN-</h3>
        <ul class="nav side-menu">
          <li><a  href="{{route('dashboard')}}"><i class="fa fa-home"></i> Dashboard </a></li>
          <li><a  href="{{route('sample')}}"><i class="fa fa-settings"></i> Sample Component </a></li>
          <li><a href=""><i class="fa fa-money"></i> Billing </a></li>
          <li><a href="{{route('client')}}"><i class="fa fa-user-plus"></i> Customer Information File </a></li>
          <li><a><i class="fa fa-bed"></i></i> Check-In Management<span class="fa fa-chevron-down"></span></a>
            <ul class="nav child_menu">
              <li><a href="form.html">Reservation</a></li>
              <li><a href="">Walk-In</a></li>
            </ul>
          </li>
          <li><a href=""><i class="fa fa-cutlery" aria-hidden="true"></i></i> Restaurants </a></li>
          <li><a href=""><i class="fa fa-calendar-plus-o"></i></i> Events </a></li>
          <li><a href=""><i class="fa fa-car"></i></i> Parking </a></li>
          <li><a><i class="fa fa-user-times"></i> Users Management<span class="fa fa-chevron-down"></span></a>
            <ul class="nav child_menu">
              <li><a href="">New User</a></li>
              <li><a href="">Roles</a></li>
              <li><a href="">Permission</a></li>
            </ul>
          </li>
          <li><a><i class="fa fa-bars"></i> Room Settings<span class="fa fa-chevron-down"></span></a>
            <ul class="nav child_menu">
              <li><a href="e_commerce.html">Room Rules</a></li>
              <li><a href="{{route('room-category')}}">Room Category</a></li>
            </ul>
          </li>
        </ul>
      </div>

    </div>
    <!-- /sidebar menu -->

    <!-- /menu footer buttons -->
    <div class="sidebar-footer hidden-small">
      <a data-toggle="tooltip" data-placement="top" title="Settings">
        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
      </a>
      <a data-toggle="tooltip" data-placement="top" title="FullScreen">
        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
      </a>
      <a data-toggle="tooltip" data-placement="top" title="Lock">
        <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
      </a>
      <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
      </a>
    </div>
    <!-- /menu footer buttons -->
  </div>
</div>