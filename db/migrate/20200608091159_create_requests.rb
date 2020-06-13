class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :leaver_id
      t.integer :required_id
      t.integer :large_scale_baggage
      t.integer :heavy_weight_baggage
      t.integer :precision_machine_baggage
      t.integer :dont_reverse_baggage
      t.integer :broken_article
      t.integer :refrigerated_baggage
      t.integer :feezed_baggage
      t.date :from_day
      t.time :from_time
      t.date :to_day
      t.time :to_time
      t.text :request_content
      t.text :baggage_content
      t.text :transaction_message
      t.integer :about_baggage_size_w
      t.integer :about_baggage_size_l
      t.integer :about_baggage_size_h
      t.integer :approval_flag

      t.integer :del_flag

      t.timestamps
    end
  end
end
