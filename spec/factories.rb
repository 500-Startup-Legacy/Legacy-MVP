FactoryGirl.define do  

  factory :user do
    first_name 'Juan'
    last_name 'Smith'
    sequence(:email) { |n| "person_#{n}@example.com"}
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :memory do
    content "MyText"
    user
    # memorialized_user_id 1
  end

end


