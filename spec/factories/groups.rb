FactoryBot.define do
  factory :group do
    name  {'test'}
    category_id  { 2 }

    after(:build) do |group|
      group.image.attach(io: File.open('app/assets/images/top-image.png'), filename: 'top-image.png')
    end
  end
end
