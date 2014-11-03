class CreateCategoryships < ActiveRecord::Migration
  def change
    create_table :categoryships do |t|

      t.integer :topic_id
      t.integer :category_id

      t.timestamps
    end

    add_index :categoryships, :topic_id
    add_index :categoryships, :category_id
  end

end
