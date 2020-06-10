class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :leaver_id
      t.integer :required_id
      t.integer :transaction_id

      t.timestamps
    end
  end
end
