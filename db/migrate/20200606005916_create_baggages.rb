class CreateBaggages < ActiveRecord::Migration[5.1]
  def change
    create_table :baggages do |t|
      t.integer :user_id
      t.integer :about_baggage_size_w
      t.integer :about_baggage_size_l
      t.integer :about_baggage_size_h
      t.integer :large_scale_baggage
      t.integer :heavy_weight_baggage
      t.integer :precision_machine_baggage
      t.integer :dont_reverse_baggage
      t.integer :broken_article
      t.integer :refrigerated_baggage
      t.integer :feezed_baggage

      t.timestamps
    end
  end
end
