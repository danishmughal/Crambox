class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :user_2
      t.boolean :accepted, :default => :false
      t.timestamps
    end
  end
end
