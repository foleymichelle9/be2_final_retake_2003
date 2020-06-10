# require 'rails_helper'
#
# RSpec.describe 'New Surgery' do
#   it " I’m taken to a new form to create a surgery" do
#
#     general = Hospital.create(name: "Grey Sloan Memorial Hospital", street: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "90801")
#
#     meredith = general.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
#     karev = general.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
#     mcdreamy = general.doctors.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")
#
#     appendectomy = meredith.surgeries.create!(title: "Appendectomy", day: "Monday", room: "237")
#     colon = meredith.surgeries.create!(title: "Colon Replacement", day: "Friday", room: "247")
#     neuro = mcdreamy.surgeries.create!(title: "Head Removal", day: "Tuesday", room: "565")
#     neonatal = karev.surgeries.create!(title: "Baby Surgery", day: "Monday", room: "457")
#
#     visit "/surgeries"
#
#
#
#   end
# end

# I also see a link to add a surgery
# When I click that link
# I’m taken to a new form to create a surgery
# When I fill in the form with a title, day of the week, and operating room number
# And hit submit
# I am taken back to the surgeries index page where I can see this new surgery’s title listed
