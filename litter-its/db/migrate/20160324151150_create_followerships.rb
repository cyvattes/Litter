class CreateFollowerships < ActiveRecord::Migration
  def change
    create_table :followerships do |t|
      t.integer :follower_id
      t.integer :followee_id
    end
  end
end
