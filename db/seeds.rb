tempevents = []
tempusers = []
attendances = []

5000.times do |n|
  u = User.create(first_name:Faker::Name.first_name,last_name:Faker::Name.last_name,email:"#{n}@email.com",nickname:"nick#{n}",info:Faker::Hacker.say_something_smart,password_digest:"#{n}",bio:Faker::Lorem.sentence(30))
  tempusers << u.id
  if (1..100) === n
    v = u.venues.create(name:Faker::Company.name,info:Faker::Company.bs,address:Faker::Address.street_address,city:Faker::Address.city,state:Faker::Address.state,zip:Faker::Address.zip,country:Faker::Address.country)
    20.times do
      e = u.events.create(venue_id:v.id,name:Faker::Commerce.product_name,description:Faker::Company.catch_phrase)
      tempevents << e.id
      at = Attendance.where(user_id:u.id).where(event_id:e.id).take
      at.admin = true
      at.save
      attendances << [e.id,u.id]
    end
  end
end

10000.times do
  e = tempevents.sample
  u = tempusers.sample
  unless attendances.include?([e,u])
    Attendance.create(event_id:e,user_id:u)
    attendances << [e,u]
  else
    redo
  end
end
