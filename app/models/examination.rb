class Examination < ActiveRecord::Base
  belongs_to :course
  belongs_to :syllabus
  belongs_to :term_structure_entry
  has_many :registrations, class_name: "ExamRegistration"
  has_and_belongs_to_many :batches

  def papers
    @programme_offerings = ProgrammeOffering.where(syllabus: self.syllabus,
     term_structure_entry: self.term_structure_entry)
    @papers = []
    @programme_offerings.each { |programme_offering| @papers << programme_offering.paper }
    @papers
  end

  def to_s
    self.code
  end
end
