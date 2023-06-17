require "factory_bot"

RSpec.configure do |config|
  config.include(FactoryBot::Syntax::Methods)
end

FactoryBot.define do
  factory :user do
    gender { %w(male female)[rand(2)] }
    salary { rand(1_000_001) }
  end
end
