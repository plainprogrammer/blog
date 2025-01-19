class CV::WorkTenure < ApplicationRecord
  validates :from_month, inclusion: { in: 1..12 }
  validates :to_month, inclusion: { in: 1..12, allow_nil: true }
end
