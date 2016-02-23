<%@page import="java.util.ArrayList"%>
<html ng-app="techpedia">
<jsp:include page="template/NewHeader.jsp" />
<div class="clearfix"></div>
<div class="container customFont borderRadius style" >
<div class="page-container">
	<div class="page-sidebar-wrapper">
		<%-- <jsp:include page="template/dashboardMenu.jsp" /> --%>
	</div>
	<div class="page-content-wrapper" ng-controller="MentorDetailsController" ng-init="initLoad()">
		<div class="page-content">
			<div class="row">
				<div class="col-md-12">

					<!-- <h3 class="page-title">
						<i class="fa fa-user" id="icon-size"></i> Mentors Details
					</h3> -->
					
					<ul class="page-breadcrumb breadcrumb">
						<%
							if (session.getAttribute("username") != null) {
						%>
						<li><a href="./">Home</a> &raquo;
						<a href="dashboard">Dashboard</a> &raquo;
						<a href="mentors">Mentors</a> &raquo;
						Mentors Details</li>
						
						<!-- <li class="pull-right">
							<div id="dashboard-report-range" class="dashboard-date-range tooltips"
								data-placement="bottom" data-original-title="Change dashboard date range">
								<i class="icon-calendar"></i> <span></span> <i class="fa fa-angle-down"></i>
							</div>
						</li> -->
						<%
							} else {
						%><li><a href="./">Home</a> &raquo;</li>
						<li><a href="mentors">Mentors</a> &raquo;</li>
						<li>Mentors Details</li>
						<li class="right"><a href="mentors">View all Mentors</a></li>
						<%
							}
						%>
					</ul>

				</div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<!-- PROJECT DESCRIPTION-->
				
				<!-- end main content-->
				<!-- SLIDER-->

				<div class="col-md-1">&nbsp;</div>
				<div class="col-md-4"><br><br>

					<div>						
						<img  ng-show="(mentor.photo=='data:undefined;base64,undefined')||(mentor.photo=='Photo path')" src="images/profile_icon.png" class="mentorpic img-responsive" alt="" style="width:320px; height:320px;"/>
									
						<img class="mentorpic img-responsive" ng-hide="(mentor.photo=='data:undefined;base64,undefined')||(mentor.photo=='Photo path')" 
							src="{{mentor.photo||'images/UserDefault.jpg'}}" style="width:320px; height:320px;border-radius:8px;box-shadow: 0 0 .5em #b2b2b2;" /> <br />
					</div>
					<br />
					<div class="col-md-3">
						<h5 style="font-size:14px;margin-top: -1px;color:#006993;font-weight:700;font-style:sans-serif;text-transform: capitalize;">Popularity</h5>
					</div>

					<div class="col-md-7">
						<!-- <div class="progress">
							<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
								aria-valuenow=" {{mentor. popularity}}" aria-valuemin="0" aria-valuemax="100" style="width:" {{mentor. popularity}}"%">
								<span class="sr-only"> {{mentor. popularity}}%</span>
							</div>
						</div> -->
						<div class="progress">
							<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
								aria-valuenow="{{mentor.popularity}}" aria-valuemin="0" aria-valuemax="100" style="width:{{mentor.popularity}}%">
								<span class="sr-only">{{mentor.popularity}}%</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="sectiontitle" >
					<div style="height:20px;background-color:#18404c;box-shadow: 0 0 .5em #b2b2b2;">
						<h4 style="color:#fff;font-weight:700; margin-left:10px;text-transform: capitalize;">{{mentor.firstName}} {{mentor.midName}} {{mentor.lastName}}</h4>
					</div></div>

					<div class="panel panel-info">
						<!-- Default panel contents -->

						<!-- Table -->
						<table class="table" style="background-color: #3f94ae;color: #ffffff;box-shadow: 0 0 .5em #b2b2b2;">
							<tr>
								<td>Address</td>
								<td>{{mentor.addrLn1}} {{mentor.addrLn2}}</td>
							</tr>
							<tr>
								<td>City</td>
								<td>{{mentor.city}}</td>
							</tr>
							<tr>
								<td>State</td>
								<td>{{mentor.state}}</td>
							</tr>
							<tr>
								<td>Country</td>
								<td>{{mentor.country}}</td>
							</tr>
							<tr>
								<td>PinCode</td>
								<td>{{mentor.pincode}}</td>
							</tr>

							<tr>
								<td>Degree</td>
								<td>{{mentor.degreeOfMentor}}</td>
							</tr>
							<tr>
								<td>Experience</td>
								<td>{{mentor.professionalExperience}}</td>
							</tr>
							<tr>
								<td>Association</td>
								<td>{{mentor.institutionalAssctnInfo}}</td>
							</tr>

							<tr>
								<td>Designation</td>
								<td>{{mentor.designationOfMentor}}</td>
							</tr>
							
							<tr>
								<td>Facebook ID</td>
								<td><a href="{{mentor.faceBookId}}">{{mentor.faceBookId}}</a></td>
							</tr>
							
							<tr>
								<td>Twitter ID</td>
								<td><a href="{{mentor.twitterId}}">{{mentor.twitterId}}</a></td>
							</tr>
							
							<tr>
								<td>LinkedIn ID</td>
								<td><a href="{{mentor.linkedinId}}">{{mentor.linkedinId}}</a></td>
							</tr>
						</table>
					</div>

				</div>
				<!-- end sliderr-->
			</div>
			<div class="clearfix"></div>

			<!-- END CONTAINER
BEGIN FOOTER -->

		</div>
	</div>
</div>
<div class="modal fade bs-modal-sm" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" style="padding-bottom: 10px" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>

			</div>
			<div class="bs-example bs-example-tabs">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#signin" data-toggle="tab">Sign In</a></li>
					<li class=""><a href="#signup" data-toggle="tab">Forgot Password</a></li>

				</ul>
			</div>
			<div class="modal-body">
				<div id="myTabContent" class="tab-content">

					<div class="tab-pane fade active in" id="signin">
						<form id="login-form" method="post">
							<fieldset>
								<!-- Sign In Form -->
								<!-- Text input-->
								<div class="control-group">
									<label class="control-label" for="userid">Username:</label>
									<div class="controls">
										<input id="username" name="username" type="text" class="form-control"
											placeholder="username" class="input-medium" required="required">
									</div>
								</div>

								<!-- Password input-->
								<div class="control-group">
									<label class="control-label" for="passwordinput">Password:</label>
									<div class="controls">
										<input id="password" name="password" class="form-control" type="password"
											placeholder="password" class="input-medium">
									</div>
								</div>

								<!-- Multiple Checkboxes (inline) -->
								<div class="control-group">
									<label class="control-label" for="rememberme"></label>
									<div class="controls">
										&nbsp;&nbsp;&nbsp; <label class="checkbox inline" for="rememberme-0"> <input
											type="checkbox" name="rememberme" id="rememberme-0" value="Remember me" />Remember me
										</label>
									</div>
								</div>

								<!-- Button -->
								<div class="control-group">
									<label class="control-label" for="signin"></label>
									<div class="controls">
										<input type="submit" class="btn btn-success" id="login-submit" value="Login" />
										<div id="login-error-div" style="color: red;"></div>
									</div>
								</div>

							</fieldset>
						</form>
					</div>
					<div class="tab-pane fade" id="signup">
						<form class="form-horizontal" method="post">
							<fieldset>

								<div class="control-group">
									<label class="control-label" for="Email">Please enter your registered Email:</label>
									<div class="controls">
										<input id="email" name="email" class="form-control" type="text" placeholder="xyz@abc.com"
											class="input-large" required="required">
										<div id="forgot-password-div" style="color: red;"></div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="confirmsignup"></label>
									<div class="controls">
										<input type="submit" name="submit" class="btn btn-success" value="Submit"
											id="forgot-password" />
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	</div>
	</div>
	</body>
</html>
<jsp:include page="template/footer.jsp" />
