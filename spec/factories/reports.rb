FactoryBot.define do
  factory :report do
    date { '2020-1-1' }
    name { Faker::Name.name }
    purpose { Faker::Lorem.sentence }
    outcome { Faker::Lorem.sentence }
    action_plan { Faker::Lorem.sentence }
    other { Faker::Lorem.sentence }

    association :user
    # インスタンス生成後に画像を保存
    after(:build) do |report|
      report.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
