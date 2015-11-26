class ClassTiming < ActiveRecord::Base
  has_many :periods
  
  def to_s
    self.name
  end
end
