class CreateSpaceships < ActiveRecord::Migration[6.0]
  def change
    create_table :spaceships do |t|
      t.references :user, null: false, foreign_key: true
      t.text :destination
      t.string :name
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
