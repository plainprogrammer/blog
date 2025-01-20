class CV::WorkRole < ApplicationRecord
  belongs_to :work_tenure, class_name: "CV::WorkTenure", foreign_key: "cv_work_tenures_id"

  validates :position, uniqueness: { scope: :cv_work_tenures_id }
end
