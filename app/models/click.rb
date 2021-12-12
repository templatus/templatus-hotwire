class Click < ApplicationRecord
  validates :ip, presence: true
  validates :user_agent, presence: true

  after_create_commit { broadcast_prepend_to 'clicks', target: 'list' }
end
