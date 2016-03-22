FactoryGirl.define do
  factory :user do
    username "Jim"
    password "password"
    admin false
    activated true
    street_address "123 hastings st"
    city "burnaby"
    country "canada"
    email "qwerty@example.ca"
    lol true
    
  end

  factory :admin, class: User do
    username "Admin"
    password "password"
    admin true
    activated true
    street_address "123 university dr"
    city "burnaby"
    country "canada"
    email "admin@example.ca"
    dota2 true
  end
end