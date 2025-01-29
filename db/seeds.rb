# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

CV::BaseInfo.create(
  name:     "James Thompson",
  subtitle: "Hands-On Software Architect",
  summary:  %Q(
    Hands-on software engineer and architect with over 20 years experience
    building software for the web with extensive experience with Ruby on Rails
    (over 17 years). Committed to developing high quality software using agile
    practices including test-driven development, continuous integration, and
    pair programming. An active learner with a strong desire to coach and
    mentor colleagues as well as learn from them.
  )
)

education_yaml = YAML.load_file Rails.root.join("db", "seeds", "cv", "education.yml")
CV::Education.insert_all!(education_yaml)

work_tenure_yaml = YAML.load_file Rails.root.join("db", "seeds", "cv", "work_tenure.yml")
work_tenure_yaml.each do |tenure|
  roles = tenure.delete("roles") || []
  tenure = CV::WorkTenure.create!(tenure)

  roles.each do |role|
    CV::WorkRole.create!(role.merge(work_tenure: tenure))
  end
end
