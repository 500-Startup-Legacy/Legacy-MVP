FactoryGirl.define do  factory :subject do
    user_id 1
name "MyString"
email "MyString"
group_tag "MyString"
twilio_number "MyString"
  end
  

  factory :user do
    first_name 'Juan'
    last_name 'Smith'
    sequence(:email) { |n| "person_#{n}@example.com"}
    password 'foobar'
    sequence(:phone_number) { |n| (2222222222 + n).to_s }
    password_confirmation 'foobar'
  end

  factory :memory do
    content "MyText"
    memorialized_user_id 1
    user
  end

end


