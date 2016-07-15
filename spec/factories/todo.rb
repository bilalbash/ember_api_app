FactoryGirl.define do

  # This will use the User class (Admin would have been guessed)
  factory :todo_1, class: Todo do
    title  "User"
    isCompleted true
  end

end