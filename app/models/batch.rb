class Batch < ActiveRecord::Base
  belongs_to :course
  has_many :students
  has_many :term_dates
  has_and_belongs_to_many :examinations

  def current_term
    TermDate.where('batch_id = ? AND ? BETWEEN start_date AND end_date', self.id, Date.current).first
    .try(:term_structure_entry)
  end

  def to_s
    self.code
  end
end
