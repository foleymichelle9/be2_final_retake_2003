require "rails_helper"

RSpec.describe "Surgey Show Page" do
  it "I can click on any surgery title to take me to that surgery’s show page" do

    general = Hospital.create(name: "Grey Sloan Memorial Hospital", street: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "90801")

    meredith = general.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    karev = general.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    mcdreamy = general.doctors.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")

    appendectomy = Surgery.create!(title: "Appendectomy", day: "Monday", room: "237")
    colon = Surgery.create!(title: "Colon Replacement", day: "Friday", room: "247")
    neuro = Surgery.create!(title: "Head Removal", day: "Tuesday", room: "565")
    neonatal = Surgery.create!(title: "Baby Surgery", day: "Monday", room: "457")


    DoctorSurgery.create!(doctor: meredith, surgery: appendectomy)
    DoctorSurgery.create!(doctor: meredith, surgery: colon)
    DoctorSurgery.create!(doctor: mcdreamy, surgery: appendectomy)
    DoctorSurgery.create!(doctor: mcdreamy, surgery: neuro)
    DoctorSurgery.create!(doctor: karev, surgery: neonatal)

     visit "/surgeries"
    #
    click_link "#{appendectomy.title}"

    expect(current_path).to eq("/surgeries/#{appendectomy.id}")

    expect(page).to have_content(appendectomy.title)
    expect(page).to have_content("237")

    expect(page).to have_content("Number of doctors: 2")

    expect(page).to have_content("Other surgeries happening this day of the week")
    expect(page).to have_content(neonatal.title)

    #
    # And I see a section of the page that says "Other surgeries happening this day of the week:"
    # And under that header I see titles of all surgeries that happen on the same day of the week as this surgery.
  end
    it "Add A Doctor To This Surgery" do

      general = Hospital.create(name: "Grey Sloan Memorial Hospital", street: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "90801")

      meredith = general.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      karev = general.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      mcdreamy = general.doctors.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")

      appendectomy = Surgery.create!(title: "Appendectomy", day: "Monday", room: "237")
      colon = Surgery.create!(title: "Colon Replacement", day: "Friday", room: "247")
      neuro = Surgery.create!(title: "Head Removal", day: "Tuesday", room: "565")
      neonatal = Surgery.create!(title: "Baby Surgery", day: "Monday", room: "457")


      DoctorSurgery.create!(doctor: meredith, surgery: appendectomy)
      DoctorSurgery.create!(doctor: meredith, surgery: colon)
      DoctorSurgery.create!(doctor: mcdreamy, surgery: appendectomy)
      DoctorSurgery.create!(doctor: mcdreamy, surgery: neuro)
      DoctorSurgery.create!(doctor: karev, surgery: neonatal)

      visit "/surgeries/#{appendectomy.id}"

      expect(page).to have_content(appendectomy.title)
      expect(page).to have_content(appendectomy.day)

      fill_in "doctor_id", with: "#{karev.id}"

      click_button "Submit"

      expect(current_path).to eq("/surgeries/#{appendectomy.id}")
      expect(page).to have_content(karev.name)
    end
end




# User Story 3, Add a Doctor to a Surgery
# As a visitor
# When I visit a surgery's show page
# I see a surgery's title, date, and
# I see a field with instructions to "Add A Doctor To This Surgery"
# When I input a doctor's unique id into that field
# And click submit
# I'm taken back to that surgery's show page
# And I see the name of that doctor listed on the page

#*** section in show page****
