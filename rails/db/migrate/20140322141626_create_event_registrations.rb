class CreateEventRegistrations < ActiveRecord::Migration
  def change
    create_table :event_registrations do |t|
      t.integer :user_id
      t.string :event_url

      t.timestamps
    end
  end
end
