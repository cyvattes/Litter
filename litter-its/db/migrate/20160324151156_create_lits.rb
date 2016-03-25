class CreateLits < ActiveRecord::Migration
  def change
    create_table :lits do |t|
      t.integer :user_id
      t.string :lit_text, limit: 140

      t.timestamps(null: false)
    end
  end
end
