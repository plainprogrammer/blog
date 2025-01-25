# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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
