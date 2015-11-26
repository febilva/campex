class Period < ActiveRecord::Base
  belongs_to :class_timing

  def duration
    "#{self.start_time} - #{self.end_time}"
  end

  def is_break?
    self.is_break ? "Yes" : "No"
  end

  def to_s
    self.name
  end
end
