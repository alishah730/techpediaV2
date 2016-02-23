/**
 * 
 */
package com.techpedia.projectmanagement.dao;

import java.util.ArrayList;

import com.techpedia.projectmanagement.bean.AddCommVO;
import com.techpedia.projectmanagement.bean.AddNewFacultyResponseVO;
import com.techpedia.projectmanagement.bean.ApproveOrDeclineMentorRequestResponse;
import com.techpedia.projectmanagement.bean.ApproveOrDeclineMentorRequestVO;
import com.techpedia.projectmanagement.bean.Branch;
import com.techpedia.projectmanagement.bean.CreateProjectResponseVO;
import com.techpedia.projectmanagement.bean.DeleteCommVO;
import com.techpedia.projectmanagement.bean.DeleteDocVO;
import com.techpedia.projectmanagement.bean.DisplayProjectsMacroBranchVO;
import com.techpedia.projectmanagement.bean.DisplayTeamCommVO;
import com.techpedia.projectmanagement.bean.DownloadDocVO;
import com.techpedia.projectmanagement.bean.FacInitProjVO;
import com.techpedia.projectmanagement.bean.FacRejectProjResponse;
import com.techpedia.projectmanagement.bean.FacRejectProjVO;
import com.techpedia.projectmanagement.bean.Faculty;
import com.techpedia.projectmanagement.bean.FacultyMarkedProjectAsCompletedResponse;
import com.techpedia.projectmanagement.bean.FacultyMarkedProjectAsCompletedVO;
import com.techpedia.projectmanagement.bean.FacultyVO;
import com.techpedia.projectmanagement.bean.FollowProjectVO;
import com.techpedia.projectmanagement.bean.MentorVO;
import com.techpedia.projectmanagement.bean.ProjFollowVO;
import com.techpedia.projectmanagement.bean.ProjSubmit;
import com.techpedia.projectmanagement.bean.Project;
import com.techpedia.projectmanagement.bean.ProjectDocument;
import com.techpedia.projectmanagement.bean.ProjectTeamComment;
import com.techpedia.projectmanagement.bean.ProjectTeamDetailVO;
import com.techpedia.projectmanagement.bean.ProjectType;
import com.techpedia.projectmanagement.bean.ReplaceTeamLead;
import com.techpedia.projectmanagement.bean.RequestToBeMentorResponse;
import com.techpedia.projectmanagement.bean.RequestToBeMentorVO;
import com.techpedia.projectmanagement.bean.SaveProjectPhoto;
import com.techpedia.projectmanagement.bean.ResubmitProjectResponse;
import com.techpedia.projectmanagement.bean.SearchByKeyVO;
import com.techpedia.projectmanagement.bean.Team;
import com.techpedia.projectmanagement.bean.TeamMember;
import com.techpedia.projectmanagement.bean.UploadProjDocVO;
import com.techpedia.projectmanagement.bean.UserProfileVO;
import com.techpedia.projectmanagement.exception.AddCommentException;
import com.techpedia.projectmanagement.exception.AddNewFacultyException;
import com.techpedia.projectmanagement.exception.AddNewMentorException;
import com.techpedia.projectmanagement.exception.AddTeamMembersException;
import com.techpedia.projectmanagement.exception.ApproveOrDeclineMentorRequestException;
import com.techpedia.projectmanagement.exception.BulkUploadException;
import com.techpedia.projectmanagement.exception.CheckProjectFollowException;
import com.techpedia.projectmanagement.exception.CreateProjectException;
import com.techpedia.projectmanagement.exception.DeleteDocumentException;
import com.techpedia.projectmanagement.exception.DeleteProjectException;
import com.techpedia.projectmanagement.exception.DownloadProjDocException;
import com.techpedia.projectmanagement.exception.FacultyClosedProjectException;
import com.techpedia.projectmanagement.exception.FacultyInitiatedProjectException;
import com.techpedia.projectmanagement.exception.FacultyMarkedProjectAsCompletedException;
import com.techpedia.projectmanagement.exception.FacultyRejectedProjectException;
import com.techpedia.projectmanagement.exception.FollowTheProjectException;
import com.techpedia.projectmanagement.exception.GetAllFollowedProjectException;
import com.techpedia.projectmanagement.exception.GetAllMentorsException;
import com.techpedia.projectmanagement.exception.GetAllProjectException;
import com.techpedia.projectmanagement.exception.GetDetailOfTeamException;
import com.techpedia.projectmanagement.exception.GetPopularityException;
import com.techpedia.projectmanagement.exception.GetProjectDetailsException;
import com.techpedia.projectmanagement.exception.GetProjectFollowersException;
import com.techpedia.projectmanagement.exception.GetProjectTypeException;
import com.techpedia.projectmanagement.exception.OtherCommentsNotFoundException;
import com.techpedia.projectmanagement.exception.ProjectByLoggedInUserException;
import com.techpedia.projectmanagement.exception.RemoveCommentException;
import com.techpedia.projectmanagement.exception.RemoveMentorException;
import com.techpedia.projectmanagement.exception.RemoveProjectFollowException;
import com.techpedia.projectmanagement.exception.RemoveTeamMembersException;
import com.techpedia.projectmanagement.exception.ReplaceTeamLeadException;
import com.techpedia.projectmanagement.exception.RequestToBeMentorException;
import com.techpedia.projectmanagement.exception.SaveProjectPhotoException;
import com.techpedia.projectmanagement.exception.ResubmitProjectException;
import com.techpedia.projectmanagement.exception.SearchProjectException;
import com.techpedia.projectmanagement.exception.SubmitProjectsException;
import com.techpedia.projectmanagement.exception.SuggestedBranchNotFoundException;
import com.techpedia.projectmanagement.exception.SuggestedFacultyNotFoundException;
import com.techpedia.projectmanagement.exception.SuggestedTeamMembersNotFoundException;
import com.techpedia.projectmanagement.exception.SuggestedkeywordsNotFoundException;
import com.techpedia.projectmanagement.exception.TeamCommentsNotFoundException;
import com.techpedia.projectmanagement.exception.UpdateProjectException;
import com.techpedia.projectmanagement.exception.UploadProjDocException;

/**
 * @author nishikant.singh
 *
 */
public interface ProjectDao {
	
	public abstract String UploadProjectPhoto(SaveProjectPhoto saveProjectPhoto) throws SaveProjectPhotoException;
	
	public abstract CreateProjectResponseVO createProject(Project project) throws CreateProjectException;

	public abstract ArrayList<String> getSuggestedkeywords(ArrayList<Integer> branchIds) throws SuggestedkeywordsNotFoundException;
	
	public abstract ArrayList<Team> getSuggestedTeamMembers(UserProfileVO userProfileVO) throws SuggestedTeamMembersNotFoundException;
	
	public abstract ArrayList<Branch> getSuggestedBranches(String term) throws SuggestedBranchNotFoundException;
	
	public abstract ArrayList<Faculty> getSuggestedFaculty(String userId) throws SuggestedFacultyNotFoundException;
	
	public abstract AddNewFacultyResponseVO addNewFaculty(FacultyVO facultyVO) throws AddNewFacultyException;
	
	public abstract String deleteProject(long projId) throws DeleteProjectException;
	
	public abstract Project getProjectDetails(long projId) throws GetProjectDetailsException;
	
	public abstract ArrayList<Project> getAllProject(String iterationCount) throws GetAllProjectException;
	
	public abstract ArrayList<UserProfileVO> getAllMentors(String iterationCount) throws GetAllMentorsException;
	
	public abstract String getPopularity(String rgstrId) throws GetPopularityException;
	
	public abstract String updateProject(Project project) throws UpdateProjectException;
	
	public abstract String addTeamMembers(ArrayList<TeamMember> teamMembers) throws AddTeamMembersException;
	
	public abstract String removeTeamMembers(ArrayList<TeamMember> teamMembers) throws RemoveTeamMembersException;
	
	public abstract ArrayList<Project> searchProjectByKeyword(SearchByKeyVO searchByKeyVO) throws SearchProjectException;
	
	public abstract String addNewMentor(MentorVO mentorVO) throws AddNewMentorException;

	public abstract String deleteMentor(MentorVO mentorVO) throws RemoveMentorException;
	
	public abstract String followTheProject(FollowProjectVO followProjectVO) throws FollowTheProjectException;

	public abstract ArrayList<ProjectTeamComment> displayTeamComments(DisplayTeamCommVO displayTeamCommVO) throws TeamCommentsNotFoundException;
	
	public abstract String addComment(AddCommVO addCommVO) throws AddCommentException;

	public abstract String deleteComment(DeleteCommVO deleteCommVO)throws RemoveCommentException;
	
	public abstract ArrayList<Project> getAllFollowedProject(String rgstrId) throws GetAllFollowedProjectException;
	
	public abstract String bulkUploadProject(String exlByteArray) throws BulkUploadException;
	
	public abstract ArrayList<ProjectTeamDetailVO> getDetailOfTeam(String teamId) throws GetDetailOfTeamException;
	
	public abstract String removeProjectFollow(ProjFollowVO projFollowVO) throws RemoveProjectFollowException;
	
	public abstract String checkProjectFollow(ProjFollowVO projFollowVO) throws CheckProjectFollowException;
	
	public abstract Project submitProject(ProjSubmit projSubmit) throws SubmitProjectsException;
	
	public abstract String uploadProjectDocument(UploadProjDocVO uploadProjDocVO) throws UploadProjDocException;
	
	public abstract ArrayList<ProjectDocument> downloadProjectDocument(DownloadDocVO downloadDocVO) throws DownloadProjDocException;
	
	public abstract ArrayList<ProjectTeamComment> displayOtherComments(DisplayTeamCommVO displayTeamCommVO) throws OtherCommentsNotFoundException;
	
	public abstract ArrayList<Project> getProjectsByLoggedInUser(String rgstrId) throws ProjectByLoggedInUserException;
	
	public abstract ArrayList<Project> getProjectFollowers() throws GetProjectFollowersException;
	
	public abstract String deleteProjectDocument(DeleteDocVO deleteDocVO) throws DeleteDocumentException;
	
	public abstract String facultyInitiatedProject(FacInitProjVO facInitProjVO) throws FacultyInitiatedProjectException;
	
	public abstract String facultyClosedProject(FacInitProjVO facInitProjVO) throws FacultyClosedProjectException;
	
	public abstract ArrayList<ProjectType> getProjectType() throws GetProjectTypeException;

	public abstract ArrayList<Project> getRecentProject() throws GetAllProjectException;
	
	public abstract ArrayList<Project> getLatestProject() throws GetAllProjectException;
	
	public abstract String bulkUploadProjectAsXLS(String fileName) throws BulkUploadException;

	public abstract ArrayList<Project> getProjectsByMacroBranch(DisplayProjectsMacroBranchVO displayProjectsMacroBranchVO) throws ProjectByLoggedInUserException;

	public abstract String replaceTeamLead(ReplaceTeamLead replaceTeamLead) throws ReplaceTeamLeadException;
	
	public abstract ArrayList<Project> getCompletedProject() throws GetAllProjectException;
	
	public abstract ArrayList<Project> getWorkingProject() throws GetAllProjectException;
	
	public abstract ArrayList<Project> getCompletedProjectByLoggedInUser(String rgstrId) throws ProjectByLoggedInUserException;
	
	public abstract ArrayList<Project> getWorkingProjectByLoggedInUser(String rgstrId) throws ProjectByLoggedInUserException;
	
	public abstract FacRejectProjResponse facultyRejectedProject(FacRejectProjVO facRejectProjVO) throws FacultyRejectedProjectException;

	public abstract ResubmitProjectResponse resubmitProject(String projId) throws ResubmitProjectException;

	public abstract FacultyMarkedProjectAsCompletedResponse facultyMarkedProjectAsCompleted(FacultyMarkedProjectAsCompletedVO FacultyMarkedProjectAsCompletedVO) throws FacultyMarkedProjectAsCompletedException;

	public abstract RequestToBeMentorResponse requestToBeMentor(RequestToBeMentorVO requestToBeMentorVO) throws RequestToBeMentorException;

	public abstract ApproveOrDeclineMentorRequestResponse approveOrDeclineMentorRequest(ApproveOrDeclineMentorRequestVO approveOrDeclineMentorRequestVO) throws ApproveOrDeclineMentorRequestException;

}
