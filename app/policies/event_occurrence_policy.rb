class EventOccurrencePolicy
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

  def show?
    return true
  end

  def attend?
    return (!(@event.event.project.is_private) || @event.event.project.participants.include?(@current_user))
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
