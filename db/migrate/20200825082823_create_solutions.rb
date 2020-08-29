class CreateSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions do |t|
      t.text :content
      t.integer :inquiry_id
      t.integer :read_flag
      t.integer :del_flag

      t.timestamps
    end
  end
end
