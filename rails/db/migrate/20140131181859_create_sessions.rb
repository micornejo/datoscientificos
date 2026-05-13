class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :remote_ip
      t.string :user_agent
      t.timestamp :closed_at

      t.timestamps
    end
  end
end
