class Click < ApplicationRecord
  validates :ip, presence: true
  validates :user_agent, presence: true
end
