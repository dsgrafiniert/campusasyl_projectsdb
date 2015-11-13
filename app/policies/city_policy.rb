class CityPolicy
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
    create?
  end

  def create?
    @current_user.admin?
  end

  def show?
    return true
  end

  def update?
    create?
  end

  def edit?
    create?
  end

  def destroy?
    create?
  end

  def participate?
    true
  end

end
