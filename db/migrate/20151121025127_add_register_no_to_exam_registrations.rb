class AddRegisterNoToExamRegistrations < ActiveRecord::Migration
  def up
    add_column :exam_registrations, :register_no, :string

    # Populate Register Nos for existing registrations
    ExamRegistration.all.each do |registration|
      register_no = "M#{registration.student.batch}#{registration.student.roll_no}"
      registration.register_no = register_no
      registration.save
    end
  end

  def down
    remove_column :exam_registrations, :register_no, :string
  end
end
