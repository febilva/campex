class Student < ActiveRecord::Base
  belongs_to :batch
  has_one :user, as: :profile

  accepts_nested_attributes_for :user

  def to_s
    self.name
  end

  def method_missing(method)
    self.user.try(method)
  end
end
