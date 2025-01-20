class CV::Education < ApplicationRecord
  validates :to_month, inclusion: { in: 1..12 }
end
