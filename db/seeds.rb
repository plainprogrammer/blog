# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

CV::WorkTenure.create_with(to_month: nil, to_year: nil, to_present: true)
              .find_or_create_by!(employer: "FCP Euro", from_month: 10, from_year: 2023).tap do |tenure|
  CV::WorkRole.find_or_create_by!(title: "Full Stack Engineer", position: 1, work_tenure: tenure, summary: <<-EOS)
Working with a small team including QA, DevOps, and engineering to develop new
search capabilities for our main e-commerce site, spearhead work to integrate
with a new data source for ensuring accurate product-to-vehicle fit matching.
Also supported the regular operations, maintenance, and improvement of the main
e-commerce site as well as a variety of back-office systems used in order
management and warehouse operations.
EOS
end

CV::WorkTenure.insert_all!([
  { employer: "Allied World Reinsurance Company", from_month: 1, from_year: 2022, to_month: 7, to_year: 2023, to_present: false },
  { employer: "Knowde", from_month: 8, from_year: 2021, to_month: 1, to_year: 2022, to_present: false },
  { employer: "Mavenlink", from_month: 4, from_year: 2019, to_month: 8, to_year: 2021, to_present: false },
  { employer: "Cingo Solutions", from_month: 1, from_year: 2019, to_month: 3, to_year: 2019, to_present: false },
  { employer: "Nav", from_month: 8, from_year: 2017, to_month: 12, to_year: 2018, to_present: false },
  { employer: "Mavenlink", from_month: 10, from_year: 2015, to_month: 8, to_year: 2017, to_present: false },
  { employer: "Nudge", from_month: 5, from_year: 2014, to_month: 10, to_year: 2015, to_present: false },
  { employer: "The Ready Project", from_month: 11, from_year: 2012, to_month: 5, to_year: 2014, to_present: false },
  { employer: "Robert Half Technology", from_month: 7, from_year: 2012, to_month: 6, to_year: 2013, to_present: false },
  { employer: "Ligonier Ministries", from_month: 10, from_year: 2011, to_month: 8, to_year: 2012, to_present: false },
  { employer: "Orabrush", from_month: 6, from_year: 2010, to_month: 10, to_year: 2011, to_present: false },
  { employer: "New Orleans Baptist Theological Seminary", from_month: 1, from_year: 2009, to_month: 5, to_year: 2010, to_present: false },
  { employer: "Prima Supply", from_month: 3, from_year: 2008, to_month: 1, to_year: 2009, to_present: false },
  { employer: "Stewart & Associates", from_month: 12, from_year: 2006, to_month: 10, to_year: 2007, to_present: false },
  { employer: "Oneida Baptist Institute", from_month: 5, from_year: 2006, to_month: 12, to_year: 2006, to_present: false },
  { employer: "Southern Baptist Theological Seminary", from_month: 10, from_year: 2005, to_month: 5, to_year: 2006, to_present: false },
  { employer: "New Orleans Baptist Theological Seminary", from_month: 11, from_year: 2003, to_month: 9, to_year: 2005, to_present: false }
])

CV::Education.insert_all!([
  { institution: "New Orleans Baptist Theological Seminary", degree: "BA Christian Ministry", to_month: 5, to_year: 2006 }
])
