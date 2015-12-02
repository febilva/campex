class Designation < ActiveRecord::Base
  def to_s
    self.code
  end
end
