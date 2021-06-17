FactoryBot.define do
  factory :message do
    content  {'testtest'}
    association :user
    association :group

    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/test-image.png'), filename: 'test-image.png')
    end
  end
end
