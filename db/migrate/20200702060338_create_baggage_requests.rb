class CreateBaggageRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :baggage_requests do |t|
      t.integer :user_id
      t.integer :large_scale_baggage
      t.integer :heavy_weight_baggage
      t.integer :precision_machine_baggage
      t.integer :dont_reverse_baggage
      t.integer :broken_article
      t.integer :refrigerated_baggage
      t.integer :feezed_baggage
      t.datetime :from_time
      t.datetime :from_time
      t.time :to_time
      t.text :request_content
      t.text :baggage_content
      t.text :transaction_message
      t.integer :about_baggage_size_w
      t.integer :about_baggage_size_l
      t.integer :about_baggage_size_h
      t.integer :leaver_start_authenticate
      t.integer :receiver_start_authenticate
      t.integer :leaver_end_authenticate
      t.integer :receiver_end_authenticate
      t.datetime :transaction_started_at
      t.datetime :transaction_terminated_at
      t.decimal :leaver_point
      t.decimal :receiver_point
      t.integer :approval_flag
      t.integer :cancelled_flag

      t.timestamps
    end
  end
end
