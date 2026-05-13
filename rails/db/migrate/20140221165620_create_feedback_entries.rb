class CreateFeedbackEntries < ActiveRecord::Migration
  def change
    create_table :feedback_entries do |t|
      t.string :field_id
      t.integer :user_id
      t.text :value
      t.string :status, default: 'new'
      t.string :post_id

      t.timestamps
    end
  end
end
