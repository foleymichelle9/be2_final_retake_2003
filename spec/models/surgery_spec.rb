require "rails_helper"

RSpec.describe Surgery, type: :model do
  describe "relationships" do
    it { should have_many :doctor_surgeries}

    it {should have_many(:doctors).through(:doctor_surgeries)}
  end

  describe 'methods' do
    it 'same_day' do


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

            expect(appendectomy.same_day).to eq([neonatal])
    end
  end
end
