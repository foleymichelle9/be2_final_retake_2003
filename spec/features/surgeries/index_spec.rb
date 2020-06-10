require "rails_helper"

RSpec.describe "Surgeries index page " do
  it "I see the title of all surgeries in my database" do

    general = Hospital.create(name: "Grey Sloan Memorial Hospital", street: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "90801")

    meredith = general.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    karev = general.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    mcdreamy = general.doctors.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")

    appendectomy = meredith.surgeries.create!(title: "Appendectomy", day: "Monday", room: "237")
    colon = meredith.surgeries.create!(title: "Colon Replacement", day: "Friday", room: "247")
    neuro = mcdreamy.surgeries.create!(title: "Head Removal", day: "Tuesday", room: "565")
    neonatal = karev.surgeries.create!(title: "Baby Surgery", day: "Monday", room: "457")

    visit "/surgeries"

    expect(page).to have_content(appendectomy.title)
    expect(page).to have_content(colon.title)
    expect(page).to have_content(neuro.title)
    expect(page).to have_content(neonatal.title)

    expect(page).to have_link("Add Surgery")
    click_link "Add Surgery"
    expect(current_path).to eq('/surgeries/new')


    fill_in 'title', with: 'Heart Surgery'
    fill_in 'day', with: 'Wednesday'
    fill_in 'room', with: '456'

    click_on 'Create Surgery'

    expect(current_path).to eq("/surgeries")
    expect(page).to have_content('Heart Surgery')
  end
end
