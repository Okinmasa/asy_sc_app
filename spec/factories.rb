FactoryGirl.define do
  factory :user do
    name     "Oki Masa"
    email    "oki@abc.com"
    password "foobar"
    password_confirmation "foobar"
  end
end