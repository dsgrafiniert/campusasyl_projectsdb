class ProjectPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @project = model
  end

  def index?
    return true
  end

  def show?
    return true
  end
  
  def create?
    @current_user.admin? || @project.city.users.include?(@current_user)
  end

  def update?
    @current_user.admin?
  end
  
  def edit?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end

end
