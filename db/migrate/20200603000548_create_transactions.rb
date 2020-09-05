class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :leaver_start_authenticate
      t.integer :receiver_start_authenticate
      t.integer :leaver_end_authenticate
      t.integer :receiver_end_authenticate
      t.datetime :started_at
      t.datetime :terminated_at
      t.decimal :leaver_point
      t.decimal :receiver_point
      t.integer :baggage_request_id
      t.integer :del_flag

      t.timestamps
    end
  end
end
