class CreateSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions do |t|
      t.integer :inquiry_id
      t.integer :del_flag

      t.timestamps
    end
  end
end
