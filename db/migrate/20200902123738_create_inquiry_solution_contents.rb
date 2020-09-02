class CreateInquirySolutionContents < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiry_solution_contents do |t|
      t.integer :inquiry_id
      t.integer :solution_id
      t.text :content

      t.timestamps
    end
  end
end
