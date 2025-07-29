require 'faker'

# Clear data
Event.destroy_all
ExpenseReport.destroy_all
ServiceRequest.destroy_all
Ward.destroy_all

# Create 12 Wards
wards = Ward.create!([
  { name: "St. Boniface", district: "St. Boniface District" },
  { name: "St. Vital", district: "St. Vital District" },
  { name: "Charleswood", district: "Charleswood District" },
  { name: "North Kildonan", district: "North Kildonan District" },
  { name: "South Winnipeg", district: "South Winnipeg District" },
  { name: "River Heights", district: "River Heights District" },
  { name: "Elmwood", district: "Elmwood District" },
  { name: "Transcona", district: "Transcona District" },
  { name: "Daniel McIntyre", district: "Daniel McIntyre District" },
  { name: "Old Kildonan", district: "Old Kildonan District" },
  { name: "Point Douglas", district: "Point Douglas District" },
  { name: "Tuxedo", district: "Tuxedo District" }
])
puts "Created #{Ward.count} Wards."

# Service Requests
50.times do
  ServiceRequest.create!(
    category: ["Water", "Garbage & Recycling", "Street Maintenance"].sample,
    description: Faker::Lorem.sentence(word_count: 8),
    status: ["Open", "In Progress", "Closed"].sample,
    request_date: Faker::Date.backward(days: 90),
    ward: wards.sample,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
end

# Expenses
30.times do
  ExpenseReport.create!(
    category: ["CWA", "Supplies", "Travel"].sample,
    amount: Faker::Commerce.price(range: 20..500.0),
    report_date: Faker::Date.backward(days: 180),
    ward: wards.sample
  )
end

# Events
20.times do
  Event.create!(
    name: Faker::Music.band + " Concert",
    event_date: Faker::Date.forward(days: 60),
    location: Faker::Address.community,
    description: Faker::Lorem.sentence(word_count: 12),
    ward: wards.sample
  )
end

puts "Seeding completed successfully!"
