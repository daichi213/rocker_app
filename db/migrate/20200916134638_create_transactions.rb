class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :baggage_request_id
      t.integer :leaver_flag
      t.integer :del_flag

      t.timestamps
    end
  end
end
