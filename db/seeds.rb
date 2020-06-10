# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

general = Hospital.create(name: "Grey Sloan Memorial Hospital", street: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "90801")
seaside = Hospital.create(name: "Seaside Health & Wellness Center", street: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")


meredith = general.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
bailey = seaside.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
karev = general.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
mcdreamy = general.doctors.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")


appendectomy = meredith.surgeries.create!(title: "Appendectomy", day: "Monday", room: "237")
colon = meredith.surgeries.create!(title: "Colon Replacement", day: "Friday", room: "247")
neuro = mcdreamy.surgeries.create!(title: "Head Removal", day: "Tuesday", room: "565")
neonatal = karev.surgeries.create!(title: "Baby Surgery", day: "Monday", room: "457")
