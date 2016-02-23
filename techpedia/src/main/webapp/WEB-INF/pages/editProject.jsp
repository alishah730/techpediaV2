<%@ page import="java.util.Random"%>
<jsp:include page="template/NewHeader.jsp" />
<html ng-app="techpedia">
<style>
 .breadcrumb>li+li:before {
padding: 0 5px;
color: #ccc;
content: none !important;
} 
</style>
<script src="js/script.min.js"></script>
<div class="clearfix"></div>
<div class="container customFont borderRadius style" style="background-color:#ffffff;width:100%;">

<div class="page-container">
	<div class="page-sidebar-wrapper">
	
	</div>
<div class="page-container">
	<div class="page-sidebar-wrapper">
<%-- 		<jsp:include page="template/dashboardMenu.jsp" /> --%>
	</div>
	<div class="page-content-wrapper" ng-controller="EditProjectController" ng-init="InitLoad()">
		<div class="page-content">
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
						<i class="fa fa-briefcase" id="icon-size"></i> Edit Project
					</h3>
					<ul class="page-breadcrumb breadcrumb">
					<li style="color: #262626 !important"><a style="color: #262626 !important" href="./">Home&nbsp;</a> <font style="color: black; font-size:18px;">&raquo;</font></li>
						<li style="color: #262626 !important" ><a  style="color: #262626 !important"  href=dashboard>Dashboard&nbsp;</a><font style="color: black; font-size:18px;">&raquo;</font></li>
						<li style="color: #262626 !important"><a  style="color: #262626 !important"  href="manageProjects">Manage Projects&nbsp;</a><font style="color: black; font-size:18px;">&raquo;</font></li>
						<li style="content:none !important;">Edit Project</li>
						<!-- <li class="pull-right">
							<div id="dashboard-report-range" class="dashboard-date-range tooltips"
								data-placement="bottom" data-original-title="Change dashboard date range">
								<i class="icon-calendar"></i> <span></span> <i class="fa fa-angle-down"></i>
							</div>
						</li> -->
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<div class="row error-place" style="display: none;">
				<div class="col-xs-12">
					<div class="panel panel-danger">
						<div class="panel-heading">Error:</div>
						<div class="panel-body error"></div>
					</div>
				</div>
			</div>
			<!-- END PAGE HEADER-->

			<div class="clearfix"></div>
			<div class="row" >
			
				<div id="accordion" class="col-xs-12">
					<h3 class="acc-gi acc-hover" style="background-color:#217690;font-family:arial;color:#ffffff;">Project Information</h3>
					<div>
						<div class="panel-body">
							<form id="editProjectInformation" name="editProjectInformation" method="post" novalidate>
								<div class="col-xs-12 col-md-6">
									<!-- USER INFO START -->
									<div class="panel panel-default" style="border-style:none;background-color:#f5f5f5">
										<div class="panel-heading" style="border-style:none;font-family:arial;font-weight:bold;">Basic Information</div>
										<div class="panel-body project-basic-info">
											<div class="col-xs-12">
												<div class="input-group input-group-sm">
													<span class="input-group-addon" style="border-right: 1px solid #ccc;width:106px;background-color:#217690;width:130px;font-family:arial;color:#ffffff;">Title *</span> <input
														style="width:319px;" id="projectTitle" name="projTitle" type="text" class="form-control rname"
														placeholder="Project Title" ng-model="edit.projTitle" required />
												</div>
												<div class="alert alert-sm alert-danger alert-dismissible" role="alert"
													ng-show="editProjectInformation.projTitle.$dirty && editProjectInformation.projTitle.$error.required">
													Project Title is required</div>

											</div>
											<!-- <div class="col-xs-12">&nbsp;</div> -->

											 <div class="col-xs-12">
												<div class="input-group input-group-sm">
													<!-- <span class="input-group-addon" style="border-right: 1px solid #ccc">Team</span>  --><input
														  name="projTeamId" type="text"
														class="form-control" placeholder="Team Members" ng-hide="true"
														ng-model="edit.projTeamId"/> 
												</div>

											</div>

											<div class="col-xs-12">&nbsp;</div>

											<div class="col-xs-12">
												<div class="input-group input-group-sm">
													<span class="input-group-addon" style="border-right: 1px solid #ccc;width:106px;background-color:#217690;font-family:arial;color:#ffffff;">Branches</span> <input
														style="width:319px;" id="projectBranches" name="projBranchesString" type="text" class="form-control remail"
														placeholder="Project branches" readonly/>
												</div>
											</div>

											<div class="col-xs-12">&nbsp;</div>

											<div class="col-xs-12">
												<div class="input-group input-group-sm">
													<span class="input-group-addon" style="border-right: 1px solid #ccc;width:106px;background-color:#217690;font-family:arial;color:#ffffff;">Keywords *</span> <input
														style="width:319px;" id="projectKeywords" name="projKeywordsString" type="text" class="form-control"
														placeholder="Keywords" />
												</div>
											</div>
											
											

											<div class="col-xs-12">&nbsp;</div>
											<div class="col-xs-12">
												<div class="input-group input-group-sm">
													 <span class="input-group-addon" style="border-right: 1px solid #ccc;width:106px;background-color:#217690;font-family:arial;color:#ffffff;">Team Name *</span> <input
														style="width:319px;" name="projTeamDesc" type="text" class="form-control"
														placeholder="Team Name" ng-model="edit.projTeamDesc" required
														ng-pattern="/^(\D)+$/" /> 	
												</div>
												 <div class="alert alert-sm alert-danger alert-dismissible" role="alert"
													ng-show="editProjectInformation.projTeamDesc.$dirty && editProjectInformation.projTeamDesc.$error.required">Team
													Members are required</div>
												<div class="alert alert-sm alert-danger alert-dismissible" role="alert"
													ng-show="editProjectInformation.projTeamDesc.$dirty && editProjectInformation.projTeamDesc.$error.pattern">Team
													Members can only contain text</div> 
											</div> 
											<div class="col-xs-12">&nbsp;</div> 
										</div>
									</div>

								</div>

								<div class="col-xs-12 col-md-6">
									<!-- USER INFO START -->
									<div class="panel panel-default" style="border-style:none;background-color:#f5f5f5">
										<div class="panel-heading" style="border-style:none;font-family:arial;font-weight:bold;">Project State Information</div>
										<div class="panel-body project-state-info">
											<div class="col-xs-12">
												<div class="input-group input-group-sm">
													<span class="input-group-addon" style="border-right: 1px solid #ccc;width:106px;background-color:#217690;font-family:arial;color:#ffffff;">Start Date</span> <input
													style="width:319px;"	id="projectStartDate" name="projStartDate" type="text" class="form-control"
														placeholder="Project Start Date(DD-MMM-YYYY)" ng-model="edit.projStartDate" datepicker-angular ng-disabled="true"/>
													<!-- <span class="input-group-addon" style="border-left: 1px solid #ccc">DD-MMM-YYYY</span> -->
												</div>


											</div>

											<div class="col-xs-12">&nbsp;</div>

											<div class="col-xs-12">
												<div class="input-group input-group-sm">
													<span class="input-group-addon" style="border-right: 1px solid #ccc;width:106px;background-color:#217690;font-family:arial;color:#ffffff;">End Date *</span> <input
														style="width:319px;" id="projectEndDate" name="projEndDate" type="" class="form-control"
														placeholder="Project End Date(DD-MMM-YYYY)" ng-model="edit.projEndDate" datepicker-angular required="required"/> <!-- <span
														class="input-group-addon" style="border-left: 1px solid #ccc">DD-MMM-YYYY</span> -->
												</div>
												<div class="alert alert-sm alert-danger alert-dismissible" role="alert"
													ng-show="editProjectInformation.projEndDate.$dirty && editProjectInformation.projEndDate.$error.required">End Date is required</div>

											</div>

											<div class="col-xs-12">&nbsp;</div>
											<div class="col-xs-12">
												<div class="input-group input-group-sm">
													<span class="input-group-addon" style="border-right: 1px solid #ccc;width:106px;background-color:#217690;font-family:arial;color:#ffffff;">Year </span> <input
														style="width:319px;" id="projectYear" name="projYear" type="text" class="form-control"
														placeholder="Project Year" ng-model="edit.projYear" readonly />
												</div>
											</div>

											<div class="col-xs-12">&nbsp;</div>

											<div class="col-xs-12">
												<div class="input-group input-group-sm">
													<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:106px;font-family:arial;color:#ffffff;">Duration</span> <input
														id="projectDuration" name="projDuration" type="text" class="form-control"
														placeholder="Project duration (in months)" ng-model="edit.projDuration" readonly /> <span
														class="input-group-addon" style="border-right: 1px solid #ccc">months</span>
												</div>

											</div>
											<div class="col-xs-12">&nbsp;</div>
										</div>
									</div>

								</div>
								<div class="col-xs-12 col-md-12">
									<div class="panel panel-default" style="border-style:none;background-color:#f5f5f5">
										<div class="panel-heading" style="border-style:none;font-family:arial;font-weight:bold;">Project Abstract *</div>
										<div class="panel-body project-abstract-info" style="border-style:none;background-color:#f5f5f5;">
											<div class="col-xs-12">
												<textarea id="projectAbstract" placeholder="Project abstract..." class="textarea-text" style="width: 920px; height: 100px;
													style="resize: none;" name="projAbstract" rows="3" ng-maxlength="1000" ng-model="edit.projAbstract"
													required></textarea>
												<div class="alert alert-sm alert-danger alert-dismissible" role="alert"
													ng-show="editProjectInformation.projAbstract.$dirty && editProjectInformation.projAbstract.$error.required">Project
													Abstract is required</div>
												<div class="alert alert-sm alert-danger alert-dismissible"
														role="alert"
														ng-show="addProjectInformation.projAbstract.$dirty && addProjectInformation.projAbstract.$error.maxlength">
														Project Title cannot be more than 1000 characters</div>
											</div>
											<div class="col-xs-12">&nbsp;</div>
										</div>
									</div>
								</div>
								<div class="col-xs-12">
									<a href="#" class="btn btn-primary continue-btn" ng-disabled="editProjectInformation.$invalid" style="margin-left: 91%;background-color:#5cb85c;"> Continue
									</a>
								</div>
							</form>
						</div>

					</div>
					<h3 class="acc-pi acc-hover" ng-class="editProjectInformation.$invalid?'ui-state-disabled':'ui-state-default'" style="background-color:#217690;font-family:arial;color:#ffffff;">
					
						Detailed Project Information
					</h3>
					<div>
						<form id="editDetailedProjectInformationForm" name="editDetailedProjectInformationForm" method="post" novalidate>
							<div class="col-xs-12 col-md-12">
								<div class="panel panel-default" style="border-style:none;background-color:#f5f5f5">
									<div class="panel-heading" style="border-style:none;font-family:arial;font-weight:bold;">Project Description *</div>
									<div class="panel-body project-description-info" style="border-style:none;background-color:#f5f5f5;">
										<div class="col-xs-12">
											<textarea id="projectDescription" placeholder="Project description..."
												class="textarea-text" style="resize: none;" name="projDescription" rows="5"
												ng-model="edit.projDescription" required></textarea>
											<div class="alert alert-sm alert-danger alert-dismissible" role="alert"
												ng-show="editDetailedProjectInformationForm.projDescription.$dirty && editDetailedProjectInformationForm.projDescription.$error.required">Project
												Description is required</div>
										</div>
										<div class="col-xs-12">&nbsp;</div>
									</div>
								</div>
							</div>

							<div class="col-xs-12">
								<div class="panel panel-default" style="border-style:none;background-color:#f5f5f5">
									<div id="profession" class="panel-heading" style="border-style:none;font-family:arial;font-weight:bold;">University information</div>
									<div class="panel-body project-detail-info" style="border-style:none;background-color:#f5f5f5;">
										<div class="col-xs-12 col-md-6">
											<div class="input-group input-group-sm">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:106px;font-family:arial;color:#ffffff;">University </span>
												<input name="projUniversity" id="projectUniversity" type="text" class="form-control" style="width:319px;"
													placeholder="Project University" ng-model="edit.university" readonly />
											</div>
										</div>

										<div class="col-xs-12 col-md-6">
											<div class="input-group input-group-sm">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:106px;font-family:arial;color:#ffffff;">College</span> <input
													name="projCollege" id="projectCollege" type="text" class="form-control" style="width:319px;"
													placeholder="Project College" ng-model="edit.collge" readonly  />
											</div>
										</div>

										<div class="col-xs-12">&nbsp;</div>

										<div class="col-xs-12 col-md-6">
											<div class="input-group input-group-sm">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:106px;font-family:arial;color:#ffffff;">State</span> <input
													name="projCollegeState" id="projectCollegeState" type="text" class="form-control" style="width:319px;"
													placeholder="Project College State" ng-model="edit.state" readonly  />
											</div>
										</div>

										<div class="col-xs-12 col-md-6">
											<div class="input-group input-group-sm">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:106px;font-family:arial;color:#ffffff;">Student ID</span> <input
													name="projStudentId" name="userRegisterationNumber" type="text" class="form-control" style="width:319px;"
													placeholder="Student ID" ng-model="edit.studentID" readonly  />
											</div>
										</div>

										<div class="col-xs-12">&nbsp;</div>

										 <div class="col-xs-12 col-md-6">
											<div class="input-group input-group-sm">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:106px;font-family:arial;color:#ffffff;">Faculty</span> <input
													name="projFacultyName" type="text" class="form-control" ng-model="edit.projFacultyName" readonly="readonly" style="width:319px;"
													 />
											</div>

										</div>  
										<div class="col-xs-12">&nbsp;</div>

										 <div class="col-xs-12 col-md-6">
											<div class="input-group input-group-sm">
												<!-- <span class="input-group-addon" style="border-right: 1px solid #ccc">Faculty</span> --> <input
													name="projFaculty" type="text" class="form-control" ng-model="edit.projFaculty" ng-hide="true" readonly="readonly"
													 />
											</div>

										</div>  
									</div>
								</div>
							</div>

							<div class="col-xs-12">
								<div class="panel panel-default"  style="border-style:none;background-color:#f5f5f5">
									<div id="profession" class="panel-heading" style="border-style:none;font-family:arial;font-weight:bold;">Additional Project Information</div>
									<div class="panel-body project-detail-info" style="border-style:none;background-color:#f5f5f5;">
										<div class="col-xs-12 col-md-6">
											<div class="input-group input-group-sm">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:106px;font-family:arial;color:#ffffff;">Cost </span> <input
													id="projectEstimatedCost" name="projEstimationCost" type="text" class="form-control"
													 style="width:319px;" placeholder="Estimated cost" ng-model="edit.projEstimationCost" required
													ng-pattern="/^(\d)+$/" /> <span class="input-group-addon"
													style="border-right: 1px solid #ccc">INR </span>
											</div>
											<div class="alert alert-sm alert-danger alert-dismissible" role="alert"
												ng-show="editDetailedProjectInformationForm.projEstimationCost.$dirty && editDetailedProjectInformationForm.projEstimationCost.$error.required">Estimated
												cost is required</div>
											<div class="alert alert-sm alert-danger alert-dismissible" role="alert"
												ng-show="editDetailedProjectInformationForm.projEstimationCost.$dirty && editDetailedProjectInformationForm.projEstimationCost.$error.pattern">Estimated
												cost can only contain digits</div>
										</div>

									<!-- 	<div class="col-xs-12 col-md-6">
											<div class="input-group input-group-sm">
												<span class="input-group-addon" style="border-right: 1px solid #ccc">Project
													Image </span> <input placeholder="Project Image" id="projectPhoto" name="projImage"
													type="file" style="display: none;" />
												<button class="projectPhoto btn btn-info btn-sm">Upload photo</button>
											</div>
										</div> -->

										<div class="col-xs-12">&nbsp;</div>

									</div>
								</div>
								<div class="col-xs-12">
									<a href="#" class="btn btn-primary continue-btn-2" ng-disabled="editDetailedProjectInformationForm.$invalid" style="margin-left: 91%;background-color:#5cb85c;">Continue
									</a>
								</div>
							</div>
						</form>
					</div>

					<h3 class="acc-pi-1 acc-hover" ng-class="editDetailedProjectInformationForm.$invalid?'ui-state-disabled':'ui-state-default'">
						Captcha
					</h3>
					<div>
						<div class="col-xs-12">
							<div class="col-xs-12 col-md-8">
												<div class="input-group input-group-sm" id="captchavalue">
												<div class="g-recaptcha" data-sitekey="6LcgrRQTAAAAALPL-I3d-X4mXCcCy-F22emjwxS3"></div>
									<%-- <span id="captchaVal" class="input-group-addon" style="border-right: 1px solid #ccc">
										<%
											Random aRandom = new Random();
											long aStart = 1000;
											long aEnd = 9999;
											long range = (long) aEnd - (long) aStart + 1;
											long fraction = (long) (range * aRandom.nextDouble());
											int randomNumber = (int) (fraction + aStart);
											System.err.println("RANDOM NUMBER: " + randomNumber);
											out.write(String.valueOf(randomNumber));
										%>
									</span> <input name="captcha" type="text" class="form-control" id="captcha" placeholder="Captcha" /> --%>
								</div>
							</div>
							<div class="col-xs-12 col-md-4">
								<a href="#" class="btn btn-primary edit-project-submit" style="width: 99px; height: 34px;">Edit
									project</a>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-success edit-project-response-panel" style="display: none;">
					<div class="edit-project-response panel-heading"></div>
				</div>
			</div>
			<div class="hr"></div>

			<input id="userId" type="text" style="display: none;" value=<%=session.getAttribute("username")%>>

			<div class="result-this"></div>
			<div class="clearfix"></div>
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

<!-- END JAVASCRIPTS -->
</div>
</div>
</body>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<!-- END BODY -->
</html>
<link rel="stylesheet" href="css/select2-bootstrap.css">
<link rel="stylesheet" href="css/select2.css">
</html>
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/customStyle.css">
<jsp:include page="template/footer.jsp" />