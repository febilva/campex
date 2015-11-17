class State < ActiveRecord::Base
  has_many :districts

  def to_s
    self.name
  end
end
