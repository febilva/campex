class Student < ActiveRecord::Base
  belongs_to :batch
  has_one :user, as: :profile

  def method_missing(method)
    self.user.try(method) or super
  end
end
