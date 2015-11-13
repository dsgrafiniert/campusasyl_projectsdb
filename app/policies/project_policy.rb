class ProjectPolicy< ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    attr_reader :user, :scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user.admin?
        @scope
      else
        @scope
      end
    end
  end

  def new?
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

  def approve?
    update?
  end

  def participate?
    show?
  end

  def find_participants?
    true
  end

  def decline?
    create?
  end


end
