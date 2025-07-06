class CreateReadings < ActiveRecord::Migration[8.0]
  def change
    create_table :readings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.string :status
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
