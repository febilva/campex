class UserPolicy < ApplicationPolicy
  def dashboard?
    true
  end
  
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end
end
