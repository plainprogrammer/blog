FactoryBot.define do
  factory :work_tenure, class: CV::WorkTenure do
    employer { "Demo Inc." }
    start_date { Date.new(2024, 1, 1) }
    end_date { Date.new(2024, 12, 31) }

    trait :to_present do
      to_present { true }
      end_date { nil }
    end
  end
end
