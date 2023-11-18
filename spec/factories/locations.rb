FactoryBot.define do
  factory :location do
    title { FFaker::AddressBR.city }
    content { FFaker::AddressBR.full_address }
    opened { [true, false].sample }
    mask { ["Obrigatório", "Recomendado"].sample }
    towel { ["Obrigatório", "Recomendado"].sample }
    fountain { ["Parcial", "Proibido"].sample }
    locker_room { ["Liberado", "Parcial", "Fechado"].sample }
  end
end
