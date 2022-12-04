FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(last_name)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"太郎"}
    nationality           {"日本"}
    birthday              { "2000-01-24" }
  end
end
