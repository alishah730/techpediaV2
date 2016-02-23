<%@ page import="java.util.Random"%>
<html ng-app="techpedia">
<jsp:include page="template/NewHeader.jsp" />
<style>
 .breadcrumb>li+li:before {
padding: 0 5px;
color: #ccc;
content: none !important;
} 
.row {
	margin-right: -1px;
	margin-left: -1px;
}
</style>
<div class="clearfix"></div>
<div class="container customFont borderRadius style" style="background-color:#ffffff;width:100%;">
<div class="page-container">

		<div class="page-content-wrapper" ng-controller="AddProjectController"
			ng-init="InitLoad()" style="width: 1068px !important;">
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">
							<i class="fa fa-briefcase" id="icon-size"></i> Add Project
						</h3>
						<ul class="page-breadcrumb breadcrumb">
							<li style="color: #262626 !important"><a style="color: #262626 !important" href="./">Home&nbsp;</a><font style="color: black; font-size:18px;">&raquo;</font></li>
							<li style="color: #262626 !important"><a style="color: #262626 !important" href="dashboard">Dashboard&nbsp;</a><font style="color: black; font-size:18px;">&raquo;</font></li>
							<li style="color: #262626 !important"><a style="color: #262626 !important" href="manageProjects">Manage Projects&nbsp;</a><font style="color: black; font-size:18px;">&raquo;</font></li>
							<li>Add Project</li>
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

				<!-- END PAGE TITLE & BREADCRUMB-->
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
			<%
				String challengeId = (String) request.getAttribute("challengeId");
				String challengeTitle = (String) request
						.getParameter("challengeTitle");
			%>

			<div class="row">
				<%
					if (challengeId != null) {
				%>
				<div class="panel panel-info">
					<div class="panel-heading">
						This project will get created against <a target="_blank"
							href="challengeDetails<%=challengeId%>">Challenge: <%=challengeTitle%></a>
					</div>
					<input style="display: none;" id="challengeId" name="challengeId"
						type="text" value=<%=challengeId%> />
				</div>
				<%
					}
				%>
				<div class="clearfix"></div>
				<div class="row">
					<div id="accordion" class="col-xs-12">
						<h3 class="acc-gi acc-hover" style="background-color:#217690;font-family:arial;color:#ffffff;">Project Information</h3>
						<div>
							<div>
								<form id="addProjectInformation" name="addProjectInformation"
									method="post" novalidate>
									<div class="col-xs-12 col-md-6" style="background-color:#f5f5f5;width:492px;margin-right:9px;">
										<!-- USER INFO START -->
										<div class="panel panel-default" style="border-style:none;background-color:#f5f5f5">
											<div class="panel-heading" style="border-style:none;font-family:arial;font-weight:bold;">Basic Information</div>
											<div class="panel-body project-basic-info" style="border-style:none;background-color:#f5f5f5;">
												<div class="col-xs-12">
													<div class="input-group input-group-sm">
												
														<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:130px;font-family:arial;color:#ffffff;">Title *</span>
															 <input style="width:298px;"
															id="projectTitle" name="projTitle" type="text"
															class="form-control rname" placeholder="Project Title"
															ng-model="addProject.projTitle" required
															ng-maxlength="30" />
													</div>
													<div class="alert alert-sm alert-danger alert-dismissible"
														role="alert"
														ng-show="addProjectInformation.projTitle.$dirty && addProjectInformation.projTitle.$error.required">
														Project Title is required</div>
													<div class="alert alert-sm alert-danger alert-dismissible"
														role="alert"
														ng-show="addProjectInformation.projTitle.$dirty && addProjectInformation.projTitle.$error.maxlength">
														Project Title cannot be more than 30 characters</div>

												</div>

												<div class="col-xs-12">&nbsp;</div>

												<div class="col-xs-12">
													<div class="input-group input-group-sm">
														<span class="input-group-addon"
															style="border-right: 1px solid #ccc;background-color:#217690;width:130px;font-family:arial;color:#ffffff;">Branches *</span> <input
															style="width:298px;" id="projectBranches" name="projBranchesString"
															type="text" class="form-control"
															placeholder="Project branches"
															ng-model="addProject.projBranchesString" required />
													</div>
												</div>

												<div class="col-xs-12">&nbsp;</div>

												<div class="col-xs-12">
													<div class="input-group input-group-sm">
														<span class="input-group-addon"
															style="border-right: 1px solid #ccc;background-color:#217690;width:130px;font-family:arial;color:#ffffff;">Keywords *</span> <input
															style="width:298px;" id="projectKeywords" name="projKeywordsString"
															type="text" class="form-control" placeholder="Keywords"
															ng-model="addProject.projKeywordsString" required />
													</div>
												</div>

												<div class="col-xs-12">&nbsp;</div>

												<div class="col-xs-12">
													<div class="input-group input-group-sm">
														<span class="input-group-addon"
															style="border-right: 1px solid #ccc;background-color:#217690;width:100px;font-family:arial;color:#ffffff;">Team Members</span>
														<input style="width:225px;" id="teamMembers" name="projTeamMembersString"
															type="text" class="form-control"
															placeholder="Add Team Members"
															ng-model="addProject.projTeamMembersString"
															readonly="readonly" /> <span class="input-group-addon btn-success btn-responsive"
															style="border-left: 1px solid #ccc; width: 10px;"
															disabled> <a data-toggle="modal"
															data-target="#searchTeamMemberModal" style="color:#ffffff;" href="#">Search</a></span>
													</div>

												</div>

												<div class="col-xs-12">&nbsp;</div>
												<div class="col-xs-12">
													<div class="input-group input-group-sm">
														<span class="input-group-addon"
															style="border-right: 1px solid #ccc;background-color:#217690;width:130px;font-family:arial;color:#ffffff;">Team Name *</span> <input
															style="width:298px;" id="teamName" name="projTeamDesc" type="text"
															class="form-control" placeholder="Team Name"
															ng-model="addProject.projTeamDesc" required
															ng-pattern="/^(\D)+$/" />
													</div>
													<div class="alert alert-sm alert-danger alert-dismissible"
														role="alert"
														ng-show="addProjectInformation.projTeamDesc.$dirty && addProjectInformation.projTeamDesc.$error.required">Team
														Members are required</div>
													<div class="alert alert-sm alert-danger alert-dismissible"
														role="alert"
														ng-show="addProjectInformation.projTeamDesc.$dirty && addProjectInformation.projTeamDesc.$error.pattern">Team
														Members can only contain text</div>
												</div>
												<div class="col-xs-12">&nbsp;</div>
												
												
											</div>
										</div>
										
										<div class="panel panel-default"  style="border-style:none;background-color:#f5f5f5">
											<div class="panel-heading"  style="border-style:none;font-family:arial;font-weight:bold;">Project State Information</div>
											<div class="panel-body project-state-info"  style="border-style:none;background-color:#f5f5f5">
												<div class="col-xs-12">
													<div class="input-group input-group-sm">
														<span class="input-group-addon"
															style="border-right: 1px solid #ccc;background-color:#217690;width:130px;font-family:arial;color:#ffffff;">Start *</span> <input
															style="width:298px;" id="projectStartDate" name="projStartDate" type="text"
															class="form-control" placeholder="Project Start Date(DD-MMM-YYYY)"
															ng-model="addProject.projStartDate" datepicker-angular />
														<!-- <span class="input-group-addon"
															style="border-left: 1px solid #ccc;">DD-MMM-YYYY</span> -->
													</div>


												</div>

												<div class="col-xs-12">&nbsp;</div>

												<div class="col-xs-12">
													<div class="input-group input-group-sm">
														<span class="input-group-addon"
															style="border-right: 1px solid #ccc;background-color:#217690;width:130px;font-family:arial;color:#ffffff;">End *</span> <input
															style="width:298px;" id="projectEndDate" name="projEndDate" type="text"
															class="form-control" placeholder="Project End Date(DD-MMM-YYYY)"
															ng-model="addProject.projEndDate" datepicker-angular />
														<!-- <span class="input-group-addon"
															style="border-left: 1px solid #ccc;">DD-MMM-YYYY</span> -->
													</div>

												</div>

												<div class="col-xs-12">&nbsp;</div>
												<div class="col-xs-12">
													<div class="input-group input-group-sm">
														<span class="input-group-addon"
															style="border-right: 1px solid #ccc;background-color:#217690;width:105px;font-family:arial;color:#ffffff;">Year </span> <input
															style="width:293px;" id="projectYear" name="projYear" type="text"
															class="form-control" placeholder="Project Year" readonly />
													</div>
												</div>

												<div class="col-xs-12">&nbsp;</div>

												<div class="col-xs-12">
													<div class="input-group input-group-sm">
														<span class="input-group-addon"
															style="border-right: 1px solid #ccc;background-color:#217690;width:130px;font-family:arial;color:#ffffff;">Duration</span> <input
															style="width:229px;" id="projectDuration" name="projDuration" type="text"
															class="form-control"
															placeholder="Project duration (in months)" readonly /> <span
															class="input-group-addon"
															style="border-right: 1px solid #ccc;">months</span>
													</div>

												</div>
												<div class="col-xs-12">&nbsp;</div>
											</div>
										</div>

									</div>

							 <div class="col-xs-12 col-md-6" style="background-color:#f5f5f5">
										
										<div class="panel panel-default" style="border-style:none;">
											<div class="panel-heading" style="border-style:none;font-family:arial;font-weight:bold;">Project Photo</div>
											
											<div class="panel-body project-basic-info" style="border-style:none;background-color:#f5f5f5;">
												<input ng-model="addProject.photo" type="text" name="photo"
													id="photoByte64" style="display: none;" /> <input
													type="text" name="photo" id="photoByte64Size"
													style="display: none;" />
												<canvas class='canvas' width='160' height='120'
													style='display: none;'></canvas>
												<div class="col-xs-12">
													<div class="col-xs-3">
														<!-- <video class='live' width='160' height='120' autoplay></video> -->
														<img width=160 height=120 src='images/placeholder.png'
															class='photo' id="img_id" alt='photo'>
													</div>

													<div class="col-xs-9">
														<div class="col-xs-12">
															<!-- <button class='takePhoto btn btn-info btn-sm'>Take photo</button>
														<button class='retakePhoto btn btn-info btn-sm' style="display: none;">Retake
															photo</button> -->
															<input id='hidden-photo-input' type='file'
																accept='image*;capture=camera' style='display: none;'
																ng-file="file" base64 />
														</div>
														<div class="col-xs-12">&nbsp;</div>

														<button class='btn btn-success btn-responsive'
															onclick="$('#hidden-photo-input').click();"
															style="float: right;">
															<i class="fa fa-upload">&nbsp;</i>Upload photo
														</button>
														<div class="col-xs-12" ng-show="msg.size.length>0">File
															size cannot be more than 10 KB</div>
														<div class="col-xs-12" ng-show="message.length>0">
															<div ng-repeat="msg in message">{{msg}}</div>
														</div>

													</div>
												</div>
											</div>
										</div>
									<div class="col-xs-12">&nbsp;</div>
									<div class="col-xs-12">&nbsp;</div>
									<div class="col-xs-12">&nbsp;</div>
									<div class="col-xs-12">&nbsp;</div>
									<div class="col-xs-12">&nbsp;</div>
									<div class="col-xs-12">&nbsp;</div>
								
									
									<div class="col-xs-12" style="height:25px;">&nbsp;</div>
									<!-- Project footer image -->
									
										<div class="panel panel-default" style="border-style:none;">
											<div class="panel-heading" style="border-style:none;font-family:arial;font-weight:bold;">Project Footer Photo</div>
											<div class="panel-body project-basic-info" style="border-style:none;background-color:#f5f5f5;">
												<input ng-model="addProject.photo" type="text" name="photo"
													id="photoByte64-footer" style="display: none;" /> <input
													type="text" name="photo" id="photoByte64Size-footer"
													style="display: none;" />
												<canvas class='canvas' width='160' height='120'
													style='display: none;'></canvas>
												<div class="col-xs-12">
													<div class="col-xs-3">
														<video class='live' width='160' height='120' autoplay></video>
														<img width=160 height=120 src='images/placeholder.png'
															class='photo1' id="img_id_footer" alt='photo'>
													</div>

													<div class="col-xs-9">
														<div class="col-xs-12">
															<input id='hidden-photo-input-footer' type='file'
																accept='image*;capture=camera' style='display: none;'
																ng-file="file1" base64 />
														</div>
														<div class="col-xs-12">&nbsp;</div>

														<button class='btn  btn-success btn-responsive'
															onclick="$('#hidden-photo-input-footer').click();"
															style="float: right;">
															<i class="fa fa-upload">&nbsp;</i>Upload photo
														</button>
														<div class="col-xs-12" ng-show="msg.size.length>0">File
															size cannot be more than 10 KB</div>
														<div class="col-xs-12" ng-show="message.length>0">
															<div ng-repeat="msg in message">{{msg}}</div>
														</div>

													</div>
												</div>
											</div>
										</div>
										

									<div class="col-xs-12">&nbsp;</div>
									<div class="col-xs-12">&nbsp;</div>
									<div class="col-xs-12">&nbsp;</div>
									<div class="col-xs-12">&nbsp;</div>
									
									
									</div>


									<!-- proejct image upload codes ends here -->
								<div class="col-xs-12">&nbsp;</div>

									<div class="col-xs-12 col-md-12">
										<div class="panel panel-default" style="border-style:none;">
											<div class="panel-heading" style="border-style:none;font-family:arial;font-weight:bold;">Project Abstract *</div>
											<div class="panel-body project-abstract-info" style="border-style:none;background-color:#f5f5f5;">
												<div class="col-xs-12">
													<textarea id="projectAbstract"
														placeholder="Project abstract..." class="textarea-text"
														style="width: 920px; height: 100px;" name="projAbstract"
														rows="3" ng-maxlength="1000" ng-model="addProject.projAbstract" required></textarea>
													<div class="alert alert-sm alert-danger alert-dismissible"
														role="alert"
														ng-show="addProjectInformation.projAbstract.$dirty && addProjectInformation.projAbstract.$error.required">Project
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
										<a href="#" class="btn btn-primary continue-btn"
											ng-disabled="addProjectInformation.$invalid" style="margin-left: 91%;background-color:#5cb85c;">Continue</a>
									</div>
								</form>
							</div>

						</div>
						<h3 class="acc-pi acc-hover"
							ng-class="addProjectInformation.$invalid?'ui-state-disabled':'ui-state-default'" style="background-color:#217690">Detailed
							Project Information</h3>
						<div>

							<form id="addDetailedProjectInformationForm"
								name="addDetailedProjectInformationForm" method="post"
								novalidate>
								<div class="col-xs-12 col-md-12">
									<div class="panel panel-default" style="border-style:none;">
										<div class="panel-heading" style="border-style:none;font-family:arial;font-weight:bold;">Project Description</div>
										<div class="panel-body project-description-info" style="border-style:none;background-color:#f5f5f5;">
											<div class="col-xs-12">
												<textarea id="projectDescription"
													placeholder="Project description..." class="textarea-text"
													style="width: 920px; height: 100px;" name="projDescription"
													rows="5" ng-model="addProject.projDescription" required></textarea>
												<div class="alert alert-sm alert-danger alert-dismissible"
													role="alert"
													ng-show="addDetailedProjectInformationForm.projDescription.$dirty && addDetailedProjectInformationForm.projDescription.$error.required">Project
													Description is required</div>
											</div>
											<div class="col-xs-12">&nbsp;</div>
										</div>
									</div>
								</div>

								<div class="col-xs-12">
									<div class="panel panel-default" style="border-style:none;">
										<div id="profession" class="panel-heading" style="border-style:none;font-family:arial;font-weight:bold;">University
											Information</div>
										<div class="panel-body project-detail-info" style="border-style:none;background-color:#f5f5f5;">
											<div class="col-xs-12 col-md-6">
												<div class="input-group input-group-sm">
													<span class="input-group-addon"
														style="border-right: 1px solid #ccc;background-color:#217690;width:100px;font-family:arial;color:#ffffff;">University </span> <input
														style="width:340px;" name="projUniversity" id="projectUniversity" type="text"
														class="form-control" placeholder="Project University"
														value="IIT" readonly ng-model="addProject.university" />
												</div>
											</div>

											<div class="col-xs-12 col-md-6">
												<div class="input-group input-group-sm">
													<span class="input-group-addon"
														style="border-right: 1px solid #ccc;background-color:#217690;width:100px;font-family:arial;color:#ffffff;">College</span> <input
														style="width:340px;" name="projCollege" id="projectCollege" type="text"
														class="form-control" placeholder="Project College"
														value="IIT Kanpur" readonly
														ng-model="addProject.collge" />
												</div>
											</div>

											<div class="col-xs-12">&nbsp;</div>

											<div class="col-xs-12 col-md-6">
												<div class="input-group input-group-sm">
													<span class="input-group-addon"
														style="border-right: 1px solid #ccc;background-color:#217690;width:100px;font-family:arial;color:#ffffff;">State</span> <input
														style="width:340px;" name="projCollegeState" id="projectCollegeState"
														type="text" class="form-control"
														placeholder="Project College State" value="Kanpur"
														readonly ng-model="addProject.state" />
												</div>
											</div>

											<div class="col-xs-12 col-md-6">
												<div class="input-group input-group-sm">
													<span class="input-group-addon"
														style="border-right: 1px solid #ccc;background-color:#217690;width:100px;font-family:arial;color:#ffffff;">Student ID</span> <input
														style="width:340px;" name="projStudentId" name="userRegisterationNumber"
														type="text" class="form-control" placeholder="Student ID"
														value="2009ECS31" readonly
														ng-model="addProject.studentID" />
												</div>
											</div>

											<div class="col-xs-12">&nbsp;</div>

											<div class="col-xs-12 col-md-6">
												<div class="input-group input-group-sm">
													<span class="input-group-addon"
														style="border-right: 1px solid #ccc;background-color:#217690;width:100px;font-family:arial;color:#ffffff;">Faculty</span> <input
														style="width:268px;" id="projFaculty" name="projFaculty" type="text"
														class="form-control" placeholder="Choose faculty" /> <span
														class="input-group-addon"
														style="border-left: 1px solid #ccc"><a
														data-toggle="modal" data-target="#addNewFacultyModal"
														href="#">Add new</a></span>
												</div>

											</div>
											<div class="col-xs-12">&nbsp;</div>
										</div>
									</div>
								</div>

								<div class="col-xs-12">
									<div class="panel panel-default" style="border-style:none;">
										<div id="profession" class="panel-heading" style="border-style:none;font-family:arial;font-weight:bold;">Additional Project Information</div>
										<div class="panel-body project-detail-info"  style="border-style:none;background-color:#f5f5f5;">
											<div class="col-xs-12 col-md-6">
												<div class="input-group input-group-sm">
													<span class="input-group-addon"
														style="border-right: 1px solid #ccc;background-color:#217690;width:100px;font-family:arial;color:#ffffff;">Cost </span> <input
														style="width:340px;" id="projectEstimatedCost" name="projEstimationCost"
														type="text" class="form-control"
														placeholder="Estimated cost"
														ng-model="addProject.projEstimationCost" required
														ng-pattern="/^(\d)+$/" /> <span class="input-group-addon"
														style="border-right: 1px solid #ccc">INR </span>
												</div>
												<div class="alert alert-sm alert-danger alert-dismissible"
													role="alert"
													ng-show="addDetailedProjectInformationForm.projEstimationCost.$dirty && addDetailedProjectInformationForm.projEstimationCost.$error.required">Estimated
													cost is required</div>
												<div class="alert alert-sm alert-danger alert-dismissible"
													role="alert"
													ng-show="addDetailedProjectInformationForm.projEstimationCost.$dirty && addDetailedProjectInformationForm.projEstimationCost.$error.pattern">Estimated
													cost can only contain digits</div>
											</div>

											<div class="col-xs-12 col-md-6">
												<!-- <div class="input-group input-group-sm">
													<span class="input-group-addon" style="border-right: 1px solid #ccc">Project
														Image </span> <input placeholder="Project Image" id="projectPhoto" name="projImage"
														type="file" style="display: none;" />
													<button class="projectPhoto btn btn-info btn-sm">Upload photo</button>
												</div> -->
											</div>

											<div class="col-xs-12">&nbsp;</div>

										</div>
									</div>
									<div class="col-xs-12">
										<a href="#" class="btn btn-primary continue-btn-2"
											ng-disabled="addDetailedProjectInformationForm.$invalid" style="margin-left: 91%;background-color:#5cb85c;">Continue</a>
									</div>
								</div>
							</form>
						</div>

						<h3 class="acc-pi-1 acc-hover"
							ng-class="addDetailedProjectInformationForm.$invalid?'ui-state-disabled':'ui-state-default'" style="background-color:;border-style:none;font-family:arial;font-weight:bold;">CAPTCHA</h3>
						<div>
							<div class="col-xs-12">
								<div class="col-xs-12 col-md-6">
									<div class="input-group input-group-sm" id="captchavalue">
										<div class="g-recaptcha"
											data-sitekey="6LcgrRQTAAAAALPL-I3d-X4mXCcCy-F22emjwxS3"></div>
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
								<div class="col-xs-12 col-md-6">
									<a href="#" class="btn btn-primary add-project-submit"
										id="add-project" style="width: 99px; height: 34px;margin-left:396px;margin-top:38px;">Add
										project</a>
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-success add-project-response-panel"
						style="display: none;">
						<div class="add-project-response panel-heading"></div>
					</div>
				</div>
				<div class="hr"></div>

				<input id="userId" type="text" style="display: none;"
					value=<%=session.getAttribute("username")%>>

				<div class="result-this"></div>

				<!-- Modal -->
				<div class="modal fade" id="addNewFacultyModal" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Add new faculty</h4>
							</div>
							<div class="modal-body">
								<form id="add-new-faculty-form">
									<div class="col-md-12">
										<div class="col-xs-12">
											<div class="input-group">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:100px !important;font-family:arial;color:#ffffff;">First Name *</span> <input
													style="width:245px;" id="newFacultyName" type="text" name="firstName"
													class="form-control" placeholder="Faculty Name">
											</div>
										</div>
										<div class="col-xs-12">&nbsp;</div>
										<div class="col-xs-12">
											<div class="input-group">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:100px !important;font-family:arial;color:#ffffff;">Mid Name</span> <input
													type="text" style="width:250px;" id="newFacultyMName" name="middleName"
													class="form-control" placeholder="Faculty Name">
											</div>
										</div>
										<div class="col-xs-12">&nbsp;</div>
										<div class="col-xs-12">
											<div class="input-group">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:100px !important;font-family:arial;color:#ffffff;">Last Name *</span> <input
													type="text" style="width:245px;" id="newFacultyLName" name="lastName"
													class="form-control" placeholder="Faculty Name">
											</div>
										</div>
										<div class="col-xs-12">&nbsp;</div>
										<div class="col-xs-12">
											<div class="input-group">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:100px !important;font-family:arial;color:#ffffff;">College *</span> <input
													type="text" class="form-control"
													placeholder="Search Colleges" style="width:248px;" id="CollegeNames"
													name="college" onchange="validate()" class="form-control">
											</div>
										</div>
										<div class="col-xs-12">&nbsp;</div>

										<div class="col-xs-12">
											<div class="input-group">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:100px !important;font-family:arial;color:#ffffff;">Email *</span> <input
													name="email" id="email" type="email" class="form-control" style="width:247px;"
													onchange="validate()" placeholder="Enter Email address"
													required>
											</div>
										</div>
									</div>
								</form>
							</div>
							<div class="modal-footer" style="    border-top: 1px solid #ffffff;">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button id="add-faculty-submit-button" type="button"
									class="btn  btn-success btn-responsive"  data-dismiss="modal" disabled="true">Add
									faculty</button>
							</div>
						</div>
					</div>
				</div>

				<!-- <div id="add-faculty-popup" style="display: none;">
				<form id="add-new-faculty-form">
					<div class="col-md-12">
						<div class="col-xs-12">
							<div class="input-group">
								<span class="input-group-addon">First Name</span> <input id="newFacultyName" type="text"
									name="firstName" class="form-control" placeholder="Faculty Name">
							</div>

						</div>
						<div class="col-xs-12">&nbsp;</div>
						<div class="col-xs-12">
							<div class="input-group">
								<span class="input-group-addon">Mid Name</span> <input type="text" name="middleName"
									class="form-control" placeholder="Faculty Name">
							</div>
						</div>
						<div class="col-xs-12">&nbsp;</div>
						<div class="col-xs-12">
							<div class="input-group">
								<span class="input-group-addon">Last Name</span> <input type="text" name="lastName"
									class="form-control" placeholder="Faculty Name">
							</div>
						</div>
						<div class="col-xs-12">&nbsp;</div>
						<div class="col-xs-12">
							<div class="input-group">
								<span class="input-group-addon">College </span> <input type="text" name="college"
									class="form-control" placeholder="Faculty college">
							</div>
						</div>
						<div class="col-xs-12">&nbsp;</div>
						<div class="col-xs-12">
							<div class="input-group">
								<span class="input-group-addon">Email </span> <input type="text" name="email"
									class="form-control" placeholder="Enter Email address">
							</div>
						</div>

						<div class="col-xs-12">&nbsp;</div>
						<div class="col-xs-12" style="text-align: center;">
							<input id="add-faculty-submit-button" type="submit" name="submit"
								class="btn btn-sm btn-success" />

						</div>
					</div>
				</form>
			</div> -->
				<div class="col-xs-12">&nbsp;</div>

				<div class="modal fade" id="searchTeamMemberModal" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Enter search
									parameters</h4>
							</div>
							<div class="modal-body">
								<form id="search-team-members-form">
									<div class="col-xs-12">
										<div class="col-xs-12">
											<div class="input-group">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:100px !important;font-family:arial;color:#ffffff;">First Name </span> <input
													type="text" name="firstName" style="width:350px;"  class="form-control"
													placeholder="First Name">
											</div>
										</div>
										<div class="col-xs-12">&nbsp;</div>
										<div class="col-xs-12">
											<div class="input-group">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:100px !important;font-family:arial;color:#ffffff;">Mid Name </span> <input
													type="text" name="midName" style="width:350px;"  class="form-control"
													placeholder="Middle Name">
											</div>
										</div>
										<div class="col-xs-12">&nbsp;</div>
										<div class="col-xs-12">
											<div class="input-group">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:100px !important;font-family:arial;color:#ffffff;">Last Name </span> <input
													type="text" name="lastName" style="width:350px;"  class="form-control"
													placeholder="Last Name">
											</div>
										</div>
										<div class="col-xs-12">&nbsp;</div>
										<div class="col-xs-12">
											<div class="input-group">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:100px !important;font-family:arial;color:#ffffff;">College </span> <input
													type="text" class="form-control"
													placeholder="Search Colleges" style="width:350px;"  id="CollegeNames1"
													name="collge">

											</div>
										</div>
										<div class="col-xs-12">&nbsp;</div>
										<div class="col-xs-12">
											<div class="input-group">
												<span class="input-group-addon" style="border-right: 1px solid #ccc;background-color:#217690;width:100px !important;font-family:arial;color:#ffffff;">Roll No: </span> <input
													type="text" name="studentID" style="width:350px;"  class="form-control"
													placeholder="Enrollment">
											</div>
										</div>
										<div class="col-xs-12">&nbsp;</div>
										<div class="col-xs-12" style="text-align: center;">
											<button id="search-team-members-submit-button" name="submit" class="btn btn-sm btn-success" ><i class="fa fa-search"></i>&nbsp;Search</button>
										</div>
									</div>
								</form>
								<div id="fetched-team-members-container" style="display: none;">
									<div class="panel panel-default">
										<div class="panel-heading">Search results</div>
										<div class="panel-body">
											<select style="width: 100%" class="listbox"
												name="fetched-team-members" id="fetched-team-members"
												onchange="makeDisable()" multiple="multiple">
											</select>
											<p name="fetched-team-members-novalue"
												id="fetched-team-members-novalue"
												style="text-align: center;"></p>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer" style="    border-top: 1px solid #ffffff;">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button id="choose-selected-team-members" type="button"
									class="btn btn-primary" data-dismiss="modal" disabled="true">Choose
									Selected</button>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
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

<!-- END JAVASCRIPTS -->
<script type="text/javascript">
	function validate() {
		//alert("121");
		// 	var a = $('#newFacultyName').val().length;
		// 	alert(a);
		// 	if(a==0)
		if ($('#CollegeNames').val().length > 0
				&& $('#newFacultyLName').val().length > 0
				&& $('#newFacultyName').val().length > 0
				&& $('#email').val().length > 0) {
			$("#add-faculty-submit-button").prop("disabled", false);
		} else {
			$("#add-faculty-submit-button").prop("disabled", true);
		}
		// 	if ($('#newFacultyName').val().length   >   0   &&
		//         $('#newFacultyMName').val().length  >   0   &&
		//         $('#newFacultyLName').val().length  >   0   &&
		//         $('#CollegeNames').val().length  >   0   &&
		//         $('#email').val().length    >   0) {
		//         $("add-faculty-submit-button").prop("disabled", false);
		//     }
		//     else {
		//         $("add-faculty-submit-button").prop("disabled", true);
		//     }
	}
	function makeDisable() {
		var value = $('fetched-team-members:selected').text();

		if (value === '') {
			$("#choose-selected-team-members").prop('disabled', false);
		} else {
			$("#choose-selected-team-members").prop('disabled', true);
		}
	}

	// $(document).ready(function (){

	//     validate();
	//     $('#newFacultyName, #newFacultyMName, newFacultyLName,CollegeNames,email').change(validate);

	// });
</script>
<script type="text/javascript">
	$(document).keydown(
			function(e) {
				var doPrevent;
				if (e.keyCode == 8) {
					var d = e.srcElement || e.target;
					if (d.tagName.toUpperCase() == 'INPUT'
							|| d.tagName.toUpperCase() == 'TEXTAREA') {
						doPrevent = d.readOnly || d.disabled;
					} else
						doPrevent = true;
				} else
					doPrevent = false;

				if (doPrevent)
					e.preventDefault();
			});
</script>
</body>
<!-- END BODY -->
</html>
<jsp:include page="template/footer.jsp" />
<script src="js/webrtc.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<link rel="stylesheet" href="css/select2-bootstrap.css">
<link rel="stylesheet" href="css/select2.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/customStyle.css">