class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :solved_flag
      t.integer :read_flag
      t.integer :del_flag

      t.timestamps
    end
  end
end
