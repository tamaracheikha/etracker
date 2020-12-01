# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Company.destroy_all

require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = Rails.root.join('db', 'companies.csv')

puts 'Creating companies'

CSV.foreach(filepath, csv_options) do |row|
  puts row["company name"]
  company = Company.new(
    name: row['company name'])
  if row["logo"]
    logo = File.open(Rails.root.join('db', 'logos', row['logo']))
    company.photo.attach(io: logo, filename: row['logo'], content_type: 'image/png')
    company.save!
  end
end

puts 'done!'


