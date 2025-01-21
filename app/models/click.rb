# == Schema Information
#
# Table name: clicks
#
#  id         :integer          not null, primary key
#  ip         :string           not null
#  user_agent :string           not null
#  created_at :datetime         not null
#
class Click < ApplicationRecord
  validates :ip, presence: true
  validates :user_agent, presence: true

  after_create_commit do
    broadcast_prepend_to 'clicks',
                         target: 'list',
                         html:
                           ClickComponent.new(
                             click: self,
                             will_animate: true,
                           ).call
  end
end
