class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, 
         :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  mount_uploader :dp, ImageUploader

  belongs_to :profile, polymorphic: true
  has_and_belongs_to_many :roles

  validates :username,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    } # etc.

  validates :dp, file_size: { less_than: 150.kilobytes }

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

  def name
    "#{self.first_name} #{self.middle_name} #{self.last_name}"
  end

  def method_missing(method)
    self.profile.try(method) or super
  end
end
