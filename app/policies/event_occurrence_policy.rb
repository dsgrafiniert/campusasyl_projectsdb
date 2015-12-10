class EventOccurrencePolicy< ApplicationPolicy
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
    @current_user.admin?
  end
  
  def mine?
    return true
  end
  
  def decline?
    return true
  end

  def show?
    return true
  end

  def attend?
    return (!(@record.event.project.is_private) || @record.event.project.participants.include?(@current_user))
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
