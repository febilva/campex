class Student < ActiveRecord::Base
  belongs_to :batch
  has_one :user, as: :profile

  def to_s
    self.name
  end

  def method_missing(method)
    self.user.try(method)
  end
end
