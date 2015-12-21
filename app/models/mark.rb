class Mark < ActiveRecord::Base
  belongs_to :registered_exam_paper
  belongs_to :created_by, class_name: "User"
end
