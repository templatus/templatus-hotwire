class CreateClicks < ActiveRecord::Migration[7.0]
  def change
    create_table :clicks do |t|
      t.inet :ip, null: false
      t.string :user_agent, null: false
      t.datetime :created_at, precision: 6, null: false
    end
  end
end
