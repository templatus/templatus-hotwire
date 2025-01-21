# == Schema Information
#
# Table name: clicks
#
#  id         :integer          not null, primary key
#  ip         :string           not null
#  user_agent :string           not null
#  created_at :datetime         not null
#
FactoryBot.define do
  factory :click do
    sequence(:created_at) { |n| n.hours.ago }
    sequence(:ip) { |n| IPAddr.new(n, Socket::AF_INET).to_s }
    user_agent { 'Netscape Navigator' }
  end
end
