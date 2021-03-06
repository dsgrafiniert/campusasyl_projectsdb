class UserPolicy< ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    attr_reader :user, :scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user.try(:admin?)
        @scope
      else
        @scope = CityParticipation.where("city_id IN (?)", UsersCity.where(:user => current_user).collect{|e| e.city}.flatten.collect{|e| e.id}.join(', ')).collect{|e| e.participant}.flatten
      end
    end
  end

  def index?
    @current_user.admin? || UsersCity.where(:user => @current_user).size >0
  end

  def show?
    @current_user
  end

  def update?
    @current_user.admin? or @current_user == @user
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end

end
