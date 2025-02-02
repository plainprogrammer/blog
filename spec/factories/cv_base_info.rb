FactoryBot.define do
  factory :cv_base_info, class: CV::BaseInfo do
    name { "John Doe" }
    subtitle { "Sr Software Engineer" }
    summary { "A short summary" }
  end
end
