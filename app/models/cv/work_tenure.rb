class CV::WorkTenure < ApplicationRecord
  validates :from_month, inclusion: { in: 1..12 }
  validates :to_month, inclusion: { in: 1..12, allow_nil: true }

  has_many :roles, class_name: "CV::WorkRole", dependent: :destroy, foreign_key: :cv_work_tenures_id
end
