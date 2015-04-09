FactoryGirl.define do

  factory :user do
    first_name 'Juan'
    last_name 'Smith'
    email 'juan@smith.com'
    password 'foobar'
    password_confirmation 'foobar'
  end

end

