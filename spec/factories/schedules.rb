FactoryBot.define do
  factory :schedule do
    week_days { "Seg. a Sex." }
    hour { "06h às 22h" }

    association :location
  end
end
