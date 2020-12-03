# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Company.destroy_all

require 'csv'

csv_options = { col_sep: ',', headers: :first_row }
filepath = Rails.root.join('db', 'companies.csv')

puts 'Creating companies'
# companies = CSV.open(filepath, csv_options).map(&:to_h)
# companies.each do |company|
#    new_company = Company.new(
#    name: company['company_name'])
#    byebug
#   if company["logo"]
#     logo = File.open(Rails.root.join('db', 'logos', company['logo']))
#     new_company.photo.attach(io: logo, filename: company['logo'], content_type: 'image/png')
#     new_company.save!
#   end
# end
CSV.foreach(filepath, csv_options) do |row|
  puts row["company_name"]
  company = Company.new(
    name: row.fields.first)
  if row["logo"]
    logo = File.open(Rails.root.join('db', 'logos', row.fields.last))
    company.photo.attach(io: logo, filename: row.fields.last, content_type: 'image/png')
    company.save!
  end
end

puts 'done!'


