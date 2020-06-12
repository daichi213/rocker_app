class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :item_name
      t.integer :item_num
      t.integer :leaver_id
      t.integer :receiver_id
      t.integer :leaver_authenticate
      t.integer :receiver_authenticate
      t.date :terminated_at
      t.decimal :leaver_point
      t.decimal :receiver_point
      t.text :request_content
      t.text :baggage_content
      t.text :transaction_message
      t.integer :large_scale_baggage
      t.integer :heavy_weight_baggage
      t.integer :precision_machine_baggage
      t.integer :dont_reverse_baggage
      t.integer :broken_article
      t.integer :refrigerated_baggage
      t.integer :feezed_baggage
      t.integer :about_baggage_size_w
      t.integer :about_baggage_size_l
      t.integer :about_baggage_size_h
      t.date :from_day
      t.time :from_time
      t.date :to_day
      t.time :to_time
      t.integer :amount_billed

      t.timestamps
    end
  end
end
