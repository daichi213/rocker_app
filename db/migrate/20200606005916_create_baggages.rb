class CreateBaggages < ActiveRecord::Migration[5.1]
  def change
    create_table :baggages do |t|
      t.integer :user_id
      t.integer :about_baggage_size_w
      t.integer :about_baggage_size_l
      t.integer :about_baggage_size_h
      t.boolean :large_scale_baggage
      t.boolean :heavy_weight_baggage
      t.boolean :precision_machine_baggage
      t.boolean :dont_reverse_baggage
      t.boolean :broken_article
      t.boolean :refrigerated_baggage
      t.boolean :feezed_baggage

      t.timestamps
    end
  end
end
