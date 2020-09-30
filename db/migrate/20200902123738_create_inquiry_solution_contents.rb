class CreateInquirySolutionContents < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiry_solution_contents do |t|
      t.integer :contentable_id
      t.string :contentable_type
      t.integer :read_flag
      t.text :content

      t.timestamps
    end
  end
end
