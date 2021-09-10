<x-app-layout>
    <!-- top tiles -->
    <div class="row" style="display: inline-block;" >
        <div class="tile_count">
            <div class="col-md-2 col-sm-4  tile_stats_count">
            <span class="count_top"><i class="fa fa-user"></i> Total Users</span>
            <div class="count">2500</div>
            <span class="count_bottom"><i class="green">4% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
            <span class="count_top"><i class="fa fa-clock-o"></i> Average Time</span>
            <div class="count">123.50</div>
            <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
            <span class="count_top"><i class="fa fa-user"></i> Total Males</span>
            <div class="count green">2,500</div>
            <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
            <span class="count_top"><i class="fa fa-user"></i> Total Females</span>
            <div class="count">4,567</div>
            <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
            <span class="count_top"><i class="fa fa-user"></i> Total Collections</span>
            <div class="count">2,315</div>
            <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
            <span class="count_top"><i class="fa fa-user"></i> Total Connections</span>
            <div class="count">7,325</div>
            <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
        </div>
    </div>      
    <!-- /top tiles -->

    <!-- Chart -->
    <div class="row">
        <div class="col-md-12 col-sm-12 ">
            <div class="dashboard_graph">

            <div class="row x_title">
                <div class="col-md-6">
                <h3>Network Activities <small>Graph title sub-title</small></h3>
                </div>
                <div class="col-md-6">
                <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                    <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                </div>
                </div>
            </div>

            <div class="col-md-9 col-sm-9 ">
                <div id="chart_plot_01" class="demo-placeholder"></div>
            </div>
            <div class="col-md-3 col-sm-3  bg-white">
                <div class="x_title">
                <h2>Top Campaign Performance</h2>
                <div class="clearfix"></div>
                </div>

                <div class="col-md-12 col-sm-12 ">
                <div>
                    <p>Facebook Campaign</p>
                    <div class="">
                    <div class="progress progress_sm" style="width: 76%;">
                        <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="80"></div>
                    </div>
                    </div>
                </div>
                <div>
                    <p>Twitter Campaign</p>
                    <div class="">
                    <div class="progress progress_sm" style="width: 76%;">
                        <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="60"></div>
                    </div>
                    </div>
                </div>
                </div>
                <div class="col-md-12 col-sm-12 ">
                <div>
                    <p>Conventional Media</p>
                    <div class="">
                    <div class="progress progress_sm" style="width: 76%;">
                        <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="40"></div>
                    </div>
                    </div>
                </div>
                <div>
                    <p>Bill boards</p>
                    <div class="">
                    <div class="progress progress_sm" style="width: 76%;">
                        <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                    </div>
                    </div>
                </div>
                </div>

            </div>

            <div class="clearfix"></div>
            </div>
        </div>

        </div>
          <!--End of Chart-->
</x-app-layout>
