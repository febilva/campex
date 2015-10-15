class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def user_activities
    @user.roles.select(:activities).distinct.map(&:activities).flatten
  end

  def method_missing(name,*args)
    if name.to_s.last == '?'
      activity_allowed = user_activities.include?(name.to_s.gsub('?',''))
      activity_allowed = true if @user.profile_type == "Admin" and 
        name.to_s.split("_").last != "menu?"

      return activity_allowed
    else
      super
    end
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end