FactoryGirl.define do  
  

  factory :user do
    first_name 'Juan'
    last_name 'Smith'
    sequence(:email) { |n| "person_#{n}@example.com"}
    password 'foobar'
    password_confirmation 'foobar'
  end

end

