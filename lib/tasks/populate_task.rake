namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
     Rake::Task['db:reset'].invoke
      set_faker_locale
      generate_patients
      generate_appointments
      generate_and_fill_records
    end
  end
    
  def set_faker_locale
    Faker::Config.locale = "pt-br"
  end

  def generate_patients
    99.times do |n|
      chars = 'abcdefghjkmnpqrstuvwxyz'
      email = Faker::Internet.email
      name  = Faker::Name.name
      address = Faker::Address.street_address
      city = Faker::Address.city
      state = Faker::Address.state
      postalcode = Faker::Address.zip_code
      dob = rand(10.years).ago
      rghc = "%06d" % rand(999999).to_s
      rghc << chars[rand(chars.size)].capitalize
      phone_nu = Faker::PhoneNumber.phone_number
      Patient.create!(name: name,
                      address: address,
                      city: city,
                      state: state,
                      postal_code: postalcode,
                      dob: dob,
                      rghc: rghc,
                      phone: phone_nu,
                      email: email)
      end
  end

def generate_appointments
    local = ["INRAD", "Instituto Central", "SCUT", "INCOR", "Ambulatorio-TX", "UTI"]
    type = ["Rotina", "Urgencia"]
    patients = Patient.all  
    patients.each do |patient| 
          30.times do
            patient.appointments.create!( local: local.sample, ap_date: time_rand, kind: type.sample) 
          end
    end

end


def generate_and_fill_records
  Patient.all.each do |patient|
      appointments = patient.appointments
      appointments.each do |appointment|
        appointment.records.create!( :content => Faker::Lorem.paragraph)
      end
  end
end

def time_rand (from = (Time.now-10.years), to = Time.now)
  Time.at(from + rand * (to.to_f - from.to_f))
end


