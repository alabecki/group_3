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
  
  factory :jan, class: User do
    username "Jan"
    password "password"
    admin false
    activated true
    street_address "124 inlet st"
    city "burnaby"
    country "canada"
    email "jan@example.ca"
    lol true
    hots true
    
  end
  
  factory :pam, class: User do
    username "Pam"
    password "password"
    admin false
    activated true
    street_address "153 kensington ave"
    city "burnaby"
    country "canada"
    email "pam@example.ca"
    smite true
    dota2 true
    
  end
end