FactoryBot.define do
  factory :task do
    name { 'テストを書く' }
    description { 'Rspec&Cabybara&FactoryBotを準備する'}
    user
  end
end