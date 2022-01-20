FactoryBot.define do
  factory :click do
    ip { '1.2.3.4' }
    user_agent { 'Netscape Navigator' }
  end
end
