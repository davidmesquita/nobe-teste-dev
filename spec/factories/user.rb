FactoryBot.define do
  factory :user do
    email { 'teste@teste2' }
    password { "user1234" }
    amount { 1000 }
    finished_account {false}

   
  end
end