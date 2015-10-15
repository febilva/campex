class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, 
         :rememberable, :trackable, :validatable

  belongs_to :profile, polymorphic: true
  has_and_belongs_to_many :roles

  def name
    "#{self.first_name} #{self.middle_name} #{self.last_name}"
  end

  def method_missing(method)
    self.profile.try(method) or super
  end
end
