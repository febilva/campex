class District < ActiveRecord::Base
  belongs_to :state

  def to_s
    self.name
  end
end
