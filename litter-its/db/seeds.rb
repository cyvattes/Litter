10.times {
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user_name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
    )}

25.times {
  Lit.create(
    user_id: rand(1..10),
    lit_text: Faker::Hipster.sentence
    )}
