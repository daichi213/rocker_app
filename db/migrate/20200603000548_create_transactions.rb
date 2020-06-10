class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :item_name
      t.integer :item_num
      t.integer :leaver_id
      t.integer :receiver_id
      t.boolean :leaver_authenticate
      t.boolean :receiver_authenticate
      t.date :terminated_at
      t.decimal :leaver_point
      t.decimal :receiver_point
      t.text :request_content
      t.text :baggage_content
      t.text :transaction_message
      t.boolean :large_scale_baggage
      t.boolean :heavy_weight_baggage
      t.boolean :precision_machine_baggage
      t.boolean :dont_reverse_baggage
      t.boolean :broken_article
      t.boolean :refrigerated_baggage
      t.boolean :feezed_baggage
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
