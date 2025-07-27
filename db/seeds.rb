# db/seeds.rb

# This file seeds the database with initial data for development and testing.
# It pulls real data from Winnipeg Open Data APIs and generates fake community events with Faker.

puts "Clearing existing data..."
ServiceRequest.destroy_all
ExpenseReport.destroy_all
Event.destroy_all
Ward.destroy_all

# -----------------------------
# Create Wards
# -----------------------------
puts "Creating Wards..."
wards = ["St. Boniface", "St. Vital", "Charleswood", "North Kildonan", "South Winnipeg"]

wards.each do |ward_name|
  Ward.create!(name: ward_name, district: "#{ward_name} District")
end
puts "Created #{Ward.count} Wards."

# -----------------------------
# Fetch 311 Service Requests
# -----------------------------
require 'httparty'

puts "Fetching 311 Service Requests..."
response = HTTParty.get('https://data.winnipeg.ca/resource/4her-3th5.json?$limit=100')
service_requests = JSON.parse(response.body)

service_requests.each do |row|
  ward = Ward.find_by(name: row["ward"]) || Ward.first
  ServiceRequest.create!(
    ward: ward,
    category: row["service_area"], # Map correctly to the API field
    description: row["service_request"] || "No description",
    status: "Open", # API does not return a status field, so default to "Open"
    request_date: row["sr_date"]
  )
end
puts "Created #{ServiceRequest.count} Service Requests."

# -----------------------------
# Fetch Councillor Expenses
# -----------------------------
puts "Fetching Councillor Expenses..."
response = HTTParty.get('https://data.winnipeg.ca/resource/mgde-4fua.json?$limit=100')
expenses = JSON.parse(response.body)

expenses.each do |row|
  ward = Ward.find_by(name: row["ward_office"]) || Ward.first
  ExpenseReport.create!(
    ward: ward,
    category: row["account"],       # Corrected key
    amount: row["amount"].to_f,
    report_date: row["journal_date"]
  )
end
puts "Created #{ExpenseReport.count} Expense Reports."

# -----------------------------
# Generate Community Events with Faker
# -----------------------------
require 'faker'

puts "Creating Community Events..."
Ward.all.each do |ward|
  10.times do
    Event.create!(
      ward: ward,
      name: Faker::Lorem.words(number: 3).join(" ").capitalize,
      location: Faker::Address.street_address,
      event_date: Faker::Date.forward(days: 30),
      description: Faker::Lorem.sentence(word_count: 8)
    )
  end
end
puts "Created #{Event.count} Events."

puts "Seeding complete! 🎉"
