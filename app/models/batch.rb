class Batch < ActiveRecord::Base
  belongs_to :course
  has_many :students
  has_many :term_dates
  has_and_belongs_to_many :examinations

  def current_term
    TermDate.where('batch_id = ? AND ? BETWEEN start_date AND end_date', self.id, Date.current).first
    .try(:term_structure_entry)
  end

  def syllabus
    Syllabus.where('course_id = ? AND ? >= EXTRACT(YEAR from created_at)', 
      self.course.id, self.start_date.year).last
  end  

  def papers(term = self.current_term)
    self.syllabus.programme_offerings.where(term_structure_entry: 1)
    .select(:paper_id).pluck(:paper_id).map{ |paper_id| Paper.find(paper_id) }
  end

  def to_s
    self.code
  end
end
