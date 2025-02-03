FactoryBot.define do
  factory :cv_work_role, class: CV::WorkRole do
    title { "Boss" }
    summary { "I did awesome!" }
    position { 1 }
    association :work_tenure, factory: :cv_work_tenure
  end
end
