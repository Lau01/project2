class CreateDrawings < ActiveRecord::Migration[5.2]
  def change
    create_table :drawings do |t|
      t.text :image
      t.integer :user_id
      t.integer :word_id

      t.timestamps
    end
  end
end
