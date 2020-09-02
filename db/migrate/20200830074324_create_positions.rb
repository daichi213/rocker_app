class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.integer :user_id
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
