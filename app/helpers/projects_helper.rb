module ProjectsHelper
  
  def participate_project_path(project)
    "/projects/#{project.id}/participate"
  end
  
  def approve_participant_path(project, participant)
    "/projects/#{project.id}/approve/#{participant.id}"
  end
  
  def decline_participant_path(project, participant)
    "/projects/#{project.id}/decline/#{participant.id}"
  end
  
  def find_participants_project_path(project)
    "/projects/#{project.id}/find_participants"
  end
  
  def project_invite_user_path(project, user)
    "/projects/#{project.id}/invite/#{user.id}"
  end
  
end
