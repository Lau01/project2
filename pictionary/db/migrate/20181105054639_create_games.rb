class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :drawer_id
      t.integer :guesser_id
      t.integer :word_id
      t.integer :status
      t.string :result
      t.string :image

      t.timestamps
    end
  end
end
