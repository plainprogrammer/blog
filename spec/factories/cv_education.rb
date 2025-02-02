FactoryBot.define do
  factory :cv_education, class: CV::Education do
    institution { "A School" }
    degree { "A Degree" }
    to_month { 5 }
    to_year { 2006 }
  end
end
