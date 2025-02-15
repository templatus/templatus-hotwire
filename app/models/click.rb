# == Schema Information
#
# Table name: clicks
#
#  id         :bigint           not null, primary key
#  ip         :inet             not null
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
                           Components::Click.new(
                             click: self,
                             will_animate: true,
                           ).call
  end
end
