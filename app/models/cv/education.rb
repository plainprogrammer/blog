class CV::Education < ApplicationRecord
  validates :institution, presence: true
  validates :degree, presence: true
  validates :to_month, inclusion: { in: 1..12 }
end
