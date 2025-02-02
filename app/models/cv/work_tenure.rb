class CV::WorkTenure < ApplicationRecord
  validates :from_month, inclusion: { in: 1..12 }
  validates :to_month, inclusion: { in: 1..12, allow_nil: true }

  has_many :roles, class_name: "CV::WorkRole", dependent: :destroy, foreign_key: :cv_work_tenures_id

  def start_date=(date)
    self.from_month = date.month
    self.from_year = date.year
  end

  def end_date=(date)
    self.to_month = date.month
    self.to_year = date.year
  end
end
