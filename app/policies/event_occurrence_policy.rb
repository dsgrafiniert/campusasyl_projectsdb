class EventOccurrencePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @event = model
  end

  def index?
    return true
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
