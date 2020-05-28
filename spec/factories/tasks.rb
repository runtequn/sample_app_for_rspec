FactoryBot.define do
  factory :task do
    title { "title" }
    content { "content" }
    status { :todo }
    deadline { 1.week.from_now }
  end
end

