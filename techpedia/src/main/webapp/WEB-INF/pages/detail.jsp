<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<html ng-app="techpedia">
<body style="background-color: #3f94ae">
<jsp:include page="template/NewHeader.jsp" />
<style>
.row {
margin-right: -1px;
margin-left: -1px;
}
.line{
border-top: 1px solid #a9a9a9;
margin-top:-10px;
width: 770px;
margin-right: 15px;
}
.side{
border-top: 1px solid #a9a9a9;
margin-top:1px;
margin-bottom: 5px;
}
.inside{
font-size:12px;font-family: Arial;margin-bottom: 10px;
}
.font_divs
{
font-size:15px;font-family: Corbel;font-weight:bold;
}
</style>

<div class="clearfix"></div>
<div class="container customFont borderRadius style" >
<div class="page-container">
	<div class="page-sidebar-wrapper">
		<%-- <jsp:include page="template/dashboardMenu.jsp"></jsp:include> --%>
	</div>
	<div class="page-content-wrapper" ng-controller="ProjectDetail" ng-init="InitLoad()">
	<%String projrgstrid =String.valueOf((Long) session.getAttribute("id")); %>
		<div class="page-content">
		 <img src="images/banner_project.jpg" class="img-responsive" style="width:100%; hegiht:25%;">
		 
		 <div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
						<i class="	fa fa-server" id="icon-size" style="border:0; ;font-size:15px;font-family: Corbel;font-weight:bold; color:black"></i> Projects Details
						<!-- <small>dashboard & statistics</small> -->
					</h3>
					<ul class="page-breadcrumb breadcrumb" style="background-color: #FAFAF7;"  >
						<%
							if (session.getAttribute("username") != null) {
						%>

						<li><a href="./">Home&nbsp;</a><font style=" color: black; font-size:18px;">&raquo;</font>
						<a href="dashboard">Dashboard&nbsp;</a><font style="color: black; font-size:18px;">&raquo;</font>
							<a href="project">Projects&nbsp;</a><font style="color: black; font-size:18px;">&raquo;</font>

						{{projectdetails.projTitle}}</li>
						<!-- <li class="pull-right">
							<div id="dashboard-report-range" class="dashboard-date-range tooltips"
								data-placement="bottom" data-original-title="Change dashboard date range">
								<i class="icon-calendar"></i> <span></span> <i class="fa fa-angle-down"></i>
							</div>
						</li> -->
						<%
							} else {
						%><li><a href="./">Home&nbsp;</a> <font style=" color: black; font-size:18px;">&raquo;</font>
						<a href="project">Projects&nbsp;</a><font style=" color: black; font-size:18px;">&raquo;</font>

						{{projectdetails.projTitle}}</li>
						<%
							}
						%>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<%-- <div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
						<i class="fa fa-files-o" id="icon-size"></i> Project Details
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<%
							if (session.getAttribute("username") != null) {
						%>
						<li><a href="./">Home</a> &raquo;</li>
						<li><a href="dashboard">Dashboard</a> &raquo;</li>
						<li><a href="projects">Projects</a> &raquo;</li>
						<li>Project Details</li>
						<li class="pull-right"><a href="projects">View more Projects</a></li>
						<li class="pull-right">
							<div id="dashboard-report-range" class="dashboard-date-range tooltips"
								data-placement="bottom" data-original-title="Change dashboard date range">
								<i class="icon-calendar"></i> <span></span> <i class="fa fa-angle-down"></i>
							</div>
						</li>
						<%
							} else {
						%><li><a href="./">Home</a> &raquo;</li>
						<li><a href="projects">Projects</a> &raquo;</li>
						<li>Project Details</li>
						<li class="pull-right"><a href="projects">View more Projects</a></li>
						<%
							}
						%>
					</ul>

				</div>
			</div> --%>
			<div class="clearfix"></div>
			

			<%-- <div class="row">
				<!-- PROJECT DESCRIPTION-->
				<div class="col-xs-6">
					<div class="sectiontitle">
						<h4>${projectdetails.projTitle}</h4>
					</div>
					<table class="table">
						<tr>
							<td>Project Abstract:</td>
							<td>${projectdetails.projAbstract}</td>
						</tr>
						<tr>
							<td>Project Description:</td>
							<td>${projectdetails.projDescription}</td>
						</tr>
						<tr>
							<td>Project Duration:</td>
							<td>${projectdetails.projDuration}</td>
						</tr>
					</table>
				</div>
				<!-- end main content-->
				<!-- SLIDER-->
				<div class="col-xs-6">
					<%
						if (session.getAttribute("username") != null) {
					%>
					<div class="col-md-8" ng-hide="doesFollow">
						<a style="cursor: pointer;" class="btn btn-info btn-sm accept-style" ng-click="follow()">Follow</a><br>
						<br>
					</div>

					<div class="col-md-8" ng-show="doesFollow">
						<a style="cursor: pointer;" class="btn btn-info btn-sm accept-style" ng-click="unfollow()">Unfollow</a><br>
						<br>
					</div>
					<%
						}
					%>
					<img src="${projectdetails.projImage}" data-thumb="" alt="" />
				</div>
				<!-- end slider-->
			</div> --%>
			
			
			<%
						if (session.getAttribute("username") != null) {
					%>
				<!-- 	<div class="col-md-8" ng-show="doesFollow">
						<a style="cursor: pointer; margin-right: 950px;" class="btn btn-info add" ng-click="follow()">Follow</a><br>
						<br>
					</div>

					<div class="col-md-8" ng-show="doesFollow">
						<a style="cursor: pointer; margin-right: 950px;" class="btn btn-info add" ng-click="unfollow()">Unfollow</a><br>
						<br>
					</div> -->
					
					<div class="col-md-12 pull-right" style="padding-bottom:5px;" ng-switch on="doesFollow">
      <div class="col-md-12 pull-right" ng-switch-when="true"><a style="cursor: pointer;background-color:#709FDD;border-color:#709FDD; " class="btn btn-info btn-sm accept-style pull-right" ng-click="unfollow()">Unfollow</a><br></div>
      <div class="col-md-12 pull-right" ng-switch-when="false"><a style="cursor: pointer;background-color:#709FDD;border-color:#709FDD;" class="btn btn-info btn-sm accept-style pull-right" ng-click="follow()">Follow</a><br></div>
      <div class="col-md-12 pull-right" ng-switch-default><a style="cursor: pointer;background-color:#709FDD;border-color:#709FDD;" class="btn btn-info btn-sm accept-style pull-right" ng-click="follow()">follow</a></div>
  </div>
					
					<%
						}
					%>
					<!-- <img src="{{projectdetails.projImage}}" data-thumb="" alt="" /> -->
					
					<div class="col-xs-12 col-md-9">
							<div class="panel-heading"  style="border:0; ;font-size:15px;font-family: Corbel;;font-weight:bold; color:black">
								PROJECT DESCRIPTION  
							</div>	<hr class="line">
			
						<div style="margin:10px;padding:5px;display:block!important;min-height:150px!important;">
							<img src="${pageContext.request.contextPath}/image/{{projectdetails.photo1Path ||'defaultImage/placeholder.png'}}" class="img-responsive" align="left" style="padding-right: 10px;height:176px !important;width:274px !important;">
							<span style="font-size:12px;font-family: Arial; text-align: justify;
    text-justify: inter-word;">{{projectdetails.projDescription}}</span> 		
						</div>
						<div class="panel-heading" style="font-size:15px;font-family: Corbel;font-weight:bold;color:black;display:block!important;">PROJECT ABSTRACT</div>	<hr class="line">
						<div style="margin:10px;padding:5px;">
							
							<span style="font-size:12px;font-family: Arial; text-align: justify;text-align:justify;">{{projectdetails.projAbstract}}</span>
							<img src="${pageContext.request.contextPath}/image/{{projectdetails.photo2Path ||'defaultImage/project_footer.jpg'}}" class="img-responsive" style="margin:5px;height:233px !important;width:806px !important;">
						</div>
			
						
						
						</div>
					
				<div class="col-xs-12 col-md-3">
					<div style="font-size:15px;font-family: Corbel;font-weight:bold; margin-top: 10px;">PROJECT  BASIC  INFORMATION</div><hr class="side">
					<div style="background-color: #d3d3d3;padding:20px;">
							<div class="font_divs">Project Start Date</div>	<hr class="side">
							<div class="inside">{{projectdetails.projStartDate}}</div>
						
							<div class="font_divs">Team Members</div><hr class="side">
							<div class="inside"><div  ng-repeat="member in projectdetails.projTeamMemberList">
									<div>{{member[1]}} {{member[2]}} {{member[3]}}</div>
									</div></div>
									
							<div class="font_divs">Mentor</div>	<hr class="side">
							<div class="inside"><div  ng-repeat="mentor in projectMentorList">
									<div>{{mentor.fName}} {{mentor.mName}} {{mentor.lName}}</div></div></div>
									
							<div class="font_divs">Duration</div>	<hr class="side">
							<div class="inside">{{projectdetails.projDuration}}&nbsp;Months</div>
							
							<div class="font_divs">Branch</div><hr class="side">
							<div class="inside"><class="header-customize" ng-repeat="branch in projectdetails.projBranchList">
											{{branch.projBranchDesc}}</div>
											
							<div class="font_divs">Faculty</div>	<hr class="side">
							<div class="inside">{{projectdetails.projFacultyName}}</div>
						
					</div>
					
					<%if(session.getAttribute("id")!=null){ %>
				
					<div style="background-color: #d3d3d3;padding:20px; margin-top:10px;" >
					<div style="border:0; color:black;">
								Document list <span ng-show="deletedocmessage.length>0" style="float: right"
									ng-repeat="msg in deletedocmessage">{{msg}}</span>
							</div>
							<div><span ng-hide="(projectdetails.projTeamLeaderId==<%=projrgstrid %>|| document.regstrId==<%=projrgstrid %>||projectdetails.projFaculty==<%=projrgstrid %>||doesFollow==true || teamMember==true)">
							Documents can be viewed only by project members, faculty of the project and users following the project.</span></br>
								<div><span style="background-color: #d3d3d3;" ng-repeat="document in projectDocumentList" ng-show="(projectdetails.projTeamLeaderId==<%=projrgstrid %>|| document.regstrId==<%=projrgstrid %>||projectdetails.projFaculty==<%=projrgstrid %>||doesFollow==true || teamMember==true)">{{document.docName}}</br>
									 <a  ng-click="downloadDocumentLink(document)" class="btn btn-sm btn-info" ng-show="(projectdetails.projTeamLeaderId==<%=projrgstrid %>|| document.regstrId==<%=projrgstrid %>||projectdetails.projFaculty==<%=projrgstrid %>||doesFollow==true || teamMember==true)">Download</a>
									<button ng-click=deleteDocument(document) ng-show="(projectdetails.projTeamLeaderId==<%=projrgstrid %>|| document.regstrId==<%=projrgstrid %>)&& !(projectdetails.projStatusId==4)" ng-click="datarefresh()" class="btn btn-sm btn-info">Delete</button><hr class="side"></span></div>
								</div>
				
				
				
				</div><%} %>
						<%-- <div class="panel panel-warning "style="border:0;">
							<div class="panel-heading"style="border:0;background-color: #E8E8E8 ; color:black">
								PROJECT BASIC INFORMATION <span  style="float: right" ng-repeat="msg in mentordeletemessage">{{msg}}</span>
							</div>
							<div class="panel-body "style="border:0;">
							<div>DURATION{{projectdetails.projDuration}}</div>
							<div>MENTOR
								<div class="col-xs-6" ng-repeat="mentor in projectMentorList">
									<div class="col-md-12">{{mentor.fName}} {{mentor.mName}} {{mentor.lName}}</div></div>
									<!-- <div class="col-md-2">
									
									</div> -->
									<div class="col-md-10">
										
										
										<!-- <div class="col-md-12">{{mentor.designation}}</div>
										<div class="col-md-12">{{mentor.degree}}</div>
										<div class="col-md-12 red">Experience: {{mentor.experience}}</div> -->
										<div class="col-md-12">
											<!-- <a href="#" class="btn btn-sm btn-success" ng-click="deleteMentor(mentor)">Delete
												Mentor</a> -->
												
												<%
												
												if(session.getAttribute("username") != null){
												long registrId=((Long)session.getAttribute("id"));
												System.err.println("inJsp Value"+registrId);
												String rValue=String.valueOf(registrId);
												
												if(rValue != null){
													%>
											
													<c:set var="teamLeadrId" value="${projectdetails.projTeamLeaderId}" />
													<c:set var="rid" value="<%=registrId %>" scope="session" />
													
													<c:choose>
													<c:when test="${projTeamLeadrId == id}">
													<a href="#" class="btn btn-sm btn-success" ng-click="deleteMentor(mentor)" >Delete
													Mentor</a>
													
													</c:when>
													<c:otherwise>
													<p>hello ${projectdetails.projTeamLeaderId} </p>
													</c:otherwise>
													</c:choose>
													<c:if test="${teamLeadrId == rid}">
													
													<a href="#" class="btn btn-sm btn-success" ng-show="projectdetails.projTeamLeaderId==<%=projrgstrid %>&& !(projectdetails.projStatusId==4)" ng-click="deleteMentor(mentor)" >Delete
													Mentor</a>
													
													</c:if>
	 											
													<c:set var="mentorregisterId" value="${{mentor.rgstrId}}" />
													<c:set var="rid" value="<%=registrId %>" scope="session" />
													<!-- <a href="#" class="btn btn-sm btn-success" ng-click="deleteMentor(mentor)">Delete
													Mentor</a> --><c:if test="${mentorregisterId == rid}">
													<div class="col-md-12"  ng-show="<%=projrgstrid %>==mentor.rgstrId">
													<a href="#" class="btn btn-sm btn-success" ng-click="deleteMentor(mentor)" >Delete
													Mentor</a>
													</div>
													
													</c:if>
												<%}
												}%>
										</div>
									</div>
									
								</div>
							</div>
						</div> --%>
				
				</div>
			
			
			
			<div class="row" >
			<%-- <%if(session.getAttribute("id")!=null){ %> --%>
				<%-- <div class="col-md-12" >
				
						<div class="panel panel-warning"  style="border:0;">
							<div class="panel-heading"style="border:0;background-color: #E8E8E8 ; color:black">
								Document list <span ng-show="deletedocmessage.length>0" style="float: right"
									ng-repeat="msg in deletedocmessage">{{msg}}</span>
							</div>
							<div class="panel-body">
							<ul class="list-group">
							<table>
							<tr><span ng-hide="(projectdetails.projTeamLeaderId==<%=projrgstrid %>|| document.regstrId==<%=projrgstrid %>||projectdetails.projFaculty==<%=projrgstrid %>||doesFollow==true || teamMember==true)">
							Documents can be viewed only by project members, faculty of the project and users following the project.</span>
								<td><div class="list-group-item" ng-repeat="document in projectDocumentList" ng-show="(projectdetails.projTeamLeaderId==<%=projrgstrid %>|| document.regstrId==<%=projrgstrid %>||projectdetails.projFaculty==<%=projrgstrid %>||doesFollow==true || teamMember==true)">{{document.docName}}
									 <a  ng-click="downloadDocumentLink(document)" class="btn btn-sm btn-info" ng-show="(projectdetails.projTeamLeaderId==<%=projrgstrid %>|| document.regstrId==<%=projrgstrid %>||projectdetails.projFaculty==<%=projrgstrid %>||doesFollow==true || teamMember==true)">Download</a>
									<button ng-click=deleteDocument(document) ng-show="(projectdetails.projTeamLeaderId==<%=projrgstrid %>|| document.regstrId==<%=projrgstrid %>)&& !(projectdetails.projStatusId==4)" ng-click="datarefresh()" class="btn btn-sm btn-info">Delete</button></div></td>
								
								</tr>
								</table>
							</ul>
						</div>
				</div>
				</div> --%><%-- <%} %> --%>

				

<!-- 	codes for Tab menu for comments  strats here -->



					<!-- 	codes for tab menu for comments strats here  -->


					<div class="col-md-12 left-border">

						
							<div 
								style="border: 0; font-size:15px;font-family: Corbel;font-weight:bold;  color: black">COMMENTS
							</div>
							<hr class="side">
                
							

						

								<script type="text/javascript">
								$(document).ready(function(){
									$( "#techpedia" ).show();
									$("#facebook").hide();
									$( "#fb" ).click(function() {
										$( "#techpedia" ).hide();
										$("#facebook").show();
										});

										$( "#tech" ).click(function() {
										$( "#techpedia" ).show();
										$("#facebook").hide();
										});
								})
								
						</script>
						<div class="panel-body">
								<button  style="background-color: #2d2d2d;border: none;"><img  id="tech"  class="img-responsive"
								src="images/TPlogo.jpg" alt="" /></button>
								<button  style="background-color: #306199;border: none;margin-left: -2px;"><img id="fb"  class="img-responsive" 
								src="images/FBlogo.jpg" alt="Facebook" /></button>
								
								<!-- <div class="alert alert-info" role="alert" ng-show="message.length>0"
									ng-repeat="msg in message">{{msg}}</div>
									
								<div>-->
								<div id="facebook">

									<!-- facebook comments code starts here -->

									<div id="fb-root"></div>
									<script>
									(function(d, s, id) {
										var js, fjs = d.getElementsByTagName(s)[0];
										if (d.getElementById(id))
											return;
										js = d.createElement(s);
										js.id = id;
										js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.5";
										fjs.parentNode.insertBefore(js, fjs);
									}(document, 'script', 'facebook-jssdk'));
								</script>
									<div class=" panel-heading"
										style="font-size:15px;font-family: Corbel;font-weight:bold; background-color: #306199; font-color: white;margin-top: -6px; color: white">Facebook
										Comments</div>
									<div class="fb-comments"
										data-href="http://localhost:8080/techpedia/projectDetails{{projectdetails.projId}}"
										data-width="1072" data-numposts="5"></div>
									




									<!-- facebook comments code ends here -->

								</div>

								<div id="techpedia">

									<div class="col-md-12" ng-show="teamComments.length>0">
										<div class="panel panel-warning" style="border: 0;">
											<div class=" panel-heading"
												style="border: 0; background-color: #2d2d2d; font-size:15px;font-family: Corbel;font-weight:bold;color: white; margin-top: -6px;margin-left: -15px;">Team
												Comments</div>
											<div class="panel-body">
												<ul class="list-group">
													<li class="list-group-item"
														ng-repeat="comment in teamComments"><span
														class="badge" ng-click="deleteComment(comment,'team')"
														ng-show="registerId==comment.regstrId||registerId==comment.projTeamLeaderId"
														style="cursor: pointer;">X</span><span class="badge">{{comment.fName}}
															{{comment.lName}}</span> {{comment.projComment}}</li>
												</ul>
												<div>
													<p ng-repeat="msg in messageteamcomments"
														style="text-align: center">{{msg}}</p>
												</div>
												<div class="col-md-12">
													<p style="text-align: center">
														<a href="#"
															ng-click="viewMoreTeamComments(comment,count=count+1)"
															id="teamcomments">View more comments</a>

													</p>
												</div>
											</div>
										</div>
									</div>
									<!-- techpedia comments code starts here -->
									<div class="col-md-12" ng-show="publicComments.length>0">
										<div class="panelpanel-warning" style="border: 0;">
											<div class=" panel-heading"
												style="border: 0; background-color: #E8E8E8;font-size:15px;font-family: Corbel;font-weight:bold; color: black">Public
												Comments</div>
											<div class="panel-body">
												<ul class="list-group">
													<li class="list-group-item"
														ng-repeat="comment in publicComments"><span
														class="badge"
														ng-click="deletePublicComment(comment,'team')"
														ng-show="registerId==comment.regstrId||registerId==comment.projTeamLeaderId"
														style="cursor: pointer;">X</span><span class="badge">{{comment.fName}}
															{{comment.lName}}</span> {{comment.projComment}}</li>
												</ul>
												<div>
													<p ng-repeat="msg in messagepubliccomments"
														style="text-align: center">{{msg}}</p>
												</div>
												<div class="col-md-12">
													<p style="text-align: center">
														<a href="#"
															ng-click="viewMorePublicComments(comment,count=count+1)"
															id="publiccomments">View more comments</a>

													</p>
												</div>


											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="input-group"
											ng-show="$scope.registerId==<%=session.getAttribute("id")%>">
											<span class="input-group-addon" style="height: 48px">Comment:</span>
											<input type="text" ng-model="teamComment" id="commet"
												class="form-control" placeholder="Comment"
												style="height: 48px !important;"><span
												class="input-group-addon" style="height: 48px">

												<button class="btn btn-info "
													style="background-color: #709FDD; border-color: #709FDD;"
													ng-click="postpublicComment(teamComment,-1)">Post
													public</button>
											</span>


											<%-- 											<button class="btn btn-info" ng-hide="$scope.registerId==<%=session.getAttribute("id") %>" ng-click="postComment(teamComment)">Post</button></span> --%>
										</div>
										<div class="input-group"
											ng-hide="$scope.registerId==<%=session.getAttribute("id")%>">
											<span class="input-group-addon" style="height: 48px">Comment:</span>
											<input type="text" ng-model="teamComment" id="commet"
												class="form-control" placeholder="Comment"
												style="height: 48px !important;"><span
												class="input-group-addon" style="height: 48px"> <%-- 												<button class="btn btn-info" ng-show="$scope.registerId==<%=session.getAttribute("id") %>" ng-click="postpublicComment(teamComment,-1)">Post public</button></span> --%>


												<button class="btn btn-info"
													style="background-color: #709FDD; border-color: #709FDD;"
													ng-click="postComment(teamComment)">Post</button></span>
										</div>
									</div>
								</div>
							</div>

							<div class="clearfix"></div>

							<!-- techpedia comments code ends here -->

		
<%-- 
						<!-- END CONTAINER



				<div class="col-md-12 left-border">
					
						<div class="panel panel-warning" style="border:0;">
							<div class=" panel-heading"style="border:0;background-color: #E8E8E8 ; color:black">Comments 
												</div>
							<div class="panel-body">
								<!-- <div class="alert alert-info" role="alert" ng-show="message.length>0"
									ng-repeat="msg in message">{{msg}}</div>
									
								<div				
 -->							<!-- <div id="fb-root" ></div>
									<script>(function(d, s, id) {
									  var js, fjs = d.getElementsByTagName(s)[0];
									  if (d.getElementById(id)) return;
									  js = d.createElement(s); js.id = id;
									  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.5";
									  fjs.parentNode.insertBefore(js, fjs);
									}(document, 'script', 'facebook-jssdk'));</script>
									<div class=" panel-heading"style="border:0; background-color: #4e69a2; color:white;border-color: #435a8b #3c5488 #334c83; color:black">FaceBook Comments 
												</div>
									<div class="fb-comments" data-href="http://localhost:8080/techpedia/projectDetails{{projectdetails.projId}}" data-width="1072" data-numposts="5"></div>
								<div class="col-md-12" ng-show="teamComments.length>0">
									<div class="panel panel-warning"style="border:0;">
										<div class=" panel-heading"style="border:0;background-color: #E8E8E8 ; color:black">Team Comments</div>
										<div class="panel-body">
											<ul class="list-group">
												<li class="list-group-item" ng-repeat="comment in teamComments"><span class="badge"
													ng-click="deleteComment(comment,'team')"
													ng-show="registerId==comment.regstrId||registerId==comment.projTeamLeaderId"
													style="cursor: pointer;">X</span>
													
													<span class="badge">{{comment.fName}}
														{{comment.lName}}</span> {{comment.projComment}}</li>
											</ul>
											<div  
					>
					<p  ng-repeat="msg in messageteamcomments" style="text-align: center">{{msg}}</p>
				</div>
											<div class="col-md-12" >
												<p style="text-align: center">
						<a href="#" ng-click="viewMoreTeamComments(comment,count=count+1)" id="teamcomments" >View more comments</a>
						
					</p>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-12" ng-show="publicComments.length>0">
									<div class="panelpanel-warning"style="border:0;">
										<div class=" panel-heading"style="border:0;background-color: #E8E8E8 ; color:black">Public Comments</div>
										<div class="panel-body">
											<ul class="list-group">
												<li class="list-group-item" ng-repeat="comment in publicComments"><span
													class="badge" ng-click="deletePublicComment(comment,'team')"
													ng-show="registerId==comment.regstrId||registerId==comment.projTeamLeaderId"
													style="cursor: pointer;">X</span>
													<span class="badge">{{comment.fName}}
														{{comment.lName}}</span> {{comment.projComment}}</li>
											</ul>
											<div  
					>
					<p  ng-repeat="msg in messagepubliccomments" style="text-align: center">{{msg}}</p>
				</div>
											<div class="col-md-12" >
												<p style="text-align: center">
						<a href="#" ng-click="viewMorePublicComments(comment,count=count+1)" id="publiccomments">View more comments</a>
						
					</p>
											</div>
											
											
									</div>
								</div>	
										</div> -->

								<div class="col-md-12">
									<div class="input-group"ng-show="$scope.registerId==<%=session.getAttribute("id") %>">
										<span class="input-group-addon" style="height:48px">Comment:</span> <input type="text" ng-model="teamComment" id="commet"
											class="form-control" placeholder="Comment" style="height:48px !important;"><span class="input-group-addon" style="height:48px">

												<button class="btn btn-info " style="background-color:#709FDD;border-color:#709FDD;" ng-click="postpublicComment(teamComment,-1)">Post public</button></span>

											
											<button class="btn btn-info" ng-hide="$scope.registerId==<%=session.getAttribute("id") %>" ng-click="postComment(teamComment)">Post</button></span>
									</div>
									<div class="input-group"  ng-hide="$scope.registerId==<%=session.getAttribute("id") %>">
										<span class="input-group-addon" style="height:48px">Comment:</span> <input type="text" ng-model="teamComment" id="commet"
											class="form-control" placeholder="Comment" style="height:48px !important;"><span class="input-group-addon" style="height:48px">

												<button class="btn btn-info" ng-show="$scope.registerId==<%=session.getAttribute("id") %>" ng-click="postpublicComment(teamComment,-1)">Post public</button></span>

											
											<button class="btn btn-info" style="background-color:#709FDD;border-color:#709FDD;" ng-click="postComment(teamComment)">Post</button></span>
									</div>
								</div>
							</div>
						</div>
			 --%>
					<div class="clearfix"></div>
					<!-- END CONTAINER
BEGIN FOOTER -->

				</div>
			</div>
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
<!-- END BODY -->
</html>
<jsp:include page="template/footer.jsp" />