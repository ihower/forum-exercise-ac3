class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|

      t.string :title
      t.text :content
      t.integer :comments_count, :default => 0
      t.integer :user_id

      t.timestamps
    end

    add_index :topics, :user_id

  end
end
