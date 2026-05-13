class UpdateFeedbackEntries < ActiveRecord::Migration
  def change
    remove_column :feedback_entries, :field_id
    remove_column :feedback_entries, :post_id
  end
end
