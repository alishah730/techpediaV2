<html ng-app="techpedia">
<head>
</head>
<jsp:include page="template/NewHeader.jsp" />
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
.animate_div {
	display: inline-block;
}

.breadcrumb>li+li:before {
	padding: 0 5px;
	color: #ccc;
	content: none;
}

.paginationclass {
	margin: 15px 28px;
}

.paginationclass div {
	border-bottom: 1px solid silver;
}

.paginationclass span {
	margin: 0px 15px;
	display: inline-block;
	padding: 5px 0px;
	text-align: left;
	width: 70px;
}

.pagination-controle li {
	display: inline-block;
}

.pagination-controle button {
	width: 63px;
	font-size: 12px;
	margin-left: 13px;
	cursor: pointer;
}

.pagination-div {
	margin-left: 20px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('animate_div').mouseenter(function() {
			$(this).animate({
				height : '+=10px'
			});
		});
		$('animate_div').mouseleave(function() {
			$(this).animate({
				height : '-=10px'
			});
		});

	});
</script>
<div class="clearfix"></div>
<div class="container customFont borderRadius style">
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar-wrapper">
			<%-- <jsp:include page="template/dashboardMenu.jsp" /> --%>
		</div>

		<div class="page-content-wrapper" ng-controller="TeamsController"
			ng-init="InitLoad()">
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">
							<i class="fa fa-share" id="icon-size"></i> Team Details
							<!-- <small>dashboard & statistics</small> -->
						</h3>
						<ul class="page-breadcrumb breadcrumb">
							<li><a href="./">Home</a> &raquo;</li>
							<li><a href="dashboard">Dashboard</a> &raquo;</li>
							<li>Teams</li>

							<!-- <li class="pull-right">
							<div id="dashboard-report-range" class="dashboard-date-range tooltips"
								data-placement="bottom" data-original-title="Change dashboard date range">
								<i class="icon-calendar"></i> <span></span> <i class="fa fa-angle-down"></i>
							</div>
						</li> -->
						</ul>

					</div>
				</div>
				<div class="clearfix"></div>

				<div class="row-fluid">
					<div class="panel panel-default">
						<!-- Default panel contents -->




						<div class="col-md-12">
							<div class="panel-heading col-md-6">
								Team Cloud&nbsp;<i class="fa fa-cloud" style="font-size: 26px;"></i>
							</div>
							<div class="panel-heading col-md-6" style="float: left">
								<div class=" pull-right">
									<i style="font-size: 25px;" class="fa fa-filter"></i>&nbsp;<input
										style="border-radius: 5px;" type="text"
										ng-model="filterSearch">
								</div>
							</div>
						</div>
						<hr>

						<div class="panel-body" ng-show="teams.length == null">This
							user does not belong to any team</div>

						<!-- List group -->
						<!-- <div class="col s12" ng-show="teams.length>0"> -->
						<%-- <div ng-show="teams.length>0" class="col s12 animate_div"
							style="border-radius: 8px; height: 236px; background-color: #ffffff; margin-left: 20px; margin-top: 20px; display: inline-block; border-bottom-left-radius: 12px; border-top-right-radius: 12px;"
							ng-repeat="team in teams | filter:filterSearch"
							ng-click=clickTeam(team)>

							<!-- <div style="float: left; padding-left: 12px;"> -->
							<img
										src="${pageContext.request.contextPath}/image/{{project.photo1Path ||'defaultImage/placeholder.png'}}"
										alt=""
										style="height: 222px; width: 235px; position: absolute; z-index: 0;" />
							<img src="images/projec.jpg" alt=""
								style="height: 222px; width: 235px; position: absolute; z-index: 0;" />
							<div
								style="margin-top: 167px; padding-top: 13px; bottom: 0; left: 0; width: 235px; height: 54px; position: relative; text-align: center; color: white; font-weight: bolder; opacity: 0.7; filter: alpha(opacity = 70); z-index: 4; background-color: black;">{{team.teamName}}
							</div>
							<!-- </div> -->
						</div> --%>

						<div ng-init="showData()">

							<ul>
								<li class="col s12" ng-click=clickTeam(team)
									style="width: 210px; border-radius: 8px; height: 180px; background-color: #ffffff; margin-left: 20px; margin-top: 20px; display: inline-block; border-bottom-left-radius: 12px; border-top-right-radius: 12px;"
									ng-repeat="team in teams | filter:filterSearch  | pagination : currentPage*itemsPerPage | limitTo: itemsPerPage">
									<a href="#"><img src="images/projec.jpg" alt=""
										style="height: 160px; width: 210px; position: absolute; z-index: 0; border-bottom-left-radius: 15px; border-top-right-radius: 15px;" />
										
										<%-- src="${pageContext.request.contextPath}/image/{{team.photo1Path||'defaultImage/placeholder'}}" --%>

										<%-- <img ng-file="file"
										ng-show="(member.photo=='data:undefined;base64,undefined')||(member.photo=='Photo path')"
										src="images/profile_icon.png"
										style="height: 175px; width: 235px; z-index: 0; border-radius: 8px; z-index: 0;"
										width=100% /> 
										<img ng-file="file"
										ng-hide="(member.photo=='data:undefined;base64,undefined')||(member.photo=='Photo path')"
										style="height: 175px; width: 235px; z-index: 0; border-radius: 8px; z-index: 0;"
										src="${pageContext.request.contextPath}/image/{{project.photo1Path||'images/profile_icon.png'}}" width=100% /> --%>


										<div
											style="margin-top: -15px; margin-right: 50px; bottom: 0; right: 0; width: 95px; height: 15px; position: relative; text-align: center; color: white;; opacity: 0.7; filter: alpha(opacity = 70); z-index: 4; background-color: black; border-radius: 10px;">
											<!-- {{team.projStatusId}} -->
											<!-- <span ng-show="{{team.projStatusId==0||team.projStatusId==1}}"><i class="fa fa-arrow-up"></i>&nbsp;On Progress</span> -->
											<span
												ng-show="{{team.projStatusId==2||team.projStatusId==3 ||team.projStatusId==0||team.projStatusId==1}}"><i
												class="fa fa-dot-circle-o" style="color: green"></i>&nbsp;Active</span>
											<span ng-show="{{team.projStatusId==4}}"><i
												class="fa fa-dot-circle-o" style="color: red;"></i>&nbsp;Inactive</span>
										</div> <!-- <div style="clear: both;"></div> -->
										<div
											style="margin-top: 107px; padding-top: 6px; bottom: 0; left: 0; width: 209px; height: 54px; position: relative; text-align: center; color: white; font-family: arial; opacity: 0.7; filter: alpha(opacity = 70); z-index: 4; background-color: black; border-bottom-left-radius: 15px; overflow: hidden; text-overflow:">
											<p>
												<i class="fa fa-users"></i>&nbsp;{{team.teamName}}
											</p>
											<div class="clearfix"></div>
											<p style="margin-top: -7px;">
												<i class="fa fa-cogs"></i>&nbsp;{{team.projTitle ||'No
												Project Title'}}
											</p>
										</div> </a>
								</li>
							</ul>



							<div class="pagination-div pull-right">
								{{pageCount}}
								<ul class="pagination">
									<li ng-class="DisablePrevPage()"><a href
										ng-click="prevPage()"><i class="fa fa-backward"></i>&nbsp;Prev</a></li>
									<li ng-repeat="n in range()"
										ng-class="{active: n == currentPage}" ng-click="setPage(n)">
										<a href="#">{{n+1}}</a>
									</li>
									<li ng-class="DisableNextPage()"><a href
										ng-click="nextPage()">Next&nbsp;<i class="fa fa-forward"></i></a></li>
								</ul>

							</div>



						</div>



					</div>
				</div>










				<!-- </div> -->





				<!-- <ul class="list-group" ng-show="teams.length>0">
							<a class="random_color"
								ng-repeat="team in teams | filter:filterSearch"
								ng-click=clickTeam(team)
								style="margin-top: 3px; margin-bottom: 3px; margin-left: 3px; margin-right: 3px;">{{team.teamName}}
								<button style="float: right;" class="btn btn-sm btn-info" ng-click=clickTeam(team)>View
								Team</button>
							</a>


						</ul> -->






				<!-- 					<div class="module-body" >
<div class="row-fluid">
<div class="span12">
<span id="likedUser"></span>
<span><a class="btn btn-large btn-success" href="team details" target="_parent">Team NAme</a> </span>

</div>
</div>
</div> -->



			</div>
		</div>
		<div class="clearfix"></div>

		<!-- END CONTAINER
BEGIN FOOTER -->
	</div>
</div>
</div>
</div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="../../assets/global/plugins/respond.min.js"></script>
<script src="../../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->

</body>









<!-- END BODY -->
<!-- <script>
	jQuery.noConflict();
</script> -->
</html>
<jsp:include page="template/footer.jsp" />
