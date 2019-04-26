FactoryGirl.define do
  factory :user do
    sequence(:email)    {|n| "person#{n}@sppl.com"}
    encrypted_password  "#{Devise::Encryptor.digest(User, 'password')}"
    password            "password"
    role                :user
  end
end

FactoryGirl.define do
  factory :admin, :parent => :user do
    sequence(:email)    {|n| "admin#{n}@sppl.com"}
    encrypted_password  "#{Devise::Encryptor.digest(User, 'password')}"
    password            "password"
    role                :admin
  end
end

