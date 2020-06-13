class RemoveColumnBaggagetypeToRequests < ActiveRecord::Migration[5.1]
  def change
    remove_column :requests, :large_scale_baggage, :integer
    remove_column :requests, :heavy_weight_baggage, :integer
    remove_column :requests, :precision_machine_baggage, :integer
    remove_column :requests, :dont_reverse_baggage, :integer
    remove_column :requests, :refrigerated_baggage, :integer
    remove_column :requests, :feezed_baggage, :integer
    remove_column :requests, :broken_article, :integer
  end
end
