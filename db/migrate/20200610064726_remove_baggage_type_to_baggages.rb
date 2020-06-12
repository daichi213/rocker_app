class RemoveBaggageTypeToBaggages < ActiveRecord::Migration[5.1]
  def change
    remove_column :baggages, :large_scale_baggage, :integer
    remove_column :baggages, :heavy_weight_baggage, :integer
    remove_column :baggages, :precision_machine_baggage, :integer
    remove_column :baggages, :dont_reverse_baggage, :integer
    remove_column :baggages, :refrigerated_baggage, :integer
    remove_column :baggages, :feezed_baggage, :integer
    remove_column :baggages, :broken_article, :integer
  end
end
