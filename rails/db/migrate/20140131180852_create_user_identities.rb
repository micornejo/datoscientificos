class CreateUserIdentities < ActiveRecord::Migration
  def change
    create_table :user_identities do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :nickname
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
