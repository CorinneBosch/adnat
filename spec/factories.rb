FactoryBot.define do
  
  factory :user do
    name { "Rubeus Hagrid" }
    email { "butterbeerh@example.com" }
    password { "123123" }
  end

  factory :organisation do
    name { "Hogwarts" }
    hourly_rate { 18.00 }
  end

  # factory :shift do
  #   name { "Joe" }
  #   email { "joe@gmail.com" }
  #   password { "blah" }
  # end
end