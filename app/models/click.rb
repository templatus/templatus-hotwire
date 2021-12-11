class Click < ApplicationRecord
  validates :ip, presence: true
  validates :user_agent, presence: true

  # There is no `updated_at` in the database
  def updated_at
    created_at
  end
end
